from coche import Coche

def test_coche_velocidad_inicial():
    coche = Coche()
    assert coche.velocidad == 0

def test_coche_acelerar():
    coche = Coche()
    coche.acelerar(50)
    assert coche.velocidad == 50

def test_coche_frenar():
    coche = Coche()
    coche.acelerar(50)
    coche.frenar(30)
    assert coche.velocidad == 20