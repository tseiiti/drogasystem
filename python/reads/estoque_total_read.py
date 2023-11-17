from read import sg, ut, Read

# classe personalizada para listar estoque total
class EstoqueTotalRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    cols = ["estoque_total.id", "medicamento.nome", "estoque_total.total", "estoque_total.minimo", "estoque_total.maximo"]

    sql  = "select "
    sql += "estoque_total.id, medicamento.nome as medicamento, estoque_total.total, estoque_total.minimo, estoque_total.maximo "
    sql += "from estoque_total "
    sql += "join medicamento on medicamento.id = estoque_total.medicamento_id "

    sql += ut.where_pesquisa(self.pesquisar, cols)
    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)

  def add_buttons(self):
    return [sg.Button(" Voltar ")]