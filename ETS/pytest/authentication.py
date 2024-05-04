def authenticate(username, password, expected_username, expected_password):
    """
    Compara el nombre de usuario y la contraseña dados con los esperados.
    
    Args:
    - username (str): Nombre de usuario proporcionado.
    - password (str): Contraseña proporcionada.
    - expected_username (str): Nombre de usuario esperado.
    - expected_password (str): Contraseña esperada.
    
    Returns:
    - bool: True si el nombre de usuario y la contraseña coinciden con los esperados, False en caso contrario.
    """
    return username == expected_username and password == expected_password
