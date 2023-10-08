from read import Read

class MedicamentoRead(Read):
  def set_cols_rows(self):
    sql = "select "
    sql += "medicamento.id, laboratorio.nome as laboratorio, medicamento.nome, medicamento.tipo, medicamento.quantidade, medicamento.preco "
    sql += "from medicamento "
    sql += "join laboratorio on laboratorio.id = medicamento.laboratorio_id "
    sql += "order by 1 "
    self.rows = self.model.find_by_sql(sql)
    self.cols = [self.corretor(c) for c in self.model.columns()]
    # , medicamento.dosagem, medicamento.apresentacao, medicamento.controle 