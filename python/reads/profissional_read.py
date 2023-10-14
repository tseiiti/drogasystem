from read import ut, Read

# classe personalizada para listar profissionais
class ProfissionalRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "pessoa.id, pessoa.nome, profissional.registro, profissional.tipo "
    sql += "from pessoa "
    sql += "join profissional on profissional.id = pessoa.id "
    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)
    self.cols = [ut.corretor(c) for c in self.model.columns()]
