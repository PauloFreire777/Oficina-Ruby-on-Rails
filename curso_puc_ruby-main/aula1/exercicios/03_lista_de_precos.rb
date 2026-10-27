# EXERCÍCIO 3: array, hash e laço
#
# `produtos` é uma lista de hashes, cada um com :nome e :preco_em_centavos.
#
# 1. `nomes(produtos)` devolve uma lista só com os nomes.
# 2. `mais_caro(produtos)` devolve o hash do produto mais caro.
# 3. `total_em_reais(produtos)` devolve a soma dos preços, em reais (Float).
#
# Verifique com:  ruby bin/verificar aula1 03

def nomes(produtos)
  lista = []
  produtos.each do |produto|
    lista << produto[:nome]
  end
  lista
end

def mais_caro(produtos)
  produtos.max_by { |produto| produto[:preco_em_centavos] }
end

def total_em_reais(produtos)
  produtos.sum { |produto| produto[:preco_em_centavos] } / 100.0
end