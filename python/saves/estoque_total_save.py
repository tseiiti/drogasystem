from save import sg, ut, Save

# classe personalizada de atualização do estoque total
class EstoqueTotalSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    content = []
    for k, v in self.dic.items():
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]

      if k == "medicamento_id":
        v = self.model.medicamento.find(self.dic["medicamento_id"])["nome"] if self.dic["medicamento_id"] else ""
        self.meds = [e for e in self.model.medicamento.select(cols="id, nome")]
        aux.append(sg.Combo([e[1] for e in self.meds], default_value=v, key=f"-{k.upper()}-", size=44, enable_events=True, disabled=True))
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k in ["id", "total"])))

      content.append(aux)
    return content
    
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    params["medicamento_id"] = [e[0] for e in self.meds if e[1] == params["medicamento_id"]][0]
    return params
