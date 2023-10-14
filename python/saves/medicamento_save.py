from save import sg, ut, Save

# classe personalizada de atualização do medicamento
class MedicamentoSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    item = self.model.laboratorio.find(self.dic["laboratorio_id"]) if self.dic["laboratorio_id"] != "" else { "nome": "" }

    # content = [[
    #   sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
    #   sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")) 
    #   if k != "laboratorio_id" else 
    #   sg.Combo([opcao[0] for opcao in self.model.laboratorio.select(cols="nome")], default_value=item["nome"], key=f"-{k.upper()}-", size=44)
    # ] for k, v in self.dic.items()]

    content = []
    for k, v in self.dic.items():
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]
      if k == "laboratorio_id":
        aux.append(sg.Combo([opcao[0] for opcao in self.model.laboratorio.select(cols="nome")], default_value=item["nome"], key=f"-{k.upper()}-", size=44))
      elif k == "apresentacao":
        aux.append(sg.Combo(["sólido", "liquido", "semissólido"], default_value=v, key=f"-{k.upper()}-", size=44))
      elif k == "tipo":
        aux.append(sg.Combo(["genérico", "similar", "referência"], default_value=v, key=f"-{k.upper()}-", size=44))
      elif k == "controle":
        aux.append(sg.Combo(["não controlado", "A2", "A3", "B1", "B2", "C1", "C2", "AM"], default_value=v, key=f"-{k.upper()}-", size=44))
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))
      
      content.append(aux)

    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    params["laboratorio_id"] = self.model.laboratorio.where(f"nome = '{params['laboratorio_id']}'", cols="id")[0][0]
    return params
