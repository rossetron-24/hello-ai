APP_NAME = "Hello AI"
VERSION = "0.1.0"


def greet(name: str) -> str:
    """Return a personalized greeting."""
    return f"Hello {name}! Welcome to Azure AI Foundry."


def get_version() -> str:
    """Return application version."""
    return VERSION
