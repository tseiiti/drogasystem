from save import sg, ut, Save

# classe personalizada de atualização do estoque
class EstoqueSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    # valor inicial de medicamento
    med = self.model.medicamento.find(self.dic["medicamento_id"]) if self.dic["medicamento_id"] != "" else { "nome": "" }

    content = []
    for k, v in self.dic.items():
      if k in ["quant_venda", "quant_atual"]: continue
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]

      if k == "medicamento_id":
        opc = [opcao[0] for opcao in self.model.medicamento.select(cols="nome")]
        aux.append(sg.Combo(opc, default_value=med["nome"], key=f"-{k.upper()}-", size=44))
      elif k in ["data", "validade"]: 
        inp, cal = ut.calendario(k, v)
        aux.append(inp)
        aux.append(cal)
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))

      content.append(aux)
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    params["medicamento_id"] = self.model.medicamento.where(f"nome = '{params['medicamento_id']}'", cols="id")[0][0]
    return params
