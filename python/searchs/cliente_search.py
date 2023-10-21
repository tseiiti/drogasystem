from search import ut, Search

# classe personalizada para listar clientes
class ClienteSearch(Search):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "pessoa.id, pessoa.nome, cliente.cpf, cliente.data_nasc, pessoa.telefone "
    sql += "from pessoa "
    sql += "join cliente on cliente.id = pessoa.id "
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
