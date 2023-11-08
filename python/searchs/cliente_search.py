from search import ut, Search

# classe personalizada para pesquisar clientes
class ClienteSearch(Search):
  # personaliza atributos da lista
  def set_cols_rows(self):
    cols = ["pessoa.id", "pessoa.nome", "cliente.cpf", "cliente.data_nasc", "pessoa.telefone"]

    sql = "select "
    sql += ", ".join(cols)
    sql += " from pessoa "
    sql += "join cliente on cliente.id = pessoa.id "

    sql += ut.where_pesquisa(self.pesquisar, cols)
    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)
