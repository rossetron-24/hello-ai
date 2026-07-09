APP_NAME = "Hello AI"
VERSION = "0.1.0"


def greet(name: str) -> str:
    """Return a personalized greeting."""
    return f"Hello {name}! Welcome to Azure AI Foundry."


def get_version() -> str:
    """Return the application version."""
    return VERSION


def main() -> None:
    print("=" * 40)
    print(APP_NAME)
    print(f"Version: {get_version()}")
    print("=" * 40)

    name = input("Enter your name: ")
    print(greet(name))


if __name__ == "__main__":
    main()
