from app import sg, ut, App
from model import Model
from read import Read
from save import Save

from models.medicamento_model import MedicamentoModel
from models.estoque_model import EstoqueModel
from models.cliente_model import ClienteModel
from models.profissional_model import ProfissionalModel
from models.venda_model import VendaModel

from reads.medicamento_read import MedicamentoRead
from reads.estoque_read import EstoqueRead
from reads.cliente_read import ClienteRead
from reads.profissional_read import ProfissionalRead
from reads.venda_read import VendaRead

from saves.medicamento_save import MedicamentoSave
from saves.estoque_save import EstoqueSave
from saves.cliente_save import ClienteSave
from saves.profissional_save import ProfissionalSave
from saves.venda_save import VendaSave

# classe principal para execução e menu do sistema
class Main(App):
  # define os componentes da tela
  def view(self):
    layout = [[
      [sg.HorizontalSeparator()], 
      [sg.Image(f'images/drogasystem.png', expand_x=True, expand_y=True)]
      ], [
      sg.Button("Laboratório", size=(10, 4)), 
      sg.Button("Medicamento", size=(10, 4)), 
      sg.Button("Estoque", size=(10, 4)), 
      sg.Button("Cliente", size=(10, 4)), 
      sg.Button("Profissional", size=(10, 4)), 
      sg.Button("Venda", size=(10, 4)), 
      sg.Button("Sair", key=" Voltar ", size=(10, 4)), 
      [sg.HorizontalSeparator()]
      ], [
      [sg.Text(key="-SAIDA-", size=(40, 1))]
    ]]
    
    self.window = sg.Window(ut.corretor("main"), layout, size=(916, 400), resizable=True)

  # define ações e regras da tela
  def controller(self, event, values):
    if event == "Laboratório":
      self.open(Read(Model("Laboratorio"), Save()))

    elif event == "Medicamento":
      self.open(MedicamentoRead(MedicamentoModel(), MedicamentoSave()))

    elif event == "Estoque":
      self.open(EstoqueRead(EstoqueModel(), EstoqueSave()))

    elif event == "Cliente":
      self.open(ClienteRead(ClienteModel(), ClienteSave()))

    elif event == "Profissional":
      self.open(ProfissionalRead(ProfissionalModel(), ProfissionalSave()))

    elif event == "Venda":
      self.open(VendaRead(VendaModel(), VendaSave()))

if __name__ == "__main__":
  Main().run()
