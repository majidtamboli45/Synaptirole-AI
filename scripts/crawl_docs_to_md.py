import argparse
import hashlib
import html as htmlmod
import re
import sys
import time
from pathlib import Path
from urllib.parse import urljoin, urlparse

import requests
import trafilatura

USER_AGENT = "CareerPilotKB/1.0"
DELAY_SECONDS = 1.0

LINK_TEXT_EXCLUDES = (
    "login",
    "sign up",
    "sign in",
    "practice",
    "corporate",
    "write",
    "improve",
    "suggest",
    "report",
    "privacy",
    "refund",
    "terms",
    "about us",
    "about",
    "careers",
    "advertise",
    "press",
    "contact us",
    "python quiz",
    "copyright",
    "license",
    "donate",
    "bugs",
    "print",
    "download stats",
)
PATH_EXCLUDES = (
    "index",
    "print",
    "about",
    "bugs",
    "copyright",
    "license",
    "donate",
    "genindex",
    "py-modindex",
    "search",
    "glossary",
)
TITLE_PARTS_EXCLUDES = (
    "python quiz",
    "top",
    "interview",
    "most asked",
)
SPLIT_MARKERS = (" — ", " \u2013 ", " | ", " - ", "::", " – ", "\u2014 ")


def _slugify(text: str) -> str:
    text = re.sub(r"[^A-Za-z0-9]+", "_", text).strip("_")
    parts = re.split(r"[_]+", text)
    parts = [p for p in parts if p]
    seen = set()
    out = []
    for p in parts:
        low = p.lower()
        if low in seen or not low:
            continue
        seen.add(low)
        if low in ("python", "programming", "language", "tutorial", "introduction", "learn", "gfg"):
            continue
        out.append(p)
    return "_".join(out) if out else "page"


POISONED_URLS: set[str] = {
    # Known pages whose content makes chunk_text raise MemoryError (allocator
    # corruption artifact). Skipped on crawl so they are never written again.
    "https://www.geeksforgeeks.org/mysql/mysql-cursors",
    "https://www.geeksforgeeks.org/deep-learning/understanding-gradient-clipping",
    "https://www.geeksforgeeks.org/nlp/sentiment-classification-using-bert",
    "https://www.geeksforgeeks.org/nlp/text-preprocessing-for-nlp-tasks",
    "https://www.geeksforgeeks.org/reactjs/job-board-using-react",
    "https://www.geeksforgeeks.org/node-js/node-js-assert-complete-reference",
    "https://www.geeksforgeeks.org/node-js/unit-testing-of-node-js-application",
    # Course landing pages (pure ad copy, no technical content)
    "https://www.geeksforgeeks.org/courses/aws-certified-cloud-practitioner-exam-certification-course",
    "https://www.geeksforgeeks.org/git/how-to-create-a-new-branch-in-git-and-push-the-code",
}


def _fetch(url: str) -> str | None:
    try:
        resp = requests.get(url, headers={"User-Agent": USER_AGENT}, timeout=30)
        resp.raise_for_status()
        return resp.content.decode("utf-8", errors="replace")
    except Exception as exc:
        print(f"  [warn] fetch failed: {url} -> {exc}", file=sys.stderr)
        return None


def _extract_title(html: str, url: str, docs_style: bool = False) -> str:
    title = ""
    m = re.search(r"<title[^>]*>(.*?)</title>", html, re.IGNORECASE | re.DOTALL)
    if m:
        title = htmlmod.unescape(re.sub(r"\s+", " ", m.group(1)).strip())
    if docs_style:
        for marker in SPLIT_MARKERS:
            if marker in title:
                title = title.split(marker)[0].strip()
                break
        title = re.sub(r"^(?:\d+\.?)+[\s\u00a0]+", "", title).strip()
    else:
        segments = re.split(r"\s+[-|:]\s+", title)
        segments = [s for s in segments if s.strip()]
        segments = [s for s in segments if s.strip().lower() not in ("geeksforgeeks", "geeks for geeks")]
        title = max(segments, key=len) if segments else title
    if not title:
        title = urlparse(url).path.strip("/").split("/")[-1]
    for ex in TITLE_PARTS_EXCLUDES:
        if ex in title.lower():
            title = re.sub(re.escape(ex), "", title, flags=re.IGNORECASE).strip()
    return title or "page"


def _extract_body(html: str) -> str | None:
    text = trafilatura.extract(
        html,
        include_comments=False,
        include_tables=True,
        include_links=False,
        include_images=False,
        favor_precision=True,
    )
    if text is None:
        return None
    text = text.replace("\u00b6", "").replace("\u00c2", "").replace("\u00a0", " ")
    return text


def _to_md(html: str, title: str, url: str) -> str:
    text = _extract_body(html) or ""
    body = text.strip()
    header = f"# {title}\n\n> Source: {url}\n\n"
    return header + body + "\n"


def _is_section_link(href: str, current_host: str) -> bool:
    if not href:
        return False
    parsed = urlparse(href)
    if parsed.scheme not in ("http", "https"):
        return False
    if parsed.netloc and parsed.netloc != current_host:
        return False
    return True


def _child_links(html: str, base_url: str, path_prefix: str) -> list[tuple[str, str]]:
    from bs4 import BeautifulSoup

    soup = BeautifulSoup(html, "html.parser")
    host = urlparse(base_url).netloc
    base_path = urlparse(base_url).path.rstrip("/")

    links = []
    for a in soup.find_all("a", href=True):
        text = re.sub(r"\s+", " ", a.get_text(" ", strip=True)).strip()
        if not text:
            continue
        low = text.lower()
        if any(ex in low for ex in LINK_TEXT_EXCLUDES):
            continue
        href = urljoin(base_url, a["href"]).split("#")[0]
        if not _is_section_link(href, host):
            continue
        path = urlparse(href).path.rstrip("/")
        if not path.startswith(path_prefix):
            continue
        if path == base_path:
            continue
        if any(tok in path for tok in PATH_EXCLUDES):
            continue
        links.append((href, text))
    return links


