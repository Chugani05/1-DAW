import pytest
from authentication import authenticate

def test_authentication():
    # Caso de prueba 1: Usuario y contraseña correctos
    assert authenticate("usuario1", "password123", "usuario1", "password123") == True
    
    # Caso de prueba 2: Usuario correcto, contraseña incorrecta
    assert authenticate("usuario2", "password123", "usuario2", "password456") == False
    
    # Caso de prueba 3: Usuario incorrecto, contraseña correcta
    assert authenticate("usuario3", "password123", "usuario4", "password123") == False
    
    # Caso de prueba 4: Usuario y contraseña incorrectos
    assert authenticate("usuario4", "password123", "usuario5", "password456") == False

    # Caso de prueba 5: Usuario y contraseña en blanco
    assert authenticate("", "", "usuario5", "password456") == False

    # Caso de prueba 6: Comparación con mayúsculas y minúsculas
    assert authenticate("Usuario1", "Password123", "usuario1", "password123") == False

    # Caso de prueba 7: Comparación con espacios en blanco
    assert authenticate("  usuario1  ", "  password123  ", "usuario1", "password123") == False

if __name__ == "__main__":
    pytest.main()