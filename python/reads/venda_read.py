from read import ut, Read

# classe personalizada para listar vendas
class VendaRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "venda.id, venda.time_stamp, venda.total, cliente.cpf, profissional.registro "
    sql += "from venda "
    sql += "left join cliente on cliente.id = venda.cliente_id "
    sql += "left join profissional on profissional.id = venda.profissional_id "
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
    self.cols = [ut.corretor(c) for c in self.model.columns()]
