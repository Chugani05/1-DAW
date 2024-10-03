import pytest
from calculadora import sumar, restar, multiplicar, dividir

@pytest.mark.parametrize("a, b, expected", [
    (2, 3, 5),
    (-1, 1, 0),
    (0, 0, 0),
])
def test_sumar(a, b, expected):
    assert sumar(a, b) == expected

@pytest.mark.parametrize("a, b, expected", [
    (5, 3, 2),
    (0, 0, 0),
    (-1, -1, 0),
])
def test_restar(a, b, expected):
    assert restar(a, b) == expected

@pytest.mark.parametrize("a, b, expected", [
    (2, 3, 6),
    (-2, 3, -6),
    (0, 5, 0),
])
def test_multiplicar(a, b, expected):
    assert multiplicar(a, b) == expected

@pytest.mark.parametrize("a, b, expected", [
    (6, 3, 2),
    (-6, 3, -2),
    (0, 5, 0),
])
def test_dividir(a, b, expected):
    assert dividir(a, b) == expected
