from src.config.settings import APP_NAME, APP_VERSION


def test_application_name():
    assert APP_NAME == "hello-ai"


def test_application_version():
    assert APP_VERSION == "0.1.0"