from model import Model

# classe personalizada para acesso a tabela venda
class VendaModel(Model):
  # adiciona um acesso a tabela pessoa, cliente, profissional, itens_venda e medicamento
  def __init__(self):
    super().__init__()
    self.pessoa = Model("Pessoa")
    self.cliente = Model("Cliente")
    self.profissional = Model("Profissional")
    self.medicamento = Model("Medicamento")
    self.itens_venda = Model("Itens_Venda")
