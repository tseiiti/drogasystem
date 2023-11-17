from app import sg, ut, App

# tela padrão para atualizar e criar um registro
class Save(App):
  # método para definir model e dic
  def set_dic(self, model, id):
    self.model = model
    self.dic = self.model.find(id)

  # método auxiliar que gera outros componentes da tela
  def get_content(self):
    return [[
      sg.Text(text=f"{ut.corretor(k, title=True)}: ", size=14), 
      sg.Input(default_text=v, key=f"-{k.upper()}-", disabled=(k=="id"))]
      for k, v in self.dic.items()]

  # define os componentes da tela
  def view(self):
    self.win_size = (812, 560)
    content = self.get_content()
    
    col1 = [[sg.Image(f'images/{self.model.tname.lower()}_vertical.png')]]
    col2 = [
      [ut.titulo(f"{'Atualizar' if self.dic['id'] else 'Criar'} {ut.corretor(self.model.tname)}")], 
      [sg.HorizontalSeparator()], 
      *content, 
      [sg.HorizontalSeparator()], 
      [sg.Text(font=('Arial', 1))], 
      self.add_buttons()]
    
    layout = [[sg.Column(col1), sg.Column(col2, vertical_alignment='top')]]
    self.window = sg.Window(ut.win_title(self.model.tname), layout, size=self.win_size)
    
  # define ações e regras da tela
  def controller(self, event, values):
    if event == " Salvar ":
      params = self.get_params(values, self.dic)
      if not params:
        pass
      elif self.dic["id"]:
        self.error_out(self.model.update(params))
      else:
        self.error_out(self.model.insert(params))

    self.controller_helper(event, values)

  # método auxiliar para definir conteúdo do registro que será enviado ao banco
  def get_params(self, values, dic):
    return {
      str(key).replace("-", "").lower(): val 
      for key, val in values.items() 
      if str(key).replace("-", "").lower() in dic.keys()
    }

  # método para inserir botões extra na tela
  def add_buttons(self):
    return [sg.Button(" Voltar "), sg.Button(" Salvar ")]
  
  # método abstract opcional de ações e regras
  def controller_helper(self, event, values):
    pass
