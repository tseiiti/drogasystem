from read import ut, Read

# classe personalizada para listar estoques
class EstoqueRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    cols = ["estoque.id", "medicamento.nome", "estoque.quant_atual", "estoque.custo", "estoque.validade"]

    sql  = "select "
    sql += "estoque.id, medicamento.nome as medicamento, estoque.quant_atual, estoque.custo, estoque.validade "
    sql += "from estoque "
    sql += "join medicamento on medicamento.id = estoque.medicamento_id "

    sql += ut.where_pesquisa(self.pesquisar, cols)
    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)
