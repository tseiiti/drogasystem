import PySimpleGUI as sg
from conexao  import con
from tela import tela
from querys import Query

class cliente_tela_cadastro():
    def __init__(self) -> None:
        pass

    def view(self):
        texto = ['Nome','CPF','Telefone']
        nome_tela = 'Cliente'
        keys = ['-input_nome_cli-','-input_razao_cli-','-input_cnpj_cli-']

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
                    insert_pessoa, insert_cliente  = q.query_cadastrar('cliente') # insert_pessoa: nome e telefone insert_cliente: cpf
                    print(valores[keys[0]])
                    # print(valores)
                    cursor.execute(insert_pessoa,
                        (valores[keys[0]],valores[keys[2]],))
                    
                    print(insert_pessoa)
                    print(insert_cliente)
                    con.commit()    

                    cursor.execute(insert_cliente,
                        (valores[keys[1]],))
                    con.commit()                                         
                except:
                    sg.popup_ok("Erro ao incluir")
            elif evento == '-canc-':
                valores[keys[0]] =''
                valores[keys[1]] = ''
                valores[keys[2]] = ''
                        
    
    