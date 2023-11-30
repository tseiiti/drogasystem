
class Query():
    def __init__(self) -> None:
        pass

    def query_listar(self, tela):
        if tela == 'cliente':
            query = "SELECT nome, cpf, telefone FROM cliente c JOIN pessoa p ON (c.id = p.id)"
        elif tela == 'laboratório':
            query = "SELECT nome, razao, cnpj FROM laboratorio"
        elif tela == 'medicamento':
            query = "SELECT nome, substancia, dosagem, quantidade, tipo, controle, classe FROM medicamento "
        return query
    
    def query_pesquisar(self, tela):
        if tela == 'cliente':
            query = "SELECT nome, cpf, telefone FROM cliente c JOIN pessoa p ON (c.id = p.id) WHERE p.nome ILIKE %s"
        elif tela == 'laboratório':
            query = "SELECT nome, razao, cnpj FROM laboratorio WHERE nome ILIKE %s"
        elif tela == 'medicamento':
            query = "SELECT nome, substancia, dosagem, quantidade, tipo, controle, classe FROM medicamento WHERE nome ilike %s"
        return query
    
    def query_cadastrar(self, tela):
        if tela == 'cliente':
            query = 'INSERT INTO pessoa (id, nome, logradouro, numero, '
            query += ' complemento, bairro,cep,cidade,estado,telefone) '
            query += ' VALUES((select CAST(id AS INT) from pessoa '
            query += ' group by id having max(id) = '
            query += ' (select max(id) from pessoa))+1, %s, '
            query += '\'Rua rua\', 1, NULL,\'Vila\',03152130,\'São Paulo\',\'SP\',%s)'

            query1 = 'INSERT INTO cliente (id, cpf, data_nasc,sexo) VALUES ((select CAST(id AS INT) from pessoa '
            query1 += ' group by id having max(id) = (select max(id) from pessoa)) ,%s,\'15-05-2000\',\'M\' ) '
            return query, query1
        elif tela == 'laboratório':
            query = "INSERT INTO laboratorio (id, nome, razao,cnpj) VALUES ((select id from laboratorio group by id having max(id) = (select max(id) from laboratorio))+1, %s , %s , %s  )"
        elif tela == 'medicamento':
            query = "INSERT INTO medicamento VALUES((select id from medicamento group by id having max(id) = (select max(id) from medicamento))+1,36,%s , %s , %s ,\'Sólido\',\'Similar\',\'Liberado\',NULL,(select ggrem from medicamento group by id having max(ggrem) = (select max(ggrem) from medicamento))+1,\'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO\', 33.84)"
        return query
    
    def query_excluir(self, tela):
        if tela == 'cliente':
            query_cli = 'delete from cliente where cpf = %s ' 
            query_pes =' delete from pessoa where nome ILIKE ''%s'' and telefone = %s '
            return query_cli, query_pes
        elif tela == 'laboratório':
            query = 'delete from laboratorio where nome ILIKE %s and razao ILIKE %s and cnpj ILIKE %s ' 
        elif tela == 'medicamento':
            query = ' Delete from medicamento where nome ILIKE %s and substancia ILIKE %s and dosagem ILIKE %s'
        
        return query