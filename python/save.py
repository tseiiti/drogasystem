from app import sg, App

class Save(App):
  def view(self):
    content = self.get_content()
    btns = [sg.Button(" Voltar "), sg.Button(" Salvar ")]
    if self.add_extra_button(): btns.append(self.add_extra_button())
    
    col1 = [[sg.Image(f'images/{self.model.tname.lower()}-vertical.png')]]
    col2 = [
      [self.titulo(f"{'Criar' if self.dic['id'] == '' else 'Atualizar'} {self.corretor(self.model.tname)}")], 
      [sg.HorizontalSeparator()], 
      *content, 
      [sg.HorizontalSeparator()], 
      [sg.Text(key="-SAIDA-")], 
      btns]
    layout = [[sg.Column(col1), sg.Column(col2, vertical_alignment='top')]]
    
    self.window = sg.Window(self.model.tname, layout, size=(800, 480))
    
  def controller(self, event, values):
    if event == " Salvar ":
      params = self.get_params(values)
      if self.dic["id"] == "":
        self.error_out(self.model.insert(params))
      else:
        self.error_out(self.model.update(params))

      if self.error == "":
        self.error = "Fechar"
      
    self.controller_helper(event, values)

  def get_content(self):
    return [[
      sg.Text(text=f"{self.corretor(k).capitalize()}: ", size=12), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))]
      for k, v in self.dic.items()]

  def get_params(self, values):
    return {
      str(key).replace("-", "").lower(): val 
      for key, val in values.items() 
      if str(key).replace("-", "").lower() in self.dic.keys()
    }

  def add_extra_button(self):
    return None
  
  def controller_helper(self, event, values):
    print()



# if __name__ == "__main__":
#   from model import Model
#   model = Model("Categoria")
#   save = Save()
#   save.set_model(model)
#   save.set_dic(model.find(1))
#   save.run()
