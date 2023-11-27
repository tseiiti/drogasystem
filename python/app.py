import PySimpleGUI as sg
from util import Util as ut

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
    self.ret = ""
    self.error = ""
    while True:
      event, values = self.window.read()
      # if event != "-PESQUISAR-":
      #   print(type(self).__name__ + ":", event, values)

      if event == " Voltar " or event == sg.WIN_CLOSED: break
      self.controller(event, values)
      if self.error == "Fechar": break
      
    self.window.close()
    return self.ret

  # método auxiliar que esconde a tela atual ao chamar outra tela
  def open(self, win):
    self.window.Hide()
    self.ret = win.run()
    self.window.UnHide()
  
  # método auxiliar para apresentar erro em formulário
  def error_out(self, error):
    if error != "Fechar":
      sg.popup(error, title="Erro!")
    self.error = error

  # método auxiliar para definir model
  def set_model(self, model):
    self.model = model
  