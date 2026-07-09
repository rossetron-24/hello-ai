from fastapi import FastAPI

from src.config.settings import APP_NAME, APP_VERSION
from src.services.health_service import get_health

app = FastAPI(
    title=APP_NAME,
    version=APP_VERSION,
)


@app.get("/")
def root():
    return {"message": "Welcome to Hello AI"}


@app.get("/health")
def health():
    return get_health()


@app.get("/version")
def version():
    return {"application": APP_NAME, "version": APP_VERSION}
