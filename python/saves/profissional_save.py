from save import sg, ut, Save

# classe personalizada de atualização do profissional
class ProfissionalSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    # atributos pessoa
    self.pessoa = self.model.pessoa.find(self.dic['id'] or 0)
    content = [[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))
    ] for k, v in self.pessoa.items()]
    
    # atributos profissional
    for k, v in self.dic.items():
      if k == "id": continue
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]

      if k == "tipo":
        opc = ["Dentista", "Médico", "Veterinário"]
        aux.append(sg.Combo(opc, default_value=v, key=f"-{k.upper()}-", size=44))
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))

      content.append(aux)
    return content
  
  # retorna vazio para desativar a gravação padrão e controlar em controller_helper
  def get_params(self, values, dic):
    return {}

  # gravação personalizada
  def controller_helper(self, event, values):
    if event == " Salvar ":
      profissional = super().get_params(values, self.dic)
      pessoa = super().get_params(values, self.pessoa)

      if pessoa["id"] == "":
        aux = self.model.pessoa.find_by_sql('select coalesce(max(id), 0) + 1 as id from pessoa;')
        pessoa["id"] = aux[0][0]
        profissional["id"] = aux[0][0]
        sql = self.model.pessoa.sql_ins(pessoa)
        sql += self.model.sql_ins(profissional)
      else:
        sql = self.model.pessoa.sql_upd(pessoa)
        sql += self.model.sql_upd(profissional)
      self.error_out(self.model.commit(sql))