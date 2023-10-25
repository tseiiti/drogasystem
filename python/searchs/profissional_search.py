from search import ut, Search

# classe personalizada para pesquisar profissionais
class ProfissionalSearch(Search):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "pessoa.id, pessoa.nome, profissional.registro, profissional.tipo "
    sql += "from pessoa "
    sql += "join profissional on profissional.id = pessoa.id "

    if self.pesquisar:
      sql += f"where cast(pessoa.id as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or pessoa.nome ilike '%{self.pesquisar}%' "
      sql += f"or cast(profissional.registro as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or profissional.tipo ilike '%{self.pesquisar}%' "

    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
