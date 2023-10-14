from save import sg, ut, Save

# classe personalizada de atualização do profissional
class ProfissionalSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    self.pessoa = self.model.pessoa.find(self.dic['id'] or 0)

    # atributos pessoa
    content = [[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))
    ] for k, v in self.pessoa.items()]
    
    # atributos profissional
    content.extend([[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))
      if k != "tipo" else
        sg.Combo(["médico", "dentista", "veterinário"], default_value=v, key=f"-{k.upper()}-", size=44)
    ] for k, v in self.dic.items() if k != "id"])

    return content
  
  # retorna vazio para desativar a gravação padrão e controlar em controller_helper
  def get_params(self, values, dic):
    return {}

  # gravação personalizada
  def controller_helper(self, event, values):
    if event == " Salvar ":
      profissional = super().get_params(values, self.dic)
      pessoa = {
        str(key).replace("-", "").lower(): val 
        for key, val in values.items() 
        if str(key).replace("-", "").lower() in self.pessoa.keys()
      }

      if pessoa["id"] == "":
        aux = self.model.pessoa.find_by_sql('select max(id) + 1 id from pessoa;')
        pessoa["id"] = aux[0][0]
        profissional["id"] = aux[0][0]
        sql = self.model.pessoa.sql_ins(pessoa)
        sql += self.model.sql_ins(profissional)
      else:
        sql = self.model.pessoa.sql_upd(pessoa)
        sql += self.model.sql_upd(profissional)
      self.error_out(self.model.commit(sql))