from app import sg, ut, App

# tela padrão para listar conteúdo das tabelas
class Search(App):
  # define a tabela e a tela de atualização
  def __init__(self, model):
    self.model = model

  # define os componentes da tela
  def view(self):
    self.pesquisar = ""
    self.set_cols_rows()
    self.cols = [ut.corretor(c) for c in self.model.columns()]
    layout = [
      [ut.titulo(f"Lista de {ut.corretor(self.model.tname, plural=True, title=True)}")], 
      [sg.HorizontalSeparator()], 
      [sg.Text(text="Pesquisar: ", size=14), 
       sg.Input(key="-PESQUISAR-", enable_events=True), 
       sg.Button("ATUALIZAR", size=13, font=('Arial Bold', 7))], 
      [sg.Text(font=('Arial', 1))], 
      [ut.gen_table(self.rows, self.cols)], 
      [sg.Button(" Voltar ")]]
    
    self.window = sg.Window(ut.win_title(self.model.tname), layout, size=(700, 376), finalize=True)
    self.window["-PESQUISAR-"].set_focus()
    
  # define ações e regras da tela
  def controller(self, event, values):
    if event in ["-PESQUISAR-", "ATUALIZAR"]:
      self.pesquisar = values["-PESQUISAR-"]
      self.set_cols_rows()
      self.window["-TABLE-"].update(values=self.rows)

    elif "+CLICKED+" in event and event[2][0] is not None and event[2][0] > -1:
      self.ret = self.rows[event[2][0]][0], self.rows[event[2][0]][1]
      self.error = "Fechar"

  # define o conteúdo da tabela
  def set_cols_rows(self):
    self.rows = self.model.where(self.pesquisar)
