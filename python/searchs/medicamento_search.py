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

    if self.pesquisar:
      sql += "and ( "
      sql += f"laboratorio.nome ilike '%{self.pesquisar}%' "
      sql += f"or medicamento.nome ilike '%{self.pesquisar}%' "
      sql += f"or medicamento.tipo ilike '%{self.pesquisar}%' "
      sql += f"or estoque.lote ilike '%{self.pesquisar}%' "
      sql += f"or cast(medicamento.preco as varchar) ilike '%{self.pesquisar}%' "
      sql += " ) "
    
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
