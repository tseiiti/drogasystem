from read import ut, Read

# classe personalizada para listar vendas
class VendaRead(Read):
  # personaliza atributos da lista
  def set_cols_rows(self):
    sql = "select "
    sql += "venda.id, venda.time_stamp, venda.total, cliente.cpf, profissional.registro "
    sql += "from venda "
    sql += "left join cliente on cliente.id = venda.cliente_id "
    sql += "left join profissional on profissional.id = venda.profissional_id "

    if self.pesquisar:
      sql += "where ( "
      sql += f"cast(venda.id as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or cast(venda.time_stamp as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or cast(cliente.cpf as varchar) ilike '%{self.pesquisar}%' "
      sql += f"or cast(profissional.registro as varchar) ilike '%{self.pesquisar}%' "
      sql += " ) "

    sql += "order by 1"
    self.rows = self.model.find_by_sql(sql)

  # método auxiliar para chamar a tela auxiliar de atualização do registro
  def edit(self, id):
    self.save.set_dic(self.model, id)
    self.open(self.save)
    self.set_cols_rows()
    self.window["-TABLE-"].update(values=self.rows)
    