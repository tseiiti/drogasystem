from model import Model

# classe personalizada para acesso a tabela medicamento
class MedicamentoModel(Model):
  # adiciona um acesso a tabela laboratorio
  def __init__(self):
    super().__init__()
    self.laboratorio = Model("Laboratorio")
