from save import sg, ut, Save
from searchs.cliente_search import ClienteSearch
from searchs.profissional_search import ProfissionalSearch

# classe personalizada de atualização do venda
class VendaSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    content = []
    for k, v in self.dic.items():
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]
      if k == "cliente_id": 
        v = self.model.pessoa.find(self.dic["cliente_id"])["nome"] if self.dic["cliente_id"] else ""
        aux.append(sg.Input(default_text=v, key=f"-CLIENTE_ID-", size=32, disabled=True))
        aux.append(sg.Button("CLIENTE", size=13, font=('Arial Bold', 7)))
      elif k == "profissional_id":
        v = self.model.pessoa.find(self.dic["profissional_id"])["nome"] if self.dic["profissional_id"] else ""
        aux.append(sg.Input(default_text=v, key=f"-PROFISSIONAL_ID-", size=32, disabled=True))
        aux.append(sg.Button("PROFISSIONAL", size=13, font=('Arial Bold', 7)))
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))

      content.append(aux)
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    # params["medicamento_id"] = self.model.medicamento.where(f"nome = '{params['medicamento_id']}'", cols="id")[0][0]
    # return params
    print(params)

  def controller_helper(self, event, values):
    if event == "CLIENTE":
      self.open(ClienteSearch(self.model.cliente))
      if self.ret:
        self.window["-CLIENTE_ID-"].update(self.ret[1])
      
    if event == "PROFISSIONAL":
      self.open(ProfissionalSearch(self.model.profissional))
      if self.ret:
        self.window["-PROFISSIONAL_ID-"].update(self.ret[1])
      