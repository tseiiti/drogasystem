from app import sg, App

class Read(App):
  def __init__(self, model, save):
    self.model = model
    self.save = save
    self.save.set_model(self.model)

  def view(self):
    self.set_cols_rows()
    layout = [
      [sg.Image(f'images/{self.model.tname.lower()}-horizontal.png')], 
      [self.titulo(f"Lista de {self.corretor(self.model.tname, True)}")], 
      [self.gen_table(self.rows, self.cols)], 
      [sg.Button(" Voltar "), sg.Button(" Novo ")]]
    
    self.window = sg.Window('DrogaSystem - ' + self.corretor(self.model.tname), layout, size=(800, 480))
    
  def controller(self, event, values):
    if event == " Novo ":
      self.edit(0)

    elif "+CLICKED+" in event and event[2][0] is not None:
      self.edit(self.rows[event[2][0]][0])

  def set_cols_rows(self):
    self.rows = self.model.select()
    self.cols = [self.corretor(c) for c in self.model.columns()]
  
  def edit(self, id):
    self.save.set_dic(self.model.find(id))
    self.open(self.save)
    self.set_cols_rows()
    self.window["-TABLE-"].update(values=self.rows)



# if __name__ == "__main__":
#   from model import Model
#   from save import Save
#   Read(Model("Categoria"), Save()).run()
