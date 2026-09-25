import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from app.config import KNOWLEDGE_DIR
from app.rag.document_loader import load_knowledge_base
from app.rag.embedding_model import get_embedding_model
from app.rag.vector_database import build_index


def main() -> int:
    parser = argparse.ArgumentParser(description="Build a per-skill RAG FAISS index")
    parser.add_argument("skill", help="Skill name (e.g. python, java, docker)")
    parser.add_argument(
        "--folder",
        default=None,
        help="Source folder (default: data/knowledge_base/Technical_Docs/<skill>)",
    )
    args = parser.parse_args()

    folder = Path(args.folder) if args.folder else KNOWLEDGE_DIR / "Technical_Docs" / args.skill
    if not folder.exists():
        print(f"[error] source folder not found: {folder}")
        return 1

    print(f"[1/3] Loading documents from {folder} ...")
    chunks = load_knowledge_base(folder, topic=args.skill)
    if not chunks:
        print("[error] no documents found to index")
        return 1

    print(f"[2/3] Embedding {len(chunks)} chunks ...")
    model = get_embedding_model()
    if model is None:
        print("[error] embedding model not available (install sentence-transformers)")
        return 1
    embeddings = model.encode([c["text"] for c in chunks], show_progress_bar=True)

    print(f"[3/3] Building FAISS index for skill '{args.skill}' ...")
    build_index(args.skill, chunks, embeddings)
    print(f"[done] index ready -> data/rag/indexes/{args.skill}/")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())