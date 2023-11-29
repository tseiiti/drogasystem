import PySimpleGUI as sg
from conexao  import con
from tela import tela
from querys import Query

class medicamento_tela_cadastro():
    def __init__(self) -> None:
        pass

    def view(self):
        texto = ['Nome: ','Substância: ','Dosagem: ']
        nome_tela = 'medicamentos'
        keys = ['-input_nome_med-','-input_substancia_med-','-input_dosagem_med-']

        layout = [
            [[sg.Text(f'Cadastro de {nome_tela}')],
            [sg.Text(texto[0]), sg.Input(key = keys[0],do_not_clear=False)],
            [sg.Text(texto[1]), sg.Input(key = keys[1],do_not_clear=False)],
            [sg.Text(texto[2]), sg.Input(key = keys[2],do_not_clear=False)],
            [sg.Button('Cadastrar', key ='-cad-') ,sg.Button('Cancelar', key = '-canc-'),
            sg.Button('Sair', key = '-sair-')]]
        ]
        window = sg.Window(nome_tela, layout, size = (710,450))
        return window, keys
    
    def evento(self ):
        window, keys = self.view()
        while True:
            evento, valores = window.read()

            if evento == '-sair-' or evento == sg.WIN_CLOSED:
                window.close()
                break
            elif evento == '-cad-':
                cursor = con.cursor()
                q = Query()
                try:
                    query1 = q.query_cadastrar('medicamento')
                    cursor.execute(query1,
                        (valores[keys[0]],valores[keys[1]],valores[keys[2]],))
                    con.commit()                                             
                except Exception as error: 
                    print(error)
                    sg.popup_ok("Erro ao incluir")
            elif evento == '-canc-':
                valores[keys[0]] =''
                valores[keys[1]] = ''
                valores[keys[2]] = ''
                        
    
    