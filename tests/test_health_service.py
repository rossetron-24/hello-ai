from src.services.health_service import get_health

def test_get_health():
    result = get_health()

    assert result["status"] == "healthy"
