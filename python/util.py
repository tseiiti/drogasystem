import PySimpleGUI as sg
from conf import dc

class Util:

  # método auxiliar para converter (lista de) chaves e valores em dicionário
  def gen_dict(keys, values=None):
    dic = {}
    for i in range(len(keys)):
      dic[keys[i]] = values[i] if values else ""
    return dic
  
  # método auxiliar para gerar tabela
  def gen_table(values, headings):
    return sg.Table(
      values=values, 
      headings=headings,
      auto_size_columns=True,
      display_row_numbers=False,
      justification="center", 
      key="-TABLE-",
      selected_row_colors="black on gray",
      enable_events=True,
      expand_x=True,
      expand_y=False,
      enable_click_events=True)
  
  # método auxiliar para trocar textos
  def corretor(texto, plural=False, title=False):
    corrigido = dc[texto.lower()] if texto.lower() in dc else texto
    if plural:
      if corrigido[-1] == "l":
        corrigido = corrigido[:-1] + "is"
      else:
        corrigido += 's'
    if title: corrigido = corrigido.title()
    return corrigido
  
  # método auxiliar para definir título da tela
  def win_title(tname):
    return f'{Util.corretor("main")} - {Util.corretor(tname, title=True)}'
  
  # método auxiliar que define a fonte do título dos formulários
  def titulo(text):
    return sg.Text(
      text=text, 
      font=("Arial Bold", 16), 
      size=16, 
      expand_x=True, 
      justification="center"
    )
  
  def calendario(k, v):
    d = (v.month, v.day, v.year) if v else ""
    inp = sg.Input(default_text=v, key=f"-{k.upper()}-", size=32, disabled=True)
    cal = sg.CalendarButton("CALENDÁRIO", size=13, font=('Arial Bold', 7), close_when_date_chosen=True, 
            target=f"-{k.upper()}-", format='%Y-%m-%d', default_date_m_d_y=d)
    return inp, cal
  
  def where_pesquisa(pesquisa, columns, with_where=True):
    resultado = ""
    if pesquisa and columns:
      aux = []
      for col in columns:
        aux.append(f"cast({col} as varchar) ilike '%{pesquisa}%'")
      resultado = " or ".join(aux)
      if with_where:
        resultado = f"where {resultado} "
      else:
        resultado = f"and ({resultado}) "
    return resultado