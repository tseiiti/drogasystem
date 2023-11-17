from save import sg, ut, Save
from searchs.cliente_search import ClienteSearch
from searchs.profissional_search import ProfissionalSearch
from searchs.medicamento_search import MedicamentoSearch

# classe personalizada de atualização do venda
class VendaSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    # títulos das colunas
    sql = "select "
    sql += "medicamento.nome, medicamento.preco, itens_venda.quantidade, "
    sql += "itens_venda.desconto, itens_venda.total "
    sql += "from itens_venda "
    sql += "join medicamento on medicamento.id = itens_venda.medicamento_id "
    self.rows = self.model.find_by_sql(sql + "limit 0")
    self.cols = [ut.corretor(c) for c in self.model.columns()]

    # valores de consulta
    self.total_venda = self.dic["total"] if self.dic["total"] else 0.0
    self.cliente_id = self.dic["cliente_id"]
    self.profissional_id = self.dic["profissional_id"]
    cli = self.model.pessoa.find(self.cliente_id)["nome"] if self.cliente_id else ""
    pro = self.model.pessoa.find(self.profissional_id)["nome"] if self.profissional_id else ""

    # seleciona itens de venda para consulta
    if self.dic["id"]:
      sql += f"where itens_venda.venda_id = {self.dic['id']}"
      sql += "order by 1 "
      self.rows = self.model.find_by_sql(sql)

    content = [
      [
        sg.Text(text="Cliente: ", size=10), 
        sg.Input(default_text=cli, key="-CLIENTE_ID-", size=38, disabled=True), 
        sg.Button("CLIENTE", size=20, font=('Arial Bold', 7))
      ], [
        sg.Text(text="Profissional: ", size=10), 
        sg.Input(default_text=pro, key="-PROFISSIONAL_ID-", size=38, disabled=True), 
        sg.Button("PROFISSIONAL", size=20, font=('Arial Bold', 7))
      ], [
        sg.Text(text="Id: ", size=10), sg.Input(default_text=self.dic["id"], key="-ID-", disabled=True, size=16), 
        sg.Text(text="", size=4), 
        sg.Text(text="Total R$", size=7, font=('Arial Bold', 14)), 
        sg.Input(default_text=f"{self.total_venda:.2f}", key="-TOTAL-", disabled=True, size=14, font=('Arial Bold', 16))
      ], 
      [sg.HorizontalSeparator()], 
      [sg.Text(font=('Arial', 1))], 
      [ut.titulo("Itens de Venda")], 
      [sg.Column([[
          sg.Button("SELECIONAR", size=20, font=('Arial Bold', 10)),
          sg.Button("ADICIONAR", size=20, font=('Arial Bold', 10), visible=False)]], justification='center')
      ], [
        sg.Column([
          [sg.Text(text="Quantidade", size=10), sg.Input(default_text="1", key="-QUANTIDADE-", size=8)], 
          [sg.Text(text="Desconto %", size=10), sg.Input(default_text="0.0", key="-DESCONTO-PORCENTAGEM-", size=8)], 
          [sg.Text(text="Desconto R$", size=10), sg.Input(default_text="0.00", key="-DESCONTO-REAIS-", size=8)]
        ], key="-COLUNA-ESQUERDA-", visible=False), 
        sg.Column([
          [sg.Text(key="-SAIDA-", font=('Arial Bold', 13), size=(40, 4))]
        ], key="-COLUNA-DIREITA-", visible=False)
      ], 
      [ut.gen_table(self.rows, self.cols)]
    ]

    self.win_size = (850, 650)
    return content

  def controller(self, event, values): 
    if self.dic["id"] and event in (" Salvar ", "CLIENTE", "PROFISSIONAL", "SELECIONAR", "ADICIONAR"): 
      sg.popup("Não é possível alterar uma venda")

    elif event == " Salvar ":
      # projeta o id da venda para inserts dos itens
      aux = self.model.find_by_sql('select coalesce(max(id), 0) + 1 as id from venda;')

      # cria insert da venda
      venda = self.get_params(values, self.dic)
      venda['id'] = aux[0][0]
      venda['cliente_id'] = self.cliente_id if self.cliente_id else None
      venda['profissional_id'] = self.profissional_id if self.profissional_id else None
      sql = self.model.sql_ins(venda)

      for row in self.rows:
        # cria inserts dos itens de venda
        dic = {
          "venda_id": aux[0][0], 
          "estoque_id": row[5], 
          "medicamento_id": row[6], 
          "quantidade": row[2], 
          "desconto": row[3], 
          "total": row[4]
        }
        sql += self.model.itens_venda.sql_ins(dic)

        # cria updates do estoque
        est = self.model.estoque.find(row[5])
        dic = {
          "id": row[5],
          "quant_venda": est["quant_venda"] + row[2], 
          "quant_atual": est["quant_atual"] - row[2]
        }
        sql += self.model.estoque.sql_upd(dic)

        # cria updates do total do estoque
        tot = self.model.estoque_total.where(f"medicamento_id = {row[6]}", "id, total")[0]
        dic = {
          "id": tot[0],
          "total": tot[1] - row[2]
        }
        sql += self.model.estoque_total.sql_upd(dic)

      if self.total_venda > 0:
        self.error_out(self.model.commit(sql))
      else:
        sg.popup("Adicione um item de venda")

    elif event == "CLIENTE":
      self.open(ClienteSearch(self.model.cliente))
      if self.ret:
        self.cliente_id = self.ret[0]
        self.window["-CLIENTE_ID-"].update(self.ret[1])
      
    elif event == "PROFISSIONAL":
      self.open(ProfissionalSearch(self.model.profissional))
      if self.ret:
        self.profissional_id = self.ret[0]
        self.window["-PROFISSIONAL_ID-"].update(self.ret[1])
      
    elif event == "SELECIONAR":
      self.open(MedicamentoSearch(self.model.medicamento))
      if self.ret and self.ret[0]:
        sql = "select estoque.id, estoque.medicamento_id, "
        sql += "concat(laboratorio.nome, ', ', medicamento.nome, ' ', medicamento.dosagem, "
        sql += "'\n', medicamento.tipo, ', ', medicamento.apresentacao, ', ', medicamento.controle, "
        sql += "'\n', medicamento.apresentacao, ', ', medicamento.quantidade, "
        sql += "'\npreço unitário: R$ ', medicamento.preco) as descricao, "
        sql += "medicamento.nome, medicamento.preco, estoque.lote, estoque.quant_atual "
        sql += "from medicamento "
        sql += "join laboratorio on laboratorio.id = medicamento.laboratorio_id "
        sql += "join estoque on estoque.medicamento_id = medicamento.id "
        sql += "where estoque.quant_atual > 0 "
        sql += f"and estoque.id = {self.ret[0]}"
        rows = self.model.find_by_sql(sql)
        cols = self.model.columns()
        self.add = ut.gen_dict(cols, rows[0])
        self.window["-QUANTIDADE-"].update("1")
        self.window["-SAIDA-"].update(self.add['descricao'])
        self.window["-COLUNA-ESQUERDA-"].update(visible=True)
        self.window["-COLUNA-DIREITA-"].update(visible=True)
        self.window["ADICIONAR"].update(visible=True)
    
    elif event == "ADICIONAR":
      item = -1
      for i in range(len(self.rows)):
        if self.rows[i][6] == self.add["medicamento_id"]:
          item = i
          layout = [
            [sg.Text(f"Deseja substituir o item \"{self.rows[i][0]}\"?")], 
            [sg.Button(" Sim "), sg.Button(" Não ")]
          ]
          if sg.Window("Confirme", layout).read(close=True)[0] == " Sim ":
            self.rem_item(i, values)
            item = -1
      if item == -1: self.add_item(values)

    elif "+CLICKED+" in event and event[2][0] is not None and event[2][0] > -1 and not self.dic["id"]:
      self.rem_item(event[2][0], values)

  def rem_item(self, item, values):
    total = float(self.rows[item][4])
    self.total_venda -= total
    self.window["-TOTAL-"].update(f"{self.total_venda - total:.2f}")
    self.rows.pop(item)
    self.window["-TABLE-"].update(values=self.rows)

  def add_item(self, values):
    preco = float(self.add["preco"])
    if not values["-QUANTIDADE-"]:
      self.window["-QUANTIDADE-"].update("1")
      quantidade = 1
    else:
      quantidade = int(values["-QUANTIDADE-"])
    if not values["-DESCONTO-PORCENTAGEM-"]:
      self.window["-DESCONTO-PORCENTAGEM-"].update("0.0")
      desc_per = 0.0
    else:
      desc_per = float(values["-DESCONTO-PORCENTAGEM-"])
    if not values["-DESCONTO-REAIS-"]:
      self.window["-DESCONTO-REAIS-"].update("0.0")
      desc_rea = 0.0
    else:
      desc_rea = float(values["-DESCONTO-REAIS-"])
    if desc_per:
      desconto = preco * quantidade * desc_per / 100
    else:
      desconto = desc_rea
    total = preco * quantidade - desconto

    self.rows.append((self.add["nome"], f"{preco:.2f}", quantidade, f"{desconto:.2f}", f"{total:.2f}", self.add["id"], self.add["medicamento_id"]))
    self.window["-TABLE-"].update(values=self.rows)

    self.total_venda += total
    self.window["-TOTAL-"].update(f"{self.total_venda:.2f}")
    