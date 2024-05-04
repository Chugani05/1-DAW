from cuadrado import Cuadrado

def test_cuadrado_area():
    cuadrado = Cuadrado(lado=4)
    assert cuadrado.calcular_area() == 16

def test_cuadrado_perimetro():
    cuadrado = Cuadrado(lado=3)
    assert cuadrado.calcular_perimetro() == 12