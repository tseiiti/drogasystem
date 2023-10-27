from app import sg, ut, App

# tela padrão para listar conteúdo das tabelas
class Read(App):
  # define a tabela e a tela de atualização
  def __init__(self, model, save):
    self.model = model
    self.save = save

  # define os componentes da tela
  def view(self):
    self.win_size = (1000, 540)
    self.pesquisar = ""
    self.set_cols_rows()
    self.cols = [ut.corretor(c) for c in self.model.columns()]
    layout = [
      [sg.Image(f'images/{self.model.tname.lower()}_horizontal.png')], 
      [ut.titulo(f"Lista de {ut.corretor(self.model.tname, plural=True, title=True)}")], 
      [sg.HorizontalSeparator()], 
      [sg.Text(text="Pesquisar: ", size=14), sg.Input(key="-PESQUISAR-", enable_events=True), sg.Button("ATUALIZAR", size=13, font=('Arial Bold', 7))], 
      [sg.HorizontalSeparator()], 
      [sg.Text(font=('Arial', 1))], 
      [ut.gen_table(self.rows, self.cols)], 
      [sg.Button(" Voltar "), sg.Button(" Novo ")]]
    
    self.window = sg.Window(ut.win_title(self.model.tname), layout, size=self.win_size)
    
  # define ações e regras da tela
  def controller(self, event, values):
    if event == " Novo ":
      self.edit(0)

    elif event in ["-PESQUISAR-", "ATUALIZAR"]:
      self.pesquisar = values["-PESQUISAR-"]
      self.set_cols_rows()
      self.window["-TABLE-"].update(values=self.rows)
      
    elif "+CLICKED+" in event and event[2][0] is not None and event[2][0] > -1:
      self.edit(self.rows[event[2][0]][0])

  # define o conteúdo da tabela
  def set_cols_rows(self):
    s = ut.where_pesquisa(self.pesquisar, self.model.columns())
    sql = f"select * from {self.model.tn} {s} order by 1"
    self.rows = self.model.find_by_sql(sql)
  
  # método auxiliar para chamar a tela auxiliar de atualização do registro
  def edit(self, id):
    self.save.set_dic(self.model, id)
    self.open(self.save)
    self.set_cols_rows()
    self.window["-TABLE-"].update(values=self.rows)
