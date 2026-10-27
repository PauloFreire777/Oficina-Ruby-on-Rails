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

def produtos_vendidos(vendas)
  vendas.map { |venda| venda[:produto] }.uniq
end

def total_do_produtor(vendas, produtor)
  vendas.select { |venda| venda[:produtor] == produtor }
        .sum { |venda| venda[:valor_em_centavos] }
end

def total_por_produtor(vendas)
  vendas.group_by { |venda| venda[:produtor] }.transform_values do |vendas_do_produtor|
    vendas_do_produtor.sum { |venda| venda[:valor_em_centavos] }
  end
end

def ticket_medio_em_reais(vendas)
  return 0.0 if vendas.empty?
  vendas.sum { |venda| venda[:valor_em_centavos] }.fdiv(vendas.size) / 100.0
end