# EXERCÍCIO 1: map, select, sum e group_by
#
# `vendas` é uma lista de hashes com :produtor, :produto e :valor_em_centavos.
#
# 1. `produtos_vendidos(vendas)` devolve a lista de nomes de produto, sem repetir.
# 2. `total_do_produtor(vendas, produtor)` soma, EM CENTAVOS, as vendas daquele produtor.
# 3. `total_por_produtor(vendas)` devolve um hash: produtor => total em centavos.
# 4. `ticket_medio_em_reais(vendas)` devolve a média por venda, em reais.
#    Se a lista estiver vazia, devolva 0.0 (e não NaN).
#
# Verifique com:  ruby bin/verificar aula2 01

def vendas      
  [
  { produtor: "Horta da Vila",   valor_em_centavos: 1200 },
  { produtor: "Sítio Boa Terra", valor_em_centavos: 800 },
  { produtor: "Horta da Vila",   valor_em_centavos: 450 }
]
end

def produtos_vendidos(vendas)
  nomes = []
  vendas.each do |venda|
      unless nomes.include?(venda[:produto])
        nomes << venda[:produto]
      end
  end
  nomes
end

def total_do_produtor(vendas, produtor) 
  total = 0
  vendas.each do |venda|
    if venda[:produtor] == produtor
      total += venda[:valor_em_centavos]
    end
  end
  total
end

def total_por_produtor(vendas)
  
  totais = Hash.new(0)
  vendas.each do |venda|
    totais[venda[:produtor]] += venda[:valor_em_centavos]
  end
  totais
end

def ticket_medio_em_reais(vendas)
  return 0.0 if vendas.empty?
  total_centavos = 0
  vendas.each do |venda|
    total_centavos += venda[:valor_em_centavos]
  end
  
  (total_centavos / 100.0) / vendas.size
end