from model import Model

# classe personalizada para acesso a tabela estoque
class EstoqueModel(Model):
  # adiciona um acesso a tabela medicamento
  def __init__(self):
    super().__init__()
    self.medicamento = Model("Medicamento")
