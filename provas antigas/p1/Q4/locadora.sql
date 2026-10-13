Table FABRICANTE {
  cnpj varchar [primary key]
  nome varchar
}

// Superclasse Genérica
Table VEICULO {
  codigo_veiculo int [primary key]
  data_aquisicao date
  preco_aquisicao decimal
  cnpj_fabricante varchar 
}

// Subclasses Específicas
Table MOTOCICLETA {
  codigo_veiculo int [primary key]
  numero_cilindradas int
}

Table CARRO {
  codigo_veiculo int [primary key]
  numero_airbags int
  numero_porta_copos int
}

Table CAMINHAO {
  codigo_veiculo int [primary key]
  capacidade_carga decimal
}

// ----------------------------------------------
// Relacionamentos (Chaves Estrangeiras)
// ----------------------------------------------

// Relacionamento 1:N - Um Fabricante pode ter fornecido vários Veículos
Ref: VEICULO.cnpj_fabricante > FABRICANTE.cnpj

// Relacionamento de Herança 1:1 - As subclasses partilham o mesmo código do veículo
Ref: MOTOCICLETA.codigo_veiculo - VEICULO.codigo_veiculo
Ref: CARRO.codigo_veiculo - VEICULO.codigo_veiculo
Ref: CAMINHAO.codigo_veiculo - VEICULO.codigo_veiculo