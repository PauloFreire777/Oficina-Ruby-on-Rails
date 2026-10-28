# EXERCÍCIO 3: uma classe
#
# Crie a classe `Produtor` com:
#   - `nome` e `cidade` de leitura (attr_reader)
#   - `initialize(nome, cidade)`
#   - `adicionar_produto(nome, preco_em_centavos)` que guarda o produto
#   - `produtos` devolvendo a lista de produtos (cada um um hash com :nome e :preco_em_centavos)
#   - `total_em_reais` somando os preços, em reais
#   - `to_s` devolvendo "Sítio Boa Terra (Piracicaba)"
#
# Verifique com:  ruby bin/verificar aula2 03

class Produtor
  attr_reader :nome, :cidade, :produtos

  def initialize(nome, cidade)
    @nome = nome
    @cidade = cidade
    @produtos = []
  end

  def adicionar_produto(nome, preco_em_centavos)
    @produtos << { nome: nome, preco_em_centavos: preco_em_centavos }
  end

  def total_em_reais
    total_centavos = 0
    
    @produtos.each do |produto|
      total_centavos += produto[:preco_em_centavos]
    end
    
    total_centavos / 100.0
  end

  def to_s
    "#{@nome} (#{@cidade})"
  end
end