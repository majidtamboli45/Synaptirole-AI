from app.utils import get_logger

logger = get_logger("learning_recommendation")


def recommend_learning(missing_skills: list[str], weak_areas: list[str] = None) -> list[dict]:
    recommendations = []

    skill_resources = {
        "python": {"type": "course", "title": "Python for Data Science", "platform": "Coursera"},
        "javascript": {"type": "course", "title": "JavaScript Fundamentals", "platform": "freeCodeCamp"},
        "react": {"type": "course", "title": "React - The Complete Guide", "platform": "Udemy"},
        "docker": {"type": "course", "title": "Docker for Beginners", "platform": "YouTube"},
        "kubernetes": {"type": "course", "title": "Kubernetes Fundamentals", "platform": "Linux Foundation"},
        "aws": {"type": "certification", "title": "AWS Cloud Practitioner", "platform": "AWS"},
        "machine learning": {"type": "course", "title": "Machine Learning Specialization", "platform": "Coursera"},
        "deep learning": {"type": "course", "title": "Deep Learning Specialization", "platform": "Coursera"},
        "sql": {"type": "course", "title": "SQL for Data Analysis", "platform": "Mode Analytics"},
        "git": {"type": "course", "title": "Git & GitHub Crash Course", "platform": "YouTube"},
    }

    for skill in missing_skills[:5]:
        resource = skill_resources.get(skill.lower(), {"type": "self-study", "title": f"Learn {skill}", "platform": "Online resources"})
        recommendations.append({"skill": skill, **resource})

    if weak_areas:
        for area in weak_areas:
            if area == "communication":
                recommendations.append({"skill": "communication", "type": "practice", "title": "Practice mock interviews regularly", "platform": "SynaptiRole AI"})
            elif area == "body language":
                recommendations.append({"skill": "body language", "type": "practice", "title": "Record yourself answering questions", "platform": "Self-practice"})
            elif area == "technical knowledge":
                recommendations.append({"skill": "technical knowledge", "type": "study", "title": "Review core technical concepts", "platform": "LeetCode / HackerRank"})

    logger.info("Generated %d learning recommendations", len(recommendations))
    return recommendations
