class Coche:
    def __init__(self):
        self.velocidad = 0

    def acelerar(self, cantidad):
        self.velocidad += cantidad

    def frenar(self, cantidad):
        if self.velocidad >= cantidad:
            self.velocidad -= cantidad
        else:
            self.velocidad = 0