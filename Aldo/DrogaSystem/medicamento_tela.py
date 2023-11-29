import PySimpleGUI as sg
from conexao  import con
from tela import tela
from querys import Query
from medicamento_cad import medicamento_tela_cadastro



class medicamento_tela(tela):
    def __init__(self) -> None:
        super(medicamento_tela, self).__init__()

    
    def view(self):
        
        colunas = ['Nome','Substância','Dosagem']
        keys = ['-tab_med-','-in_med-','-pesquisa_med-','-inclui_med-','-lista_med-','-sair_med-', '-exc_med-']

        layout = [
                    [sg.Table([['','',''],['','','']], colunas, num_rows=4, key = keys[0], auto_size_columns= True,
                               justification='center',selected_row_colors='black on white',enable_events=True,
                               expand_x=True,expand_y=True,enable_click_events=True, select_mode='browse' )],
                    [[sg.Text('Busca por medicamentos: '), sg.Input(key = keys[1])],
                    [sg.Button("Pesquisar", size = (self.largura,self.altura), key = keys[2]),
                    sg.Button("Incluir", size = (self.largura,self.altura), key = keys[3]),
                    sg.Button("Listar", size = (self.largura,self.altura), key = keys[4]),
                    sg.Button("Excluir", size = (self.largura,self.altura), key = keys[6]),
                    sg.Button("Sair", size = (self.largura,self.altura), key = keys[5])]]
                ]

        # Crio a janela
        window = sg.Window('Medicamento', layout, size = (710,450))
        return window, keys
    
    def evento(self):
        window, keys = self.view()
        query = Query() 
        while True:
                    # aqui eu leio os eventos que talvez estejam ocorrendo
            evento, valores = window.read()
             # se você apertar o botão OK o programa finaliza
            if evento == sg.WIN_CLOSED or evento == keys[5]: # botão sair
                break
            elif evento == keys[3]: # botão incluir
                window.hide()
                window_cad_lab = medicamento_tela_cadastro()
                window_cad_lab.evento()                
                window.UnHide()    
                cursor = con.cursor()            
                self.atualiza_table(cursor, window, keys)
                                
            elif evento == keys[4]: # botão listar
                with con:
                    with con.cursor() as cursor:
                        cursor.execute(query.query_listar('medicamento'))
                        resposta = cursor.fetchall()
                        self.dado =[]
                        dado_linha = []
                        for linha in range(len(resposta)):                 
                            for col in range(len(resposta[0])):
                                dado_linha.append(resposta[linha][col])
                            self.dado.append(dado_linha)
                            dado_linha = []
                        window[keys[0]].update(values = self.dado) # tabela
                        
            elif evento == keys[2]: # botão pesquisar
                with con:
                    with con.cursor() as cursor:
                        cursor.execute(query.query_pesquisar('medicamento'),
                            ('%' +valores[keys[1]] + '%',)) # input 
                        resposta = cursor.fetchall()
                        self.dado = []
                        dado_linha = []
                        for linha in range(len(resposta)):                 
                            for col in range(len(resposta[0])):
                                dado_linha.append(resposta[linha][col])
                            self.dado.append(dado_linha)
                            dado_linha = []
                        
                        window[keys[0]].update(values = self.dado)
            
            elif evento == keys[6]: # Excluir
                
                try:
                    ch = sg.popup_ok_cancel('Tem certeza que quer excluir?')
                    if ch=="OK":
                        query = Query()
                        print(nome,substancia, substancia)
                        del_med = query.query_excluir('medicamento')

                        cursor = con.cursor() # Deleta medicamento
                        cursor.execute(del_med, (nome,substancia, substancia))               
                        con.commit()                        
                        self.atualiza_table(cursor, window, keys)

                        cursor.close()
                except Exception as error: 
                    print(error)
                    cursor.close()
                    sg.popup_ok_cancel('Erro ao excluir')
                    

            elif evento == keys[0]: #table
                data_selected = []
                if self.dado:
                    data_selected = [self.dado[row] for row in valores[keys[0]]]
                if data_selected :
                    nome = (data_selected[0][0])      # Variável local
                    substancia = (data_selected[0][1])
                    dosagem = (data_selected[0][2])

                
        window.close()
    
    def atualiza_table(self, cursor, window, keys):
        window = window
        cursor = cursor
        query = Query()
        cursor.execute(query.query_listar('medicamento'))
        resposta = cursor.fetchall()
        self.dado =[]
        dado_linha = []
        for linha in range(len(resposta)):                 
            for col in range(len(resposta[0])):
                dado_linha.append(resposta[linha][col])
            self.dado.append(dado_linha)
            dado_linha = []
        window[keys[0]].update(values = self.dado)

        cursor.close()
    
    