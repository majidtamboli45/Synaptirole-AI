import json
from pathlib import Path
from app.config import KNOWLEDGE_DIR
from app.utils import get_logger

logger = get_logger("synonym_map")

_SYNONYM_DATA: dict[str, list[str]] = {
    "python": ["python3", "python programming", "cpython"],
    "java": ["java programming", "jdk", "jvm"],
    "javascript": ["js", "ecmascript", "es6", "es2015"],
    "typescript": ["ts"],
    "c++": ["cpp", "c plus plus"],
    "c#": ["csharp", "c sharp", ".net"],
    "ruby": ["ruby on rails", "rails"],
    "go": ["golang"],
    "rust": ["rust programming"],
    "kotlin": ["kotlin programming"],
    "swift": ["swift programming"],
    "php": ["php programming"],
    "scala": ["scala programming"],
    "r": ["r programming", "r language"],
    "matlab": ["matlab programming"],
    "html": ["html5", "hypertext markup language"],
    "css": ["css3", "cascading style sheets"],
    "sass": ["scss"],
    "less": ["less css"],
    "react": ["reactjs", "react.js"],
    "angular": ["angularjs", "angular.js"],
    "vue": ["vuejs", "vue.js"],
    "svelte": ["sveltejs", "svelte.js"],
    "next.js": ["nextjs", "next"],
    "nuxt.js": ["nuxtjs", "nuxt"],
    "node.js": ["nodejs", "node"],
    "express": ["expressjs", "express.js"],
    "django": ["django framework"],
    "flask": ["flask framework"],
    "fastapi": ["fast api"],
    "spring": ["spring boot", "spring framework", "spring mvc"],
    "laravel": ["laravel framework"],
    "ruby on rails": ["rails"],
    "sql": ["structured query language"],
    "mysql": ["my sql"],
    "postgresql": ["postgres", "psql"],
    "mongodb": ["mongo"],
    "redis": ["redis cache"],
    "elasticsearch": ["elastic search", "es"],
    "cassandra": ["apache cassandra"],
    "dynamodb": ["dynamo db"],
    "sqlite": ["sqlite3"],
    "oracle db": ["oracle database"],
    "aws": ["amazon web services", "amazon aws"],
    "azure": ["microsoft azure", "azure cloud"],
    "gcp": ["google cloud platform", "google cloud"],
    "docker": ["docker container", "dockerfile", "docker compose"],
    "kubernetes": ["k8s", "kube"],
    "jenkins": ["jenkins ci"],
    "git": ["github", "gitlab", "bitbucket", "version control", "git actions"],
    "ci/cd": ["cicd", "continuous integration", "continuous deployment", "continuous delivery", "pipeline"],
    "terraform": ["infrastructure as code", "iac"],
    "ansible": ["ansible automation"],
    "puppet": ["puppet automation"],
    "machine learning": ["ml", "machinelearning"],
    "deep learning": ["dl", "deeplearning"],
    "nlp": ["natural language processing", "natural language understanding", "nlu"],
    "computer vision": ["cv", "image processing"],
    "reinforcement learning": ["rl"],
    "supervised learning": ["classification", "regression"],
    "unsupervised learning": ["clustering", "dimensionality reduction"],
    "generative ai": ["gen ai", "genai", "generative artificial intelligence"],
    "large language model": ["llm", "large language models"],
    "transformer": ["transformers", "attention mechanism", "self-attention"],
    "bert": ["bidirectional encoder representations from transformers"],
    "gpt": ["generative pre-trained transformer", "chatgpt"],
    "diffusion model": ["stable diffusion", "diffusion models"],
    "rag": ["retrieval augmented generation", "retrieval-augmented generation"],
    "fine-tuning": ["finetuning", "fine tuning", "transfer learning"],
    "prompt engineering": ["prompt design", "prompting"],
    "langchain": ["lang chain"],
    "llamaindex": ["llama index"],
    "huggingface": ["hugging face", "huggingface transformers"],
    "tensorflow": ["tf", "tensorflow2"],
    "pytorch": ["torch", "py torch"],
    "keras": ["keras deep learning"],
    "scikit-learn": ["sklearn", "scikit learn", "scikitlearn"],
    "pandas": ["pd", "pandas dataframe"],
    "numpy": ["np", "numerical python"],
    "matplotlib": ["matplotlib plotting"],
    "seaborn": ["sns"],
    "xgboost": ["xgb", "extreme gradient boosting"],
    "lightgbm": ["lgbm", "light gradient boosting"],
    "catboost": ["cat boost"],
    "shap": ["shap values", "shapley"],
    "opencv": ["open computer vision", "cv2"],
    "mediapipe": ["media pipe"],
    "librosa": ["audio analysis"],
    "faiss": ["facebook ai similarity search", "vector search"],
    "pinecone": ["pinecone vector db"],
    "weaviate": ["weaviate vector db"],
    "chromadb": ["chroma db", "chroma"],
    "agile": ["agile methodology", "agile development", "agile software"],
    "scrum": ["scrum methodology", "scrum master"],
    "kanban": ["kanban board"],
    "jira": ["atlassian jira"],
    "confluence": ["atlassian confluence"],
    "rest": ["restful", "rest api", "rest apis"],
    "graphql": ["graph ql"],
    "grpc": ["g rpc", "remote procedure call"],
    "microservices": ["microservices architecture", "soa", "service oriented architecture"],
    "linux": ["linux os", "ubuntu", "debian", "centos", "redhat"],
    "bash": ["bash scripting", "shell scripting", "shell"],
    "powershell": ["pwsh"],
    "webpack": ["bundler"],
    "vite": ["vitejs", "vite.js"],
    "npm": ["node package manager"],
    "pip": ["python package installer"],
    "pyinstaller": ["python packaging"],
    "kafka": ["apache kafka", "event streaming"],
    "rabbitmq": ["message queue"],
    "nginx": ["reverse proxy"],
    "apache": ["apache http server"],
    "graphql": ["graph ql", "apollo"],
    "websocket": ["web socket", "ws"],
    "oauth": ["oauth2", "oauth 2.0"],
    "jwt": ["json web token", "json web tokens"],
    "ssl": ["tls", "https", "encryption"],
    "cybersecurity": ["cyber security", "information security", "infosec"],
    "penetration testing": ["pentest", "pen testing"],
    "owasp": ["open web application security project"],
    "data science": ["ds", "data scientist"],
    "data engineering": ["data pipeline", "etl", "data warehouse"],
    "data analysis": ["data analytics", "analytics"],
    "data visualization": ["dataviz", "data viz", "tableau", "power bi"],
    "business intelligence": ["bi", "bi tools"],
    "etl": ["extract transform load", "data pipeline"],
    "big data": ["hadoop", "spark", "apache spark"],
    "spark": ["apache spark", "pyspark"],
    "hadoop": ["apache hadoop", "hdfs"],
    "airflow": ["apache airflow", "workflow orchestration"],
    "dbt": ["data build tool"],
    "snowflake": ["snowflake data warehouse"],
    "redshift": ["amazon redshift"],
    "bigquery": ["google bigquery"],
    "terraform": ["hashicorp terraform"],
    "prometheus": ["monitoring"],
    "grafana": ["dashboards", "visualization"],
    "elk stack": ["elasticsearch logstash kibana"],
    "devops": ["devops engineering", "devsecops"],
    "sre": ["site reliability engineering", "site reliability"],
    "platform engineering": ["internal developer platform"],
    "blockchain": ["distributed ledger", "web3"],
    "ethereum": ["eth", "smart contracts", "solidity"],
    "rust": ["systems programming"],
    "figma": ["ui design", "ux design", "figma design"],
    "user experience": ["ux", "user research"],
    "user interface": ["ui", "ui design"],
    "product management": ["product owner", "pm"],
    "project management": ["project manager"],
    "technical writing": ["documentation", "tech writing"],
    "leadership": ["team lead", "tech lead", "engineering manager"],
    "communication": ["verbal communication", "written communication"],
    "problem solving": ["critical thinking", "analytical thinking"],
    "teamwork": ["collaboration", "team player"],
    "time management": ["prioritization"],
    "mlops": ["machine learning operations", "ml ops"],
    "model deployment": ["model serving", "model inference"],
    "a/b testing": ["ab testing", "experimentation"],
    "statistical analysis": ["statistics", "hypothesis testing"],
    "regression analysis": ["linear regression", "logistic regression"],
    "time series": ["forecasting", "arima", "prophet"],
    "recommendation system": ["recommender system", "collaborative filtering"],
    "anomaly detection": ["outlier detection", "fraud detection"],
    "feature engineering": ["feature selection", "feature extraction"],
    "model optimization": ["hyperparameter tuning", "grid search"],
    "cnn": ["convolutional neural network", "convolutional neural networks"],
    "rnn": ["recurrent neural network", "recurrent neural networks"],
    "lstm": ["long short-term memory"],
    "gan": ["generative adversarial network"],
    "autoencoder": ["auto encoder", "vae", "variational autoencoder"],
    "yolo": ["real-time object detection"],
    "ocr": ["optical character recognition"],
    "text mining": ["text analytics"],
    "sentiment analysis": ["opinion mining"],
    "chatbot": ["conversational ai", "virtual assistant"],
    "speech recognition": ["voice recognition", "asr", "automatic speech recognition"],
    "text-to-speech": ["tts", "speech synthesis"],
    "multimodal": ["multi-modal", "vision-language"],
    "edge computing": ["edge ml", "on-device"],
    "iot": ["internet of things", "embedded systems"],
    "robotics": ["robot framework"],
    "simulation": ["digital twin"],
    "quantum computing": ["quantum mechanics", "qubits"],
    "augmented reality": ["ar", "mixed reality"],
    "virtual reality": ["vr", "immersive"],
    "3d modeling": ["3d design", "blender"],
    "game development": ["unity", "unreal engine"],
    "api design": ["api development", "restful api"],
    "microservices": ["distributed systems"],
    "event-driven": ["event sourcing", "cqrs"],
    "caching": ["cache", "memcached"],
    "search engine optimization": ["seo"],
    "load testing": ["performance testing", "stress testing"],
    "test automation": ["automated testing", "selenium"],
    "unit testing": ["pytest", "junit", "test-driven development", "tdd"],
    "code review": ["peer review"],
    "refactoring": ["code quality", "clean code"],
    "design patterns": ["software design patterns", "gang of four"],
    "system design": ["architecture design", "scalability"],
    "technical debt": ["code debt"],
}

