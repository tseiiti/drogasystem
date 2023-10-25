import random
from datetime import datetime, timedelta
from python.model import Model

model = Model()

# # insert laboratorio
# for lab in model.find_by_sql(f"select * from laboratorio order by 1;"):
#   print(f"insert into laboratorio values ({lab[0]}, '{lab[1]}', '{lab[2]}', '{lab[3]}');")

# # insert medicamento
# for med in model.find_by_sql(f"select * from medicamento order by 1;"):
#   print(f"insert into medicamento values ({med[0]}, {med[1]}, '{med[2]}', '{med[3]}', '{med[4]}', '{med[5]}', '{med[6]}', '{med[7]}', {med[8]});")

def exec(sql):
  print(sql)
  ret = model.commit(sql)
  if ret != "Fechar":
    print(ret)

def estoque(dat, med_id, preco, fval, fpre):
  # lote
  lot = random.randrange(100000, 999999)

  # data da validade
  val = dat + timedelta(days = fval * 30 + 30)
  val = datetime.strptime(val.strftime('1/%m/%Y'), '%d/%m/%Y').date() - timedelta(days = 1)
  
  # preco de compra
  pre = float(preco)
  pre = int(pre / fpre * 10)
  pre /= 10

  # quantidade comprada
  if preco > 600:
    qtd = random.randrange(3, 7, 3)
  elif preco > 300:
    qtd = random.randrange(5, 11, 5)
  elif preco > 100:
    qtd = random.randrange(5, 31, 5)
  elif preco > 40:
    qtd = random.randrange(2, 5) * 10
  else:
    qtd = random.randrange(3, 13) * 10

  sql = "insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) "
  sql += f"values ({med_id}, 'lote {lot}', '{dat}', '{val}', {pre}, {qtd}, {qtd}); "

  if model.find_by_sql(f"select count(*) from estoque_total where medicamento_id = {med_id}; ")[0][0] == 0:
    sql += f"insert into estoque_total (medicamento_id, total) values ({med_id}, {qtd}); "
  else:
    sql += f"update estoque_total set total = total - {qtd} where medicamento_id = {med_id}; "
    
  exec(sql)

def venda(clis, pros, dat, venda_id):
  sql = ""
  total = 0

  # cliente e profissional
  pro = None
  cli = None
  if random.randrange(3) > 0:
    cli = str(clis[random.randrange(len(clis))][0])

  # produtos em estoque
  s = "select estoque.id, estoque.medicamento_id, estoque.quant_atual, medicamento.preco, medicamento.controle, "
  s += "estoque.preco, estoque.data, estoque.validade from estoque "
  s += "inner join medicamento on medicamento.id = estoque.medicamento_id where quant_atual > 0 order by 1;"
  ests = model.find_by_sql(s)

  # quantidade de itens da venda
  qiv = random.randrange(3) + 1
  for i in range(qiv):

    # escolha do produto
    p = random.randrange(len(ests))

    est_id = ests[p][0]
    med_id = ests[p][1]
    qtd_atu = ests[p][2]
    preco = float(ests[p][3])
    contr = ests[p][4]
    
    # profissional
    if contr != "Não controlado":
      pro = str(pros[random.randrange(len(pros))][0])

    # quantidade do produto
    qtd_vnd = random.randrange(3) + 1
    if qtd_vnd > qtd_atu:
      qtd_vnd = qtd_atu

    # reposição do estoque
    if qtd_atu < 10:
      pr = ests[p][3]
      fval = (ests[p][7] - ests[p][6]).days / 30
      fpre = float(ests[p][3] / ests[p][5])
      estoque(dat.date(), med_id, pr, fval, fpre)

    # desconto para cliente de até 20% e 10% de chance dar desconto para não cliente até 5%
    desc = 0
    if cli:
      desc = qtd_vnd * preco * random.randrange(20) / 100
      desc = int(desc * 10) / 10
    elif random.randrange(10) > 0:
      desc = qtd_vnd * preco * random.randrange(5) / 100
      desc = int(desc * 10) / 10

    # totais
    tot = qtd_vnd * preco - desc
    total += tot

    sql += "insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) "
    sql += f"values ({venda_id}, {med_id}, {est_id}, {qtd_vnd}, {desc:.2f}, {tot:.2f}); "
    sql += f"update estoque set quant_venda = quant_venda + {qtd_vnd}, quant_atual = quant_atual - {qtd_vnd} where id = {est_id}; "
    sql += f"update estoque_total set total = total - {qtd_vnd} where medicamento_id = {med_id}; "
  
  sql = f"insert into venda ({'cliente_id, ' if cli else ''}{'profissional_id, ' if pro else ''}time_stamp, total) values ({cli + ', ' if cli else ''}{pro + ', ' if pro else ''}'{dat.date()}', {total:.2f}); " + sql
  exec(sql)



