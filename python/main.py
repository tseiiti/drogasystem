from app import sg, App
from model import Model
from read import Read
from save import Save
from models.medicamento_model import MedicamentoModel
from models.estoque_model import EstoqueModel
# from models.fita_model import FitaModel
# from models.cliente_model import ClienteModel
from reads.medicamento_read import MedicamentoRead
from reads.estoque_read import EstoqueRead
from saves.medicamento_save import MedicamentoSave
# from saves.fita_save import FitaSave
from saves.estoque_save import EstoqueSave
# from saves.cliente_save import ClienteSave

class Main(App):
  def view(self):
    layout = [[
      sg.Button("Laboratório", size=(10, 4)), 
      sg.Button("Medicamento", size=(10, 4)), 
      sg.Button("Estoque", size=(10, 4))
      ], [
      # sg.Button("Fita", size=(10, 4)), 
      # sg.Button("Cliente", size=(10, 4)), 
      sg.Button("Sair", key=" Voltar ", size=(10, 4))
      ]]
    
    self.window = sg.Window(self.corretor("main"), layout, size=(406, 210), resizable=True)

  def controller(self, event, values):
    if event == "Laboratório":
      self.open(Read(Model("Laboratorio"), Save()))

    elif event == "Medicamento":
      self.open(MedicamentoRead(MedicamentoModel(), MedicamentoSave()))

    elif event == "Estoque":
      self.open(EstoqueRead(EstoqueModel(), EstoqueSave()))

    # elif event == "Fita":
    #   FitaRead(FitaModel(), FitaSave()).run()

    # elif event == "Cliente":
    #   Read(ClienteModel(), ClienteSave()).run()

if __name__ == "__main__":
  Main().run()
