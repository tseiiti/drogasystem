from read import ut, Read

# classe personalizada para listar estoques
class EstoqueRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "estoque.id, medicamento.nome as medicamento, estoque.quant_atual, estoque.preco, estoque.validade "
    sql += "from estoque "
    sql += "join medicamento on medicamento.id = estoque.medicamento_id "

    if self.pesquisar:
      sql += "where ( "
      sql += f"cast(estoque.id as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or medicamento.nome ilike '%{self.pesquisar}%' "
      sql += f"or cast(estoque.preco as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or cast(estoque.validade as varchar) ilike '%{self.pesquisar}%' "
      sql += " ) "

    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)
