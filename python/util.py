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
    if plural: corrigido += 's'
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
  