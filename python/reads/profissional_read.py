from read import ut, Read

# classe personalizada para listar profissionais
class ProfissionalRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "pessoa.id, pessoa.nome, profissional.registro, profissional.tipo "
    sql += "from pessoa "
    sql += "join profissional on profissional.id = pessoa.id "

    if self.pesquisar:
      sql += "where ( "
      sql += f"cast(pessoa.id as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or pessoa.nome ilike '%{self.pesquisar}%' "
      sql += f"or cast(profissional.registro as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or profissional.tipo ilike '%{self.pesquisar}%' "
      sql += " ) "
      
    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)
