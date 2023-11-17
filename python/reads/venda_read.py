from read import ut, Read

# classe personalizada para listar vendas
class VendaRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    cols = ["venda.id", "venda.time_stamp", "venda.total", "cliente.cpf", "profissional.registro"]

    sql = "select "
    sql += ", ".join(cols)
    sql += " from venda "
    sql += "left join cliente on cliente.id = venda.cliente_id "
    sql += "left join profissional on profissional.id = venda.profissional_id "

    sql += ut.where_pesquisa(self.pesquisar, cols)
    sql += "order by 1 desc;"
    self.rows = self.model.find_by_sql(sql)
