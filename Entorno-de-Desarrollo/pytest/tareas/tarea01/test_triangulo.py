from triangulo import Triangulo

def test_triangulo_area():
    triangulo = Triangulo(base=5, altura=4)
    assert triangulo.calcular_area() == 10

def test_triangulo_perimetro():
    triangulo = Triangulo(lado1=3, lado2=4, lado3=5)
    assert triangulo.calcular_perimetro() == 12