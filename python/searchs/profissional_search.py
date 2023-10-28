from search import ut, Search

# classe personalizada para pesquisar profissionais
class ProfissionalSearch(Search):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "pessoa.id, pessoa.nome, profissional.registro, profissional.tipo "
    sql += "from pessoa "
    sql += "join profissional on profissional.id = pessoa.id "
    
    cols = ["pessoa.id", "pessoa.nome", "profissional.registro", "profissional.tipo"]
    sql += ut.where_pesquisa(self.pesquisar, cols)
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
