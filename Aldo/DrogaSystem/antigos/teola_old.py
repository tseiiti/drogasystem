import PySimpleGUI as sg
from conexao  import con
from querys import Query


class tela:
    def __init__(self ) -> None:
        self.largura = 10
        self.altura = 3


    def view(self, tela):
        
        if tela == 'laboratório':
            colunas = ['Nome','Razão Social','CNPJ']
            nome_tela = 'Laboratório'
            key_tela = 'lab-'
            keys = ['-Tab'+key_tela,'-in_'+key_tela,'-pesquisa_'+key_tela,'-inclui_'+key_tela,'-lista_'+key_tela,'-sair_'+key_tela, '-exc_'+key_tela]
        elif tela == 'cliente':
            colunas = ['Nome','CPF','Telefone']
            nome_tela = 'Cliente'
            key_tela = 'cli-'
            keys = ['-Tab'+key_tela,'-in_'+key_tela,'-pesquisa_'+key_tela,'-inclui_'+key_tela,'-lista_'+key_tela,'-sair_'+key_tela, '-exc_'+key_tela]
        elif tela == 'medicamento':
            colunas = ['Nome','Preço','Substância','Dosagem','Quantidade', 'Tipo','Controle','Classe']
            nome_tela = 'medicamento'
            key_tela = 'med-'
            keys = ['-Tab'+key_tela,'-in_'+key_tela,'-pesquisa_'+key_tela,'-inclui_'+key_tela,'-lista_'+key_tela,'-sair_'+key_tela, '-exc_'+key_tela]


        layout = [
                    [sg.Table([['','',''],['','','']], colunas, num_rows=4, key = keys[0], auto_size_columns= True,
                               justification='center',selected_row_colors='black on white',enable_events=True,
                               expand_x=True,expand_y=True,enable_click_events=True, select_mode='browse' )],
                    [[sg.Text('Busca por laboratórios: '), sg.Input(key = keys[1])],
                    [sg.Button("Pesquisar", size = (self.largura,self.altura), key = keys[2]),
                    sg.Button("Incluir", size = (self.largura,self.altura), key = keys[3]),
                    sg.Button("Listar", size = (self.largura,self.altura), key = keys[4]),
                    sg.Button("Excluir", size = (self.largura,self.altura), key = keys[6]),
                    sg.Button("Sair", size = (self.largura,self.altura), key = keys[5])]]
                ]

        # Crio a janela
        window = sg.Window(nome_tela, layout, size = (710,450))
        return window, keys
    

    def view_cadastro(self,tela):
        if tela == 'laboratório':
            texto = ['Nome: ','Razão Social: ','CNPJ: ']
            nome_tela = 'Laboratório'
            keys = ['-input_nome_lab-','-input_razao_lab-','-input_cnpj_lab-']
        elif tela == 'cliente':
            texto = ['Nome: ','CPF: ','Telefone: ']
            nome_tela = 'Cliente'
            keys = ['-input_nome_cli-','-input_cpf_cli-','-input_tel_cli-']
        elif tela == 'medicamento':
            texto = ['Nome: ','Substância: ','Dosagem: ']
            nome_tela = 'medicamento'
            key_tela = 'med-'
            keys = ['-input_nome_med-','-input_razao_med-','-input_cnpj_med-']

        largura = 30
        altura = 3
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
    
    def evento_cadastro(self, tela):
        window, keys = self.view_cadastro(tela)
        while True:
            evento, valores = window.read()

            if evento == '-sair-' or evento == sg.WIN_CLOSED:
                break
            elif evento == '-cad-':
                with con:
                    with con.cursor() as cursor:
                        q = Query()
                        if tela == 'cliente':
                            try:
                                query1, query2 = q.query_cadastrar(tela)
                                cursor.execute(query1,
                                    (valores[keys[0]],valores[keys[2]],))
                                con.commit()
                                cursor.execute(query2,
                                (valores[keys[1]],))
                                con.commit()
                                cursor.execute('Delete from cliente where id = 26')
                                con.commit()  
                                cursor.execute('Delete from pessoa where id = 26')
                                con.commit()           
                                sg.popup_ok(f"{tela} cadastrado com sucesso!")                  
                            except:
                                sg.popup_ok("Erro ao incluir")
                        else:
                            try:
                                query1 = q.query_cadastrar(tela)
                                cursor.execute(query1,
                                    (valores[keys[0]],valores[keys[1]],valores[keys[2]],))
                                con.commit()
                                if tela == 'medicamento':
                                    cursor.execute('Delete from medicamento where id = 506')
                                # else:
                                #     cursor.execute('Delete from laboratorio where id = 55')
                                con.commit()           
                                sg.popup_ok(f"{tela} cadastrado com sucesso!")                  
                            except:
                                sg.popup_ok("Erro ao incluir")

                        


    
    def evento(self, tela):
        window, keys = self.view(tela)
        query = Query() 
        while True:
                    # aqui eu leio os eventos que talvez estejam ocorrendo
            evento, valores = window.read()
             # se você apertar o botão OK o programa finaliza
            if evento == sg.WIN_CLOSED or evento == keys[5]: # botão sair
                break
            elif evento == keys[3]: # botão incluir
                window.hide()
                window_cad_lab = self.evento_cadastro(tela)
                window.UnHide()
                                
            elif evento == keys[4]: # botão listar
                with con:
                    with con.cursor() as cursor:
                        cursor.execute(query.query_listar(tela))
                        resposta = cursor.fetchall()
                        dado =[]
                        dado_linha = []
                        for linha in range(len(resposta)):                 
                            for col in range(len(resposta[0])):
                                dado_linha.append(resposta[linha][col])
                            dado.append(dado_linha)
                            dado_linha = []
                        window[keys[0]].update(values = dado) # tabela
                        
            elif evento == keys[2]: # botão pesquisar
                with con:
                    with con.cursor() as cursor:
                        cursor.execute(query.query_pesquisar(tela),
                            ('%' +valores[keys[1]] + '%',)) # input 
                        resposta = cursor.fetchall()
                        dado = []
                        dado_linha = []
                        for linha in range(len(resposta)):                 
                            for col in range(len(resposta[0])):
                                dado_linha.append(resposta[linha][col])
                            dado.append(dado_linha)
                            dado_linha = []
                        
                        window[keys[0]].update(values = dado)
            
            elif evento == keys[6]: 
                
                
                ch = sg.popup_ok_cancel('Tem certeza que quer excluir?')
                if ch=="OK":
                    query = Query()
                    
                    cursor = con.cursor()
                    cursor.execute(query.query_excluir(tela),
                    (nome,razao, cnpj)) 
                    con.commit()

                    cursor.close()

            elif evento == keys[0] or evento == '+CICKED+': #table
                data_selected = []
                data_selected = [dado[row] for row in valores[keys[0]]]

                # self.nome = (data_selected[0][0]) # Caracteristica do self
                # self.razao = (data_selected[0][1])
                # self.cnpj = (data_selected[0][2])

                nome = (data_selected[0][0])      # Variável local
                razao = (data_selected[0][1])
                cnpj = (data_selected[0][2])
                print(nome)
                print(razao)

                
        window.close()