from read import ut, Read

# classe personalizada para listar clientes
class ClienteRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "pessoa.id, pessoa.nome, cliente.cpf, cliente.data_nasc, cliente.sexo "
    sql += "from pessoa "
    sql += "join cliente on cliente.id = pessoa.id "
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
    self.cols = [ut.corretor(c) for c in self.model.columns()]
