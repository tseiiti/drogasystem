from model import Model

# classe personalizada para acesso a tabela venda
class VendaModel(Model):
  # adiciona um acesso a tabela medicamento, cliente, profissional e itens_venda
  def __init__(self):
    super().__init__()
    self.medicamento = Model("Medicamento")
    self.cliente = Model("Cliente")
    self.profissional = Model("Profissional")
    self.itens_venda = Model("Itens_Venda")
