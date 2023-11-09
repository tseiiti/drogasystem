from model import Model

# classe personalizada para acesso a tabela estoque_total
class Estoque_TotalModel(Model):
  # adiciona um acesso a tabela medicamento
  def __init__(self):
    super().__init__()
    self.medicamento = Model("Medicamento")