_canonical_map: dict[str, str] = {}
_loaded_json = False
_json_path = KNOWLEDGE_DIR / "skill_synonyms.json"


def _load_json_overrides():
    global _loaded_json
    if _loaded_json:
        return
    _loaded_json = True
    if _json_path.exists():
        try:
            data = json.loads(_json_path.read_text(encoding="utf-8"))
            for canonical, aliases in data.items():
                key = canonical.lower().strip()
                if key not in _SYNONYM_DATA:
                    _SYNONYM_DATA[key] = []
                for alias in aliases:
                    if alias.lower().strip() not in _SYNONYM_DATA[key]:
                        _SYNONYM_DATA[key].append(alias.lower().strip())
            logger.info("Loaded %d extra synonym groups from %s", len(data), _json_path)
        except Exception as e:
            logger.warning("Failed to load synonym JSON: %s", e)


def _build_canonical_map():
    if _canonical_map:
        return
    _load_json_overrides()
    for canonical, aliases in _SYNONYM_DATA.items():
        key = canonical.lower().strip()
        _canonical_map[key] = key
        for alias in aliases:
            _canonical_map[alias.lower().strip()] = key


_std_cache: dict[str, dict] = {}


def standardize_skill(skill: str) -> dict:
    """Standardize a skill through the full ESCO/O*NET -> synonym-fallback cascade.

    Resolution order:
      1. ESCO / O*NET ontology lookup (real official datasets loaded by
         ``app.skills.ontology``). On a hit the canonical preferred label,
         source ('ESCO' or 'O*NET'), URI and identifier come from the dataset.
      2. Synonym map fallback (canonical alias group).
      3. Otherwise the cleaned original is kept as its own canonical form.

    Returns: {"original", "key", "canonical", "source", "uri", "identifier",
    "domain"}. ``source`` is 'ESCO', 'O*NET', 'synonym_fallback' or 'none'.
    """
    if skill in _std_cache:
        return dict(_std_cache[skill])
    try:
        from app.skills.ontology import standardize_skill as ontology_standardize
        onto = ontology_standardize(skill)
    except Exception as e:
        logger.warning("Ontology standardize failed for '%s': %s", skill, e)
        onto = None
    if onto is not None:
        result = {
            "original": skill,
            "key": onto["key"],
            "canonical": onto["canonical"],
            "source": onto["source"],
            "uri": onto["uri"],
            "identifier": onto["identifier"],
            "domain": onto["domain"],
        }
        _std_cache[skill] = result
        return dict(result)

    _build_canonical_map()
    key = skill.lower().strip()
    key = key.replace(".", "").replace("-", " ").replace("_", " ")
    key = " ".join(key.split())
    canonical = _canonical_map.get(key)
    if canonical is not None:
        result = {
            "original": skill,
            "key": canonical,
            "canonical": canonical,
            "source": "synonym_fallback",
            "uri": None,
            "identifier": None,
            "domain": "synonym_map",
        }
    else:
        result = {
            "original": skill,
            "key": key,
            "canonical": key,
            "source": "none",
            "uri": None,
            "identifier": None,
            "domain": "original",
        }
    _std_cache[skill] = result
    return dict(result)


def normalize_skill(skill: str) -> str:
    """Canonical match key: ESCO/O*NET ontology first, then synonym fallback."""
    return standardize_skill(skill)["key"]


def expand_skill(skill: str) -> list[str]:
    _build_canonical_map()
    canonical = normalize_skill(skill)
    result = {canonical}
    for key, canon in _canonical_map.items():
        if canon == canonical:
            result.add(key)
    return sorted(result)


def get_all_canonical_skills() -> list[str]:
    _build_canonical_map()
    return sorted(set(_canonical_map.values()))


def export_synonyms_json(path: Path | None = None):
    out = path or _json_path
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(_SYNONYM_DATA, indent=2, ensure_ascii=False), encoding="utf-8")
    logger.info("Exported %d synonym groups to %s", len(_SYNONYM_DATA), out)
