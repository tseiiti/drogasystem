from save import sg, ut, Save

# classe personalizada de atualização do medicamento
class MedicamentoSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    content = [[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))
    ] for k, v in self.dic.items() if k != "laboratorio_id"]
    item = self.model.laboratorio.find(self.dic["laboratorio_id"]) if self.dic["laboratorio_id"] != "" else { "nome": "" }
    content.append([
      sg.Text(text=f"Laboratório: ", size=14), 
      sg.Combo([opcao[1] for opcao in self.model.laboratorio.select()], default_value=item["nome"], key="-LABORATORIO_ID-", size=44)])
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    laboratorio_id = self.model.laboratorio.where(f"where nome = '{params['laboratorio_id']}'")[0][0]
    params["laboratorio_id"] = laboratorio_id
    return params
