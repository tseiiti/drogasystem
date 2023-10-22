from search import ut, Search

# classe personalizada para pesquisar clientes
class ClienteSearch(Search):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "pessoa.id, pessoa.nome, cliente.cpf, cliente.data_nasc, pessoa.telefone "
    sql += "from pessoa "
    sql += "join cliente on cliente.id = pessoa.id "

    if self.pesquisar:
      sql += f"where cast(pessoa.id as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or pessoa.nome ilike '%{self.pesquisar}%' "
      sql += f"or cast(cliente.cpf as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or cast(cliente.data_nasc as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or cast(pessoa.telefone as varchar) ilike '%{self.pesquisar}%' "
    
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
