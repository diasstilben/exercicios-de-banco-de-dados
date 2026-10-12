Table PRODUTO {
  codigo int [primary key]
  titulo varchar
  preco decimal
}

// Subclasses de Produto
Table CD {
  codigo int [primary key]
  numero_bits int
}

Table VINIL {
  codigo int [primary key]
  estado_origem varchar
}

Table CAMISA {
  codigo int [primary key]
  material_principal varchar
}

Table ARTISTA {
  id_artista int [primary key]
  nome_artista varchar
}

// Tabela Associativa: Produtos <-> Artistas
Table PRODUTO_ARTISTA {
  codigo_produto int [primary key]
  id_artista int [primary key]
}

Table VENDEDOR {
  id_vendedor int [primary key]
  nome_vendedor varchar
}

Table VENDA {
  id_venda int [primary key]
  data_venda datetime
  id_vendedor int
}

// Tabela Associativa: Vendas <-> Produtos
Table ITEM_VENDA {
  id_venda int [primary key]
  codigo_produto int [primary key]
  quantidade int
  valor_item decimal
}

// ----------------------------------------------
// Relacionamentos (Chaves Estrangeiras)
// ----------------------------------------------

// Herança (Um-para-Um): O código da subclasse é o código do produto genérico
Ref: CD.codigo - PRODUTO.codigo
Ref: VINIL.codigo - PRODUTO.codigo
Ref: CAMISA.codigo - PRODUTO.codigo

// Um Produto tem vários Artistas / Um Artista tem vários Produtos
Ref: PRODUTO_ARTISTA.codigo_produto > PRODUTO.codigo
Ref: PRODUTO_ARTISTA.id_artista > ARTISTA.id_artista

// Um Vendedor realiza várias Vendas
Ref: VENDA.id_vendedor > VENDEDOR.id_vendedor

// Uma Venda contém vários Produtos / Um Produto está em várias Vendas
Ref: ITEM_VENDA.id_venda > VENDA.id_venda
Ref: ITEM_VENDA.codigo_produto > PRODUTO.codigo