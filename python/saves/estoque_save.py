from save import sg, Save

# classe personalizada de atualização do estoque
class EstoqueSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    content = [[
      sg.Text(text=f"{self.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))
    ] for k, v in self.dic.items() if not k in ["medicamento_id", "quant_venda", "quant_atual"]]
    item = self.model.medicamento.find(self.dic["medicamento_id"]) if self.dic["medicamento_id"] != "" else { "nome": "" }
    content.append([
      sg.Text(text=f"Medicamento: ", size=14), 
      sg.Combo([opcao[1] for opcao in self.model.medicamento.select()], default_value=item["nome"], key="-MEDICAMENTO_ID-", size=44)])
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values):
    params = super().get_params(values)
    medicamento_id = self.model.medicamento.where(f"where nome = '{params['medicamento_id']}'")[0][0]
    params["medicamento_id"] = medicamento_id
    return params
