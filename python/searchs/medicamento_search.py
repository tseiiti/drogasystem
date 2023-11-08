from search import ut, Search

# classe personalizada para pesquisar medicamentos
class MedicamentoSearch(Search):
  # personaliza atributos da lista
  def set_cols_rows(self):
    cols = ["estoque.id", "laboratorio.nome", "medicamento.nome", "medicamento.substancia", 
            "medicamento.tipo", "medicamento.preco", "estoque.quant_atual"]
    
    sql = "select "
    sql += "estoque.id, laboratorio.nome as laboratorio, medicamento.nome, medicamento.substancia, "
    sql += "medicamento.tipo, medicamento.preco, estoque.quant_atual as restante "
    sql += "from medicamento "
    sql += "join laboratorio on laboratorio.id = medicamento.laboratorio_id "
    sql += "join estoque on estoque.medicamento_id = medicamento.id "
    sql += "where estoque.quant_atual > 0 "

    sql += ut.where_pesquisa(self.pesquisar, cols, False)
    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)
    self.win_size = (1000, 376)
