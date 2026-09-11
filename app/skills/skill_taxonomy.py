"""Skill taxonomy: canonical skill names, aliases, and categories.

Each entry maps a *canonical* skill name to its metadata:
    category  -> one of the high-level groups below
    aliases   -> alternative spellings / abbreviations treated as the same skill

This replaces the flat SKILL_PATTERNS / TECH_SKILLS lists used in earlier
phases with a structured, synonym-aware taxonomy.
"""

CATEGORY_LABELS = {
    "language": "Languages",
    "framework": "Frameworks",
    "frontend": "Frontend / Web",
    "backend": "Backend / API",
    "database": "Databases",
    "cloud": "Cloud / DevOps",
    "ml": "AI / ML",
    "data": "Data Engineering",
    "methodology": "Methodology / Tools",
    "security": "Security",
    "testing": "Testing / Quality",
    "design": "Design / UX",
}

SkillEntry = dict

SKILL_TAXONOMY: dict[str, SkillEntry] = {
    # ------------------------------------------------------------------ #
    # Programming languages
    # ------------------------------------------------------------------ #
    "python": {"category": "language", "aliases": ("py", "python3", "python 3")},
    "java": {"category": "language", "aliases": ("java 8", "java 11", "java 17")},
    "javascript": {"category": "language", "aliases": ("js", "ecmascript", "es6", "es2015", "es2020")},
    "typescript": {"category": "language", "aliases": ("ts", "tsx")},
    "c++": {"category": "language", "aliases": ("cpp", "cplusplus")},
    "c": {"category": "language", "aliases": ()},
    "c#": {"category": "language", "aliases": ("csharp", ".net core", "dotnet")},
    "ruby": {"category": "language", "aliases": ()},
    "go": {"category": "language", "aliases": ("golang",)},
    "rust": {"category": "language", "aliases": ()},
    "kotlin": {"category": "language", "aliases": ()},
    "swift": {"category": "language", "aliases": ()},
    "php": {"category": "language", "aliases": ()},
    "scala": {"category": "language", "aliases": ()},
    "r": {"category": "language", "aliases": ("r language", "r programming")},
    "dart": {"category": "language", "aliases": ()},
    "solidity": {"category": "language", "aliases": ()},
    "bash": {"category": "language", "aliases": ("shell", "bash scripting", "shell scripting")},
    "powershell": {"category": "language", "aliases": ("ps1",)},
    "sql": {"category": "language", "aliases": ("structured query language", "pl/sql", "t-sql")},
    "html": {"category": "frontend", "aliases": ("html5",)},
    "css": {"category": "frontend", "aliases": ("css3", "cascading style sheets")},
    # ------------------------------------------------------------------ #
    # Frameworks
    # ------------------------------------------------------------------ #
    "react": {"category": "framework", "aliases": ("react.js", "reactjs", "react native", "next.js", "nextjs")},
    "angular": {"category": "framework", "aliases": ("angularjs", "angular 2", "angular 14")},
    "vue": {"category": "framework", "aliases": ("vue.js", "vuejs", "nuxt.js", "nuxtjs")},
    "svelte": {"category": "framework", "aliases": ()},
    "node.js": {"category": "backend", "aliases": ("node", "nodejs", "express", "express.js", "expressjs")},
    "django": {"category": "backend", "aliases": ("django rest framework",)},
    "flask": {"category": "backend", "aliases": ()},
    "fastapi": {"category": "backend", "aliases": ()},
    "spring": {"category": "backend", "aliases": ("spring boot", "spring mvc", "spring framework")},
    "ruby on rails": {"category": "backend", "aliases": ("rails", "ror")},
    "laravel": {"category": "backend", "aliases": ()},
    "asp.net": {"category": "backend", "aliases": (".net", ".net framework", "aspnet")},
    "graphql": {"category": "backend", "aliases": ("graph ql",)},
    "redux": {"category": "frontend", "aliases": ("redux toolkit",)},
    "tailwind css": {"category": "frontend", "aliases": ("tailwind", "tailwindcss")},
    "bootstrap": {"category": "frontend", "aliases": ("bootstrap 5",)},
    "sass": {"category": "frontend", "aliases": ("scss",)},
    "less": {"category": "frontend", "aliases": ()},
    "jquery": {"category": "frontend", "aliases": ()},
    "webpack": {"category": "frontend", "aliases": ()},
    "vite": {"category": "frontend", "aliases": ("vitejs",)},
    "next.js": {"category": "frontend", "aliases": ()},
    # ------------------------------------------------------------------ #
    # Databases & storage
    # ------------------------------------------------------------------ #
    "mysql": {"category": "database", "aliases": ()},
    "postgresql": {"category": "database", "aliases": ("postgres",)},
    "mongodb": {"category": "database", "aliases": ("mongo",)},
    "redis": {"category": "database", "aliases": ()},
    "elasticsearch": {"category": "database", "aliases": ("elastic", "es search")},
    "sqlite": {"category": "database", "aliases": ()},
    "oracle": {"category": "database", "aliases": ("oracle database",)},
    "sql server": {"category": "database", "aliases": ("mssql", "microsoft sql server")},
    "cassandra": {"category": "database", "aliases": ()},
    "dynamodb": {"category": "database", "aliases": ("amazon dynamodb",)},
    "neo4j": {"category": "database", "aliases": ()},
    "firebase": {"category": "database", "aliases": ("firestore",)},
    "supabase": {"category": "database", "aliases": ()},
    "chromadb": {"category": "database", "aliases": ("chroma",)},
    "nosql": {"category": "database", "aliases": ("nonrelational database", "non-relational database", "nonrelational databases")},
    "vector databases": {"category": "database", "aliases": ("vector database", "vector db", "vector store", "vector search")},
    # ------------------------------------------------------------------ #
    # Cloud / DevOps
    # ------------------------------------------------------------------ #
    "aws": {"category": "cloud", "aliases": ("amazon web services", "amazon aws")},
    "azure": {"category": "cloud", "aliases": ("microsoft azure",)},
    "gcp": {"category": "cloud", "aliases": ("google cloud", "google cloud platform")},
    "docker": {"category": "cloud", "aliases": ()},
    "kubernetes": {"category": "cloud", "aliases": ("k8s",)},
    "jenkins": {"category": "cloud", "aliases": ()},
    "terraform": {"category": "cloud", "aliases": ()},
    "ansible": {"category": "cloud", "aliases": ()},
    "helm": {"category": "cloud", "aliases": ("helm charts",)},
    "openshift": {"category": "cloud", "aliases": ()},
    "gitlab": {"category": "cloud", "aliases": ("gitlab ci", "gitlab ci/cd")},
    "github": {"category": "cloud", "aliases": ("github actions", "github ci")},
    "github actions": {"category": "cloud", "aliases": ()},
    "circleci": {"category": "cloud", "aliases": ("circle ci",)},
    "ci/cd": {"category": "cloud", "aliases": ("ci cd", "continuous integration", "continuous delivery", "continuous deployment")},
    "aws sagemaker": {"category": "cloud", "aliases": ("sagemaker", "amazon sagemaker")},
    "grafana": {"category": "cloud", "aliases": ("grafana dashboards", "grafana monitoring")},
    "prometheus": {"category": "cloud", "aliases": ("prometheus metrics", "prometheus monitoring")},
    "git": {"category": "methodology", "aliases": ("version control",)},
    # ------------------------------------------------------------------ #
    # AI / ML
    # ------------------------------------------------------------------ #
    "machine learning": {"category": "ml", "aliases": ("ml",)},
    "deep learning": {"category": "ml", "aliases": ("dl", "deep neural network", "neural networks", "neural network")},
    "nlp": {"category": "ml", "aliases": ("natural language processing", "llms", "large language models", "generative ai", "genai")},
    "computer vision": {"category": "ml", "aliases": ("cv", "image processing")},
    "tensorflow": {"category": "ml", "aliases": ("tf",)},
    "pytorch": {"category": "ml", "aliases": ()},
    "keras": {"category": "ml", "aliases": ()},
    "scikit-learn": {"category": "ml", "aliases": ("sklearn", "scikit learn")},
    "xgboost": {"category": "ml", "aliases": ()},
    "shap": {"category": "ml", "aliases": ()},
    "opencv": {"category": "ml", "aliases": ()},
    "mediapipe": {"category": "ml", "aliases": ()},
    "transformers": {"category": "ml", "aliases": ("huggingface transformers",)},
    "huggingface": {"category": "ml", "aliases": ("hugging face", "hf")},
    "langchain": {"category": "ml", "aliases": ("lang chain",)},
    "faiss": {"category": "ml", "aliases": ()},
    "llm": {"category": "ml", "aliases": ("large language model", "large language models", "llms")},
    "rag": {"category": "ml", "aliases": ("retrieval-augmented generation", "retrieval augmented generation")},
    "openai": {"category": "ml", "aliases": ("openai api", "chatgpt", "gpt-4", "gpt4", "gpt-4o", "gpt-3.5")},
    "prompt engineering": {"category": "ml", "aliases": ("prompting",)},
    "mlops": {"category": "ml", "aliases": ()},
    "reinforcement learning": {"category": "ml", "aliases": ("rl",)},
    "recommendation systems": {"category": "ml", "aliases": ("recommender systems", "recommendation engine")},
    "embeddings": {"category": "ml", "aliases": ("embedding", "word embeddings", "vector embeddings")},
    "feature engineering": {"category": "ml", "aliases": ("feature extraction", "feature selection")},
    "fine-tuning": {"category": "ml", "aliases": ("fine tuning", "finetuning")},
    "model deployment": {"category": "ml", "aliases": ("model serving", "ml deployment", "deploying models")},
    # ------------------------------------------------------------------ #
    # Data engineering & analytics
    # ------------------------------------------------------------------ #
    "pandas": {"category": "data", "aliases": ()},
    "numpy": {"category": "data", "aliases": ()},
    "spark": {"category": "data", "aliases": ("apache spark", "pyspark")},
    "hadoop": {"category": "data", "aliases": ("apache hadoop",)},
    "kafka": {"category": "data", "aliases": ("apache kafka",)},
    "airflow": {"category": "data", "aliases": ("apache airflow",)},
    "dbt": {"category": "data", "aliases": ("data build tool",)},
    "etl": {"category": "data", "aliases": ("extract transform load", "elt")},
    "data modeling": {"category": "data", "aliases": ("data modelling",)},
    "bigquery": {"category": "data", "aliases": ("google bigquery",)},
    "tableau": {"category": "data", "aliases": ()},
    "power bi": {"category": "data", "aliases": ("powerbi", "microsoft power bi")},
    "eda": {"category": "data", "aliases": ("exploratory data analysis",)},
    "statistics": {"category": "data", "aliases": ("statistical analysis", "hypothesis testing")},
    "data visualization": {"category": "data", "aliases": ("dataviz", "data visualisation", "data viz")},
    "a/b testing": {"category": "data", "aliases": ("ab testing", "a/b tests", "ab tests")},
    # ------------------------------------------------------------------ #
    # APIs / protocols / architecture
    # ------------------------------------------------------------------ #
    "rest": {"category": "backend", "aliases": ("rest api", "rest apis", "restful", "restful apis", "restful api")},
    "grpc": {"category": "backend", "aliases": ()},
    "websockets": {"category": "backend", "aliases": ("websocket",)},
    "microservices": {"category": "backend", "aliases": ("micro service", "micro services")},
    "serverless": {"category": "backend", "aliases": ("lambda functions",)},
    "event-driven architecture": {"category": "backend", "aliases": ("event driven", "event sourcing", "cqrs")},
    "system design": {"category": "backend", "aliases": ("architecture design",)},
    # ------------------------------------------------------------------ #
    # Methodology / tools
    # ------------------------------------------------------------------ #
    "agile": {"category": "methodology", "aliases": ("agile methodology", "agile development")},
    "scrum": {"category": "methodology", "aliases": ()},
    "kanban": {"category": "methodology", "aliases": ()},
    "jira": {"category": "methodology", "aliases": ()},
    "confluence": {"category": "methodology", "aliases": ()},
    "tdd": {"category": "methodology", "aliases": ("test-driven development", "test driven development")},
    "bdd": {"category": "methodology", "aliases": ("behavior-driven development", "behavior driven development")},
    "devops": {"category": "methodology", "aliases": ("site reliability", "sre")},
    "linux": {"category": "methodology", "aliases": ("ubuntu", "debian", "redhat")},
    "docker-compose": {"category": "methodology", "aliases": ("docker compose",)},
    "data structures": {"category": "methodology", "aliases": ("data structure", "dsa", "data structures and algorithms")},
    "object-oriented programming": {"category": "methodology", "aliases": ("oop", "object oriented programming", "object oriented")},
    # ------------------------------------------------------------------ #
    # Testing / QA
    # ------------------------------------------------------------------ #
    "jest": {"category": "testing", "aliases": ("jest testing",)},
    "pytest": {"category": "testing", "aliases": ()},
    "junit": {"category": "testing", "aliases": ()},
    "mocha": {"category": "testing", "aliases": ("mocha.js",)},
    "chai": {"category": "testing", "aliases": ()},
    "selenium": {"category": "testing", "aliases": ("selenium webdriver",)},
    "playwright": {"category": "testing", "aliases": ()},
    "cypress": {"category": "testing", "aliases": ()},
    "postman": {"category": "testing", "aliases": ("postman api",)},
    "k6": {"category": "testing", "aliases": ("grafana k6",)},
    "unit testing": {"category": "testing", "aliases": ("unit test", "unit tests")},
    # ------------------------------------------------------------------ #
    # Security
    # ------------------------------------------------------------------ #
    "owasp": {"category": "security", "aliases": ("owasp top 10",)},
    "penetration testing": {"category": "security", "aliases": ("pen testing", "pentest")},
    "jwt": {"category": "security", "aliases": ("json web token",)},
    "oauth": {"category": "security", "aliases": ("oauth2", "oauth 2.0")},
    "sso": {"category": "security", "aliases": ("single sign-on", "single sign on")},
    "cybersecurity": {"category": "security", "aliases": ("cyber security", "information security")},
    "encryption": {"category": "security", "aliases": ("cryptography", "aes", "rsa")},
    # ------------------------------------------------------------------ #
    # Design / UX
    # ------------------------------------------------------------------ #
    "figma": {"category": "design", "aliases": ()},
    "ui design": {"category": "design", "aliases": ("ui/ux", "ui ux", "ux design", "user interface design", "user experience design")},
    "adobe xd": {"category": "design", "aliases": ("xd",)},
    "responsive design": {"category": "design", "aliases": ("responsive web design", "mobile-first design", "mobile first")},
    "accessibility": {"category": "design", "aliases": ("wcag", "a11y", "section 508", "web accessibility", "digital accessibility")},
    "prototyping": {"category": "design", "aliases": ("prototype",)},
}


def all_terms() -> dict[str, str]:
    """Return every searchable term (canonical + alias) -> canonical skill id."""
    terms: dict[str, str] = {}
    for canonical, meta in SKILL_TAXONOMY.items():
        terms[canonical.lower()] = canonical
        for alias in meta.get("aliases", ()):
            terms[alias.lower()] = canonical
    return terms


def all_questions() -> str:
    """Human readable category summary (used for logging / debugging)."""
    return ", ".join(sorted(SKILL_TAXONOMY.keys()))