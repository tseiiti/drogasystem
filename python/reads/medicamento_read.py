from read import ut, Read

# classe personalizada para listar medicamentos
class MedicamentoRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    cols = ["medicamento.id", "laboratorio.nome", "medicamento.nome", "medicamento.tipo", 
            "medicamento.quantidade", "medicamento.preco"]

    sql = "select "
    sql += "medicamento.id, laboratorio.nome as laboratorio, medicamento.nome, "
    sql += "medicamento.tipo, medicamento.quantidade, medicamento.preco "
    sql += "from medicamento "
    sql += "join laboratorio on laboratorio.id = medicamento.laboratorio_id "

    sql += ut.where_pesquisa(self.pesquisar, cols)
    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)
