from save import sg, ut, Save

# classe personalizada de atualização do medicamento
class MedicamentoSave(Save):
  # personaliza atributos editáveis
  def get_content(self):

    content = []
    for k, v in self.dic.items():
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]
      
      if k == "laboratorio_id":
        v = self.model.laboratorio.find(self.dic["laboratorio_id"])["nome"] if self.dic["laboratorio_id"] else ""
        self.labs = [e for e in self.model.laboratorio.select(cols="id, nome")]
        aux.append(sg.Combo([e[1] for e in self.labs], default_value=v, key=f"-{k.upper()}-", size=44))
      elif k == "apresentacao":
        opc = ["sólido", "liquido", "semissólido"]
        aux.append(sg.Combo(opc, default_value=v, key=f"-{k.upper()}-", size=44))
      elif k == "tipo":
        opc = ["genérico", "similar", "referência"]
        aux.append(sg.Combo(opc, default_value=v, key=f"-{k.upper()}-", size=44))
      elif k == "controle":
        opc = ["não controlado", "A2", "A3", "B1", "B2", "C1", "C2", "AM"]
        aux.append(sg.Combo(opc, default_value=v, key=f"-{k.upper()}-", size=44))
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))

      content.append(aux)
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    params["laboratorio_id"] = [e[0] for e in self.labs if e[1] == params['laboratorio_id']][0]
    return params
