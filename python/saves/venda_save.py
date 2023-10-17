from save import sg, ut, Save

# classe personalizada de atualização do venda
class VendaSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    content = []
    for k, v in self.dic.items():
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]
      if k == "cliente_id": 
        aux.append(sg.Input(default_text=v, key=f"-CLIENTE_ID-", size=32, disabled=True))
        aux.append(sg.Button("CLIENTE", size=13, font=('Arial Bold', 7)))
      elif k == "profissional_id":
        aux.append(sg.Input(default_text=v, key=f"-PROFISSIONAL_ID-", size=32, disabled=True))
        aux.append(sg.Button("PROFISSIONAL", size=13, font=('Arial Bold', 7)))
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))
      content.append(aux)
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    params["medicamento_id"] = self.model.medicamento.where(f"nome = '{params['medicamento_id']}'", cols="id")[0][0]
    return params

  def controller_helper(self, event, values):
    if event == "-CLIENTE_ID-":
      print(self.window["-CLIENTE_ID-"])
      # print(values)
    if event == "-PROFISSIONAL_ID-":
      print(values)
      
