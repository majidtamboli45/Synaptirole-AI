"""Train a spaCy NER model on the annotated resume dataset.

Reads char-span annotations from the annotated dataset (default
``Documents/Data_for_Project/resumes_annotated.jsonl``; override with
``CP_RESUME_DATASET`` env var or ``--dataset``), converts them to
token spans, splits into train/dev (stratified by domain), and runs
``spacy train``. Output: ``models/ner_resume_model``.

Usage:
    python scripts/train_resume_ner.py [--max-epochs 40]
    python scripts/train_resume_ner.py --dataset /path/to/resumes_annotated.jsonl
"""

import argparse
import json
import os
import random
import shutil
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import spacy  # noqa: E402

from app.config import MODEL_DIR  # noqa: E402

DEFAULT_DATASET = (
    Path.home()
    / "OneDrive"
    / "Documents"
    / "Data_for_Project"
    / "resumes_annotated.jsonl"
)

OUTPUT_DIR = MODEL_DIR / "ner_resume_model"
TRAIN_SPACY = MODEL_DIR / "ner_train.spacy"
DEV_SPACY = MODEL_DIR / "ner_dev.spacy"
CONFIG_PATH = MODEL_DIR / "ner_config.cfg"

DEV_PER_DOMAIN = 2  # 7 domains x 2 = 14 dev docs, 42 train docs


def load_records():
    records = []
    with open(DATASET_PATH, encoding="utf-8-sig") as fh:
        for line in fh:
            line = line.strip()
            if line:
                records.append(json.loads(line))
    return records


def make_doc(nlp, record):
    text = record["text"]
    doc = nlp.make_doc(text)
    spans = []
    dropped = 0
    for ent in record["entities"]:
        start, end = ent["start"], ent["end"]
        if start < 0 or end > len(text):
            dropped += 1
            continue
        span = doc.char_span(start, end, label=ent["label"], alignment_mode="expand")
        if span is None:
            span = doc.char_span(start, end, label=ent["label"], alignment_mode="contract")
        if span is not None:
            spans.append(span)
        else:
            dropped += 1

    spans = dedupe_spans(spans)
    if spans:
        doc.set_ents(spans)
    return doc, dropped


def dedupe_spans(spans):
    seen = set()
    result = []
    for span in sorted(spans, key=lambda s: (s.start, -(s.end - s.start))):
        key = (span.label_, span.start, span.end)
        if key in seen:
            continue
        seen.add(key)
        if any(not (s.end <= span.start or s.start >= span.end) and s.label_ != span.label_ for s in result):
            continue
        result.append(span)
    return result


def write_docbin(docs, path):
    from spacy.training.corpus import DocBin

    docbin = DocBin(store_user_data=True)
    for doc in docs:
        docbin.add(doc)
    docbin.to_disk(path)
    print(f"Wrote {len(docs)} docs -> {path}")


def init_config():
    cmd = [
        sys.executable,
        "-m", "spacy", "init", "config",
        "--lang", "en",
        "--pipeline", "ner",
        "--optimize", "efficiency",
        str(CONFIG_PATH),
        "--force",
    ]
    subprocess.run(cmd, check=True)


def train(max_epochs, batch_size):
    cmd = [
        sys.executable,
        "-m", "spacy", "train",
        str(CONFIG_PATH),
        "--output", str(OUTPUT_DIR),
        "--paths.train", str(TRAIN_SPACY),
        "--paths.dev", str(DEV_SPACY),
        "--training.max_epochs", str(max_epochs),
        "--training.batch_size", str(batch_size),
        "--training.eval_frequency", "200",
    ]
    subprocess.run(cmd, check=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dataset", default=os.getenv("CP_RESUME_DATASET", str(DEFAULT_DATASET)),
                        help="Path to resumes_annotated.jsonl")
    parser.add_argument("--max-epochs", type=int, default=40)
    parser.add_argument("--batch-size", type=int, default=24)
    parser.add_argument("--skip-init-config", action="store_true")
    args = parser.parse_args()

    global DATASET_PATH
    DATASET_PATH = Path(args.dataset)

    records = load_records()
    print(f"Loaded {len(records)} annotated resumes from {DATASET_PATH}")

    nlp = spacy.blank("en")
    docs = []
    total_dropped = 0
    for record in records:
        doc, dropped = make_doc(nlp, record)
        docs.append(doc)
        total_dropped += dropped
    print(f"Span conversions: {total_dropped} annotation(s) dropped")

    by_domain = defaultdict(list)
    for idx, record in enumerate(records):
        by_domain[record["domain"]].append(idx)
    rng = random.Random(42)
    dev_set = set()
    for domain, indices in by_domain.items():
        rng.shuffle(indices)
        dev_set.update(indices[:DEV_PER_DOMAIN])
    docs_train = [d for i, d in enumerate(docs) if i not in dev_set]
    docs_dev = [d for i, d in enumerate(docs) if i in dev_set]

    labels = sorted({s.label_ for d in docs for s in d.ents})
    print(f"Labels in dataset: {labels}")
    print(f"Split: {len(docs_train)} train / {len(docs_dev)} dev")

    write_docbin(docs_train, TRAIN_SPACY)
    write_docbin(docs_dev, DEV_SPACY)

    if not args.skip_init_config:
        print("Generating spaCy config ...")
        init_config()

    print("Training (this may take a few minutes) ...")
    train(args.max_epochs, args.batch_size)

    last = OUTPUT_DIR / "model-last"
    final = OUTPUT_DIR / "final"
    if final.exists():
        shutil.rmtree(final)
    model = last if last.exists() else OUTPUT_DIR
    print(f"\nTrained model: {model}")
    print("Override SPACY_MODEL env / config RESUME_NER_MODEL to point here, or it is auto-discovered.")


if __name__ == "__main__":
    main()