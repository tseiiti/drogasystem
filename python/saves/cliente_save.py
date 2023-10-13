from save import sg, ut, Save

# classe personalizada de atualização do cliente
class ClienteSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    self.pessoa = self.model.pessoa.find(self.dic['id'])
    content = [[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))
    ] for k, v in self.pessoa.items()]
    
    content.extend([[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-")
    ] for k, v in self.dic.items() if k != "id"])
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    return {}

  def controller_helper(self, event, values):
    if event == " Salvar ":
      params = super().get_params(values, self.dic)
      print(params)
      x = {
        str(key).replace("-", "").lower(): val 
        for key, val in values.items() 
        if str(key).replace("-", "").lower() in self.pessoa.keys()
      }
      print(x)
