from save import sg, ut, Save

# classe personalizada de atualização do estoque
class EstoqueSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    content = []
    for k, v in self.dic.items():
      if k in ["quant_venda", "quant_atual"]: continue
      aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]

      if k == "medicamento_id":
        v = self.model.medicamento.find(self.dic["medicamento_id"])["nome"] if self.dic["medicamento_id"] else ""
        self.meds = [e for e in self.model.medicamento.select(cols="nome, id")]
        aux.append(sg.Combo([e[0] for e in self.meds], default_value=v, key=f"-{k.upper()}-", size=44, enable_events=True))
      elif k in ["data", "validade"]: 
        inp, cal = ut.calendario(k, v)
        aux.append(inp)
        aux.append(cal)
      else:
        aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))

      content.append(aux)
    return content
    
  def controller(self, event, values): 
    if event == " Salvar ":
      params = self.get_params(values, self.dic)
      medicamento_id = [e[1] for e in self.meds if e[0] == params["medicamento_id"]][0]

      if params["id"]:
        estoque = self.model.find(params["id"])
      else:
        estoque = { "quant_inicial": 0, "quant_venda": 0 }

      estoque_total = self.model.estoque_total.find(None, where=f"medicamento_id = {medicamento_id}")
      del estoque_total["minimo"]
      del estoque_total["maximo"]
          
      params["medicamento_id"] = medicamento_id
      params["quant_inicial"] = values["-QUANT_INICIAL-"]
      params["quant_atual"] = int(params["quant_inicial"]) - estoque["quant_venda"]

      if self.dic["id"]:
        sql = self.model.sql_upd(params)
      else:
        sql = self.model.sql_ins(params)
      
      if estoque_total["id"]:
        estoque_total["total"] += int(params["quant_inicial"]) - estoque["quant_inicial"]
        sql += self.model.estoque_total.sql_upd(estoque_total)
      else:
        estoque_total["medicamento_id"] = medicamento_id
        estoque_total["total"] = int(params["quant_inicial"]) 
        sql += self.model.estoque_total.sql_ins(estoque_total)

      self.error_out(self.model.commit(sql))
