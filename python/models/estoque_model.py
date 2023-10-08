from model import Model

class EstoqueModel(Model):
  def __init__(self):
    super().__init__()
    self.medicamento = Model("Medicamento")
