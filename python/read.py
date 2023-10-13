from app import sg, ut, App

# tela padrão para listar conteúdo das tabelas
class Read(App):
  # define a tabela e a tela de atualização
  def __init__(self, model, save):
    self.model = model
    self.save = save
    self.save.set_model(self.model)

  # define os componentes da tela
  def view(self):
    self.set_cols_rows()
    layout = [
      [sg.Image(f'images/{self.model.tname.lower()}_horizontal.png')], 
      [ut.titulo(f"Lista de {ut.corretor(self.model.tname, plural=True, title=True)}")], 
      [ut.gen_table(self.rows, self.cols)], 
      [sg.Button(" Voltar "), sg.Button(" Novo ")]]
    
    self.window = sg.Window(ut.win_title(self.model.tname), layout, size=(900, 476))
    
  # define ações e regras da tela
  def controller(self, event, values):
    if event == " Novo ":
      self.edit(0)

    elif "+CLICKED+" in event and event[2][0] is not None:
      self.edit(self.rows[event[2][0]][0])

  # define o conteúdo da tabela
  def set_cols_rows(self):
    self.rows = self.model.select()
    self.cols = [ut.corretor(c) for c in self.model.columns()]
  
  # método auxiliar para chamar a tela auxiliar de atualização do registro
  def edit(self, id):
    self.save.set_dic(self.model.find(id))
    self.open(self.save)
    self.set_cols_rows()
    self.window["-TABLE-"].update(values=self.rows)
