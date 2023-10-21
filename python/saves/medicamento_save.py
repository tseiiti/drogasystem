from save import sg, ut, Save

# classe personalizada de atualização do medicamento
class MedicamentoSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    # valor inicial de laboratório
    lab = self.model.laboratorio.find(self.dic["laboratorio_id"]) if self.dic["laboratorio_id"] != "" else { "nome": "" }

    content = []
    for k, v in self.dic.items():
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]
      
      if k == "laboratorio_id":
        aux.append(sg.Combo([opcao[0] for opcao in self.model.laboratorio.select(cols="nome")], default_value=lab["nome"], key=f"-{k.upper()}-", size=44))
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
    params["laboratorio_id"] = self.model.laboratorio.where(f"nome = '{params['laboratorio_id']}'", cols="id")[0][0]
    return params
