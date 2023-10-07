from model import Model

class MedicamentoModel(Model):
  def __init__(self):
    super().__init__()
    self.laboratorio = Model("Laboratorio")
