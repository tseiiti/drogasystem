from save import sg, ut, Save

# classe personalizada de atualização do venda
class VendaSave(Save):
  # personaliza atributos editáveis
  def get_content(self):

    content = [[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))]
      for k, v in self.dic.items()]
    
    # for k, v in self.dic.items():
    #   if k in ["quant_venda", "quant_atual"]: continue
    #   aux = [sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14)]
    #   if k in ["data", "validade"]: 
    #     aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", size=32, disabled=True))
    #     aux.append(sg.CalendarButton("CALENDÁRIO", size=13, font=('Arial Bold', 7), close_when_date_chosen=True, 
    #       target=f"-{k.upper()}-", format='%Y-%m-%d', default_date_m_d_y=(v.month, v.day, v.year)))
    #   elif k == "medicamento_id":
    #     aux.append(sg.Combo([opcao[0] for opcao in self.model.medicamento.select(cols="nome")], default_value=item["nome"], key=f"-{k.upper()}-", size=44))
    #   else:
    #     aux.append(sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id")))
    #   content.append(aux)
    return content
  
  # adiciona atributo personalizado na atualização
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    params["medicamento_id"] = self.model.medicamento.where(f"nome = '{params['medicamento_id']}'", cols="id")[0][0]
    return params
