from save import sg, Save

class MedicamentoSave(Save):
  def get_content(self):
    content = [[
      sg.Text(text=f"{self.corretor(k).capitalize()}: ", size=12), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))
    ] for k, v in self.dic.items() if k != "laboratorio_id"]
    item = self.model.laboratorio.find(self.dic["laboratorio_id"]) if self.dic["laboratorio_id"] != "" else { "nome": "" }
    content.append([
      sg.Text(text=f"Laboratório: ", size=12), 
      sg.Combo([item[1] for item in self.model.laboratorio.select()], default_value=item["nome"], key="-LABORATORIO_ID-", size=44)])
    return content
  
  def get_params(self, values):
    params = super().get_params(values)
    laboratorio_id = self.model.laboratorio.where(f"where nome = '{params['laboratorio_id']}'")[0][0]
    params["laboratorio_id"] = laboratorio_id
    return params
