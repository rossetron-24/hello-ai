from fastapi import FastAPI
from src.services.health_service import get_health

app = FastAPI(
    title="Hello AI",
    version="0.1.0",
)

@app.get("/")
def root():
    return {
        "message": "Welcome to Hello AI"
    }

@app.get("/health")
def health():
    return get_health()
