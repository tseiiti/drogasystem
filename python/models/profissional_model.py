from model import Model

# classe personalizada para acesso a tabela profissional
class ProfissionalModel(Model):
  # adiciona um acesso a tabela pessoa
  def __init__(self):
    super().__init__()
    self.pessoa = Model("Pessoa")
