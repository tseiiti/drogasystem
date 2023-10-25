import psycopg2
from conf import db
from util import Util as ut

# classe Object-Relational Mapping (ORM)
class Model:
  # define nome da tabela
  def __init__(self, tname=None):
    self.tname = type(self).__name__.replace("Model", "") if tname is None else tname
    self.tn = self.tname.lower()

  # select padrão
  def select(self, cols="*"):
    sql = f"select {cols} from {self.tn} order by 1;"
    return self.exec(sql, self.all)
  
  # select com condição
  def where(self, params, cols="*"):
    sql = f"select {cols} from {self.tn} {'where ' + params if params else ''} order by 1;"
    return self.exec(sql, self.all)
  
  # select personalizado
  def find_by_sql(self, sql):
    return self.exec(sql, self.all)
  
  # procura um registro específico
  def find(self, id, cols="*"):
    sql = f"select {cols} from {self.tn} where id = {id};"
    return self.exec(sql, self.one)

  # select com colunas
  def select_with_columns(self, cols="*"):
    sql = f"select {cols} from {self.tn} order by 1;"
    return self.exec(sql, self.all), self.cols

  # nomes das colunas
  def columns(self):
    return self.cols

  # auxiliar insert
  def sql_ins(self, params):
    col = ", ".join(k for k, v in params.items() if not ((k == "id" and v == "") or (v == None)))
    val = ", ".join(f"'{v}'" for k, v in params.items() if not ((k == "id" and v == "") or (v == None)))
    return f"insert into {self.tn} ({col}) values ({val});"

  # insert padrão
  def insert(self, params):
    return self.exec(self.sql_ins(params), self.com)

  # auxiliar update
  def sql_upd(self, params):
    aux = ", ".join(f"{k} = '{v}'" for k, v in params.items() if k != "id")
    return f"update {self.tn} set {aux} where id = {params['id']};"
  
  # update padrão
  def update(self, params):
    return self.exec(self.sql_upd(params), self.com)
  
  # atualizações personalizadas
  def commit(self, sql):
    return self.exec(sql, self.com)
  
  

  # método auxiliar para abrir uma conexão
  def conn(self):
    con = psycopg2.connect(
      database = db["database"],
      user = db["user"],
      password = db["password"],
      host = db["host"],
      port = db["port"])
    cur = con.cursor()
    return con, cur
  
  # método principal para execução dos comandos
  def exec(self, sql, fun):
    try:
      con, cur = self.conn()
      return fun(sql, con, cur)
      
    except (Exception, psycopg2.Error) as error:
      print("Error:", error)
      return error

    finally:
      # print("SQL:", sql)
      if cur: cur.close()
      if con: con.close()

  # executa selects e retorna todos os registros
  def all(self, sql, con, cur):
    cur.execute(sql)
    self.cols = [dsc[0] for dsc in cur.description]
    return cur.fetchall()
  
  # executa atualizações e commita
  def com(self, sql, con, cur):
    cur.execute(sql)
    con.commit()
    return "Fechar"

  # executa select e retorna 1 registro
  def one(self, sql, con, cur):
    cur.execute(sql)
    self.cols = [dsc[0] for dsc in cur.description]
    # return dict(zip(self.cols, cur.fetchone()))
    return ut.gen_dict(self.cols, cur.fetchone())