###############################################################################
# Estoque Inicial
if model.find_by_sql(f"select count(*) from estoque;")[0][0] == 0:
  # nomes = ['AAS', 'ACEBROFILINA', 'ACICLOVIR', 'ADAPALENO', 'ADAPEL', 'AIXA', 'ALBENDAZOL', 'ALLENASAL', 'ALOPURINOL', 'ALPRAZOLAM', 'AMOXICILINA', 'CLONAZEPAM', 'CLORIDRATO DE MEMANTINA', 'CLORIDRATO DE RANITIDINA', 'ELOCTATE', 'ELPROLIX', 'GLUCANTIME', 'LEMTRADA', 'MYOZYME', 'NASACORT', 'NEOZINE', 'NEXVIAZYME', 'OSCAL D', 'PLASIL', 'PRALUENT', 'SOCIAN', 'THYROGEN', 'URBANIL', 'XENPOZYME']
  nomes = ['AAS', 'ACEBROFILINA', 'ALOPURINOL', 'CLORIDRATO DE MEMANTINA', 'CLORIDRATO DE RANITIDINA', 'ELOCTATE', 'ELPROLIX', 'GLUCANTIME', 'LEMTRADA', 'MYOZYME', 'NASACORT', 'NEOZINE', 'NEXVIAZYME', 'OSCAL D', 'PLASIL', 'PRALUENT', 'SOCIAN', 'THYROGEN', 'URBANIL', 'XENPOZYME']
  # nomes = ['AAS']
  sql = "'" + "','".join(nomes) + "'"
  meds = model.find_by_sql(f"select id, nome, preco from medicamento where nome in ({sql}) order by 1;")
  dic = {}
  for med in meds:
    if (not med[1] in dic):
      dic[med[1]] = {}
      dic[med[1]]["val"] = random.randrange(6, 37, 6) # fator de validade
      dic[med[1]]["pre"] = random.uniform(1.8, 2.9) # fator de preço
      
  for med in meds:
    # data da compra
    dat = datetime.strptime('31/07/23', '%d/%m/%y').date()
    estoque(dat, med[0], med[2], dic[med[1]]["val"], dic[med[1]]["pre"])



##############################################################################
# Vendas e Estoque
# possiveis clientes e profissionais
clis = model.find_by_sql('select id from cliente;')
pros = model.find_by_sql('select id from profissional;')

# data inicial

if model.find_by_sql(f"select count(*) from venda;")[0][0] == 0:
  dat = datetime.strptime('01/08/23', '%d/%m/%y')
else:
  dat = model.find_by_sql('select max(time_stamp) from venda;')[0][0]
  dat = datetime.strptime(dat.strftime('%d/%m/%y'), '%d/%m/%y')

# venda_id inicial
venda_id = model.find_by_sql('select coalesce(max(id), 0) as id from venda;')[0][0]

# período de venda
for i in range(90):
  dat += timedelta(days = 1)

  # quantidade de vendas no dia
  for j in range(random.randrange(5)):
    venda_id += 1
    venda(clis, pros, dat, venda_id)
