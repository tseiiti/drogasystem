from read import ut, Read

# classe personalizada para listar profissionais
class ProfissionalRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    cols = ["pessoa.id", "pessoa.nome", "profissional.registro", "profissional.tipo"]
    
    sql = "select "
    sql += ", ".join(cols)
    sql += " from pessoa "
    sql += "join profissional on profissional.id = pessoa.id "

    sql += ut.where_pesquisa(self.pesquisar, cols)
    sql += "order by 1;"
    self.rows = self.model.find_by_sql(sql)
