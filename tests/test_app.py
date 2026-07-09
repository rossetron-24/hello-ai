from src.app import greet

def test_greet():
    expected = "Hello Raj! Welcome to Azure AI Foundry."
    assert greet("Raj") == expected
