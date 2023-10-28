from search import ut, Search

# classe personalizada para pesquisar medicamentos
class MedicamentoSearch(Search):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "estoque.id, concat(laboratorio.nome, ', ', medicamento.nome) as nome,  "
    sql += "medicamento.tipo, medicamento.preco, estoque.lote, estoque.quant_atual "
    sql += "from medicamento "
    sql += "join laboratorio on laboratorio.id = medicamento.laboratorio_id "
    sql += "join estoque on estoque.medicamento_id = medicamento.id "
    sql += "where estoque.quant_atual > 0 "

    cols = ["estoque.id", "laboratorio.nome", "medicamento.nome", "medicamento.tipo", "medicamento.preco", "estoque.lote", "estoque.quant_atual"]
    aux = ut.where_pesquisa(self.pesquisar, cols, False)
    if aux: sql += f"and ({aux})"
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
