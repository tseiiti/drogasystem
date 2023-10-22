from save import sg, ut, Save
from searchs.cliente_search import ClienteSearch
from searchs.profissional_search import ProfissionalSearch
from searchs.medicamento_search import MedicamentoSearch

# classe personalizada de atualização do venda
class VendaSave(Save):
  # personaliza atributos editáveis
  def get_content(self):
    self.rows = []
    self.cols = []
    sql = "select "
    sql += "medicamento.nome, medicamento.preco, itens_venda.quantidade, "
    sql += "itens_venda.desconto, itens_venda.total "
    sql += "from itens_venda "
    sql += "join medicamento on medicamento.id = itens_venda.medicamento_id "
    self.rows = self.model.find_by_sql(sql + "limit 0")
    self.cols = self.model.columns()

    if self.dic["id"]:
      sql += f"where itens_venda.venda_id = {self.dic['id']}"
      sql += "order by 1 "
      self.rows = self.model.find_by_sql(sql)

    self.cliente_id = self.dic["cliente_id"]
    cli = self.model.pessoa.find(self.dic["cliente_id"])["nome"] if self.dic["cliente_id"] else ""
    self.profissional_id = self.dic["profissional_id"]
    pro = self.model.pessoa.find(self.dic["profissional_id"])["nome"] if self.dic["profissional_id"] else ""

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
        sg.Input(default_text=self.dic['total'], key="-TOTAL-", disabled=True, size=14, font=('Arial Bold', 16))
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
    
    self.ws = (850, 650)
    return content
  
  # adiciona atributo personalizado na atualização|
  def get_params(self, values, dic):
    params = super().get_params(values, dic)
    params["cliente_id"] = self.cliente_id
    params["profissional_id"] = self.profissional_id
    print(params)
    # return params

  def controller_helper(self, event, values):
    if event == "CLIENTE":
      self.open(ClienteSearch(self.model.cliente))
      if self.ret:
        self.cliente_id = self.ret[0]
        self.window["-CLIENTE_ID-"].update(self.ret[1])
      
    if event == "PROFISSIONAL":
      self.open(ProfissionalSearch(self.model.profissional))
      if self.ret:
        self.profissional_id = self.ret[0]
        self.window["-PROFISSIONAL_ID-"].update(self.ret[1])
      
    # if event == "SELECIONAR" and not self.dic["id"]:
    if event == "SELECIONAR":
      self.open(MedicamentoSearch(self.model.medicamento))
      if self.ret and self.ret[0]:
        sql = "select "
        sql += "concat(laboratorio.nome, ', ', medicamento.nome, ' ', medicamento.dosagem"
        sql += ", '\n', medicamento.tipo, ', ', medicamento.apresentacao, ', ', medicamento.controle"
        sql += ", '\n', medicamento.apresentacao, ', ', medicamento.quantidade"
        sql += ", '\nR$ ', medicamento.preco) as descricao, "
        sql += "medicamento.nome, medicamento.preco, estoque.lote, estoque.quant_atual "
        sql += "from medicamento "
        sql += "join laboratorio on laboratorio.id = medicamento.laboratorio_id "
        sql += "join estoque on estoque.medicamento_id = medicamento.id "
        sql += "where estoque.quant_atual > 0 "
        sql += f"and estoque.id = {self.ret[0]}"
        rows = self.model.find_by_sql(sql)
        cols = self.model.columns()
        self.add = ut.gen_dict(cols, rows[0])
        self.window["-SAIDA-"].update(self.add['descricao'])
        self.window["-COLUNA-ESQUERDA-"].update(visible=True)
        self.window["-COLUNA-DIREITA-"].update(visible=True)
        self.window["ADICIONAR"].update(visible=True)
    
    if event == "ADICIONAR":
      preco = float(self.add["preco"])
      quantidade = int(values["-QUANTIDADE-"])
      desc_per = float(values["-DESCONTO-PORCENTAGEM-"])
      desc_rea = float(values["-DESCONTO-REAIS-"])
      if desc_per:
        desconto = preco * quantidade * desc_per / 100
      else:
        desconto = desc_rea
      total = preco * quantidade - desconto

      self.rows.append((self.add["nome"], f"{preco:.2f}", quantidade, f"{desconto:.2f}", f"{total:.2f}", self.add["quant_atual"]))
      self.window["-TABLE-"].update(values=self.rows)
      