import PySimpleGUI as sg
from conf import dc

# classe padrão com funções primárias e auxiliares para todo o sistema
class App:
  # método abstract que retornará os compontes da tela
  def view(self):
    pass
  
  # método abstract que irá controlar ações e regras da tela
  def controller(self, event, values):
    pass
  
  # método principal que interage com cada ação na tela
  def run(self):
    sg.set_options(font=("Arial", 12))
    self.view()
    self.error = ""

    while True:
      event, values = self.window.read()
      print(type(self).__name__ + ":", event, values)

      if event == " Voltar " or event == sg.WIN_CLOSED:
        break

      self.controller(event, values)

      if self.error == "Fechar":
        break

    self.window.close()

  # método auxiliar que esconde a tela atual ao chamar outra tela
  def open(self, win):
      self.window.Hide()
      win.run()
      self.window.UnHide()
  
  # método auxiliar para gerar tabela
  def gen_table(self, values, headings):
    return sg.Table(
      values=values, 
      headings=headings,
      auto_size_columns=True,
      display_row_numbers=False,
      justification="center", 
      key="-TABLE-",
      selected_row_colors="black on gray",
      enable_events=True,
      expand_x=True,
      expand_y=False,
      enable_click_events=True)
  
  # método auxiliar para apresentar erro em formulário
  def error_out(self, error):
    if error != "":
      self.window["-SAIDA-"].update(error)
    self.error = error

  # método auxiliar para converter (lista de) chaves e valores em dicionário
  def gen_dict(self, keys, values=None):
    dic = {}
    for i in range(len(keys)):
      dic[keys[i]] = values[i] if values else ""
    return dic

  # método auxiliar para definir model
  def set_model(self, model):
    if model:
      self.model = model
  
  # método auxiliar para definir dic
  def set_dic(self, dic):
    if dic:
      self.dic = dic
  
  # método auxiliar que define a fonte do título dos formulários
  def titulo(self, text):
    return sg.Text(
      text=text, 
      font=("Arial Bold", 16), 
      size=16, 
      expand_x=True, 
      justification="center"
    )
  
  # método auxiliar para definir título da tela
  def win_title(self):
    return f'{self.corretor("main")} - {self.corretor(self.model.tname)}'
  
  # método auxiliar para trocar textos
  def corretor(self, texto, plural=False):
    corrigido = dc[texto.lower()] if texto.lower() in dc else texto
    if plural: corrigido += 's'
    if texto[0] == texto[0].upper():
      corrigido = corrigido[0].upper() + corrigido[1:]
    return corrigido