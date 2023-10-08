from read import Read

class EstoqueRead(Read):
  def set_cols_rows(self):
    sql = "select "
    sql += "estoque.id, medicamento.nome as medicamento, estoque.quant_atual, estoque.preco, estoque.validade "
    sql += "from estoque "
    sql += "join medicamento on medicamento.id = estoque.medicamento_id "
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
    self.cols = [self.corretor(c) for c in self.model.columns()]