def _dedupe(items: list[tuple[str, str]]) -> list[tuple[str, str]]:
    seen = set()
    out = []
    for url, text in items:
        key = url.rstrip("/")
        if key not in seen:
            seen.add(key)
            out.append((url, text))
    return out


def _safe_name(title: str, name_prefix: str) -> str:
    slug = _slugify(title)
    if not slug:
        slug = "page"
    return f"{name_prefix}_{slug.lower()}.md"


def _dedupe_file(out_dir: Path, candidate: Path, url: str) -> Path | None:
    if not candidate.exists():
        return candidate
    try:
        head = candidate.read_text(encoding="utf-8", errors="ignore")[:400]
        if f"> Source: {url}" in head:
            return None
    except Exception:
        pass
    h = hashlib.sha1(url.encode("utf-8")).hexdigest()[:6]
    return out_dir / f"{candidate.stem}_{h}.md"


def _index_saved_urls(out_dir: Path) -> dict[str, str]:
    saved = {}
    if not out_dir.exists():
        return saved
    for f in out_dir.glob("*.md"):
        try:
            head = f.read_text(encoding="utf-8", errors="ignore")[:400]
        except Exception:
            continue
        for line in head.splitlines():
            if line.startswith("> Source:"):
                url = line.replace("> Source:", "").strip()
                saved[url.rstrip("/")] = f.name
                break
    return saved


def crawl_seed(
    url: str,
    out_dir: Path,
    follow_children: bool,
    max_pages: int,
    name_prefix: str,
    path_prefix: str,
    docs_style: bool,
    max_depth: int = 1,
) -> int:
    """BFS crawl. depth 0 = seed; 1 = direct children (old behavior);
    2 = also expand children-of-children (needed for section hub pages
    like GfG /machine-learning/ where categories link to the real articles)."""
    out_dir.mkdir(parents=True, exist_ok=True)
    saved_urls = _index_saved_urls(out_dir)
    html = _fetch(url)
    if html is None:
        print(f"[error] seed page unreachable: {url}", file=sys.stderr)
        return 0

    title = _extract_title(html, url, docs_style=docs_style)
    out_file = _dedupe_file(out_dir, out_dir / _safe_name(title, name_prefix), url)
    if out_file is not None:
        out_file.write_text(_to_md(html, title, url), encoding="utf-8")
        print(f"[ok] {out_file.name}  (1/{max_pages})")
        saved = 1
        saved_urls[url.rstrip("/")] = out_file.name
    else:
        print(f"[skip] {_safe_name(title, name_prefix)} (seed already saved)")
        saved = 0

    if not follow_children:
        return saved

    children = _dedupe(_child_links(html, url, path_prefix))
    print(f"[info] found {len(children)} section links under {url}")

    children = [c for c in children if c[0].rstrip("/") not in POISONED_URLS]

    try:
        queue = [(u, 1) for u, _ in children]
        seen_urls = {url}
        while queue and saved < max_pages:
            child_url, depth = queue.pop(0)
            child_url_key = child_url.rstrip("/")
            if child_url_key in seen_urls:
                continue
            if child_url_key in saved_urls:
                continue
            seen_urls.add(child_url_key)
            time.sleep(DELAY_SECONDS)

            child_html = _fetch(child_url)
            if child_html is None:
                continue
            child_title = _extract_title(child_html, child_url, docs_style=docs_style)
            child_file = _dedupe_file(out_dir, out_dir / _safe_name(child_title, name_prefix), child_url)
            if child_file is None:
                print(f"  [skip] {_safe_name(child_title, name_prefix)} (already saved)")
            else:
                child_file.write_text(_to_md(child_html, child_title, child_url), encoding="utf-8")
                print(f"  [ok] {child_file.name}  ({saved + 1}/{max_pages})")
                saved += 1

            if depth < max_depth:
                time.sleep(DELAY_SECONDS)
                deeper = _dedupe(_child_links(child_html, child_url, path_prefix))
                queue.extend((u, depth + 1) for u, _ in deeper)
    except KeyboardInterrupt:
        print("[warn] interrupted; partial crawl saved", file=sys.stderr)

    return saved


def main() -> int:
    parser = argparse.ArgumentParser(description="Crawl tutorial URLs and save clean .md files")
    parser.add_argument("url", help="Seed tutorial URL to crawl")
    parser.add_argument("--out", default="knowledge_base/Technical_Docs/Python", help="Output folder")
    parser.add_argument("--no-recursive", action="store_true", help="Only save the seed page")
    parser.add_argument("--max-pages", type=int, default=40, help="Max pages to save")
    parser.add_argument("--name-prefix", default="gfg", help="Filename prefix (e.g. gfg, docs)")
    parser.add_argument("--path-prefix", default="/python/", help="Only follow links whose path starts with this")
    parser.add_argument("--docs-style", action="store_true", help="docs.python.org style titles/naming")
    parser.add_argument("--max-depth", type=int, default=1, help="Expand links up to this depth (1 = children only)")
    args = parser.parse_args()

    out_dir = Path(args.out)
    saved = crawl_seed(
        url=args.url,
        out_dir=out_dir,
        follow_children=not args.no_recursive,
        max_pages=args.max_pages,
        name_prefix=args.name_prefix,
        path_prefix=args.path_prefix,
        docs_style=args.docs_style,
        max_depth=args.max_depth,
    )
    print(f"\n[done] {saved} files saved to {out_dir.resolve()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())