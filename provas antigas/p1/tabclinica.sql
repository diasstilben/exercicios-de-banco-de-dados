Table PLANO_SAUDE {
  id_plano int [primary key]
  nome_plano varchar
}

Table CLIENTE {
  id_cliente int [primary key]
  nome_cliente varchar
  id_plano int // Chave estrangeira pode ser nula (0,1)
}

Table MEDICO {
  id_medico int [primary key]
  nome_medico varchar
  especialidade varchar
}

Table CONSULTA {
  id_consulta int [primary key]
  data_hora_consulta datetime
  id_cliente int
  id_medico int
}

Table CATEGORIA_EXAME {
  id_categoria int [primary key]
  nome_categoria varchar
}

Table EXAME {
  id_exame int [primary key]
  data_realizacao date
  resultado int [note: 'Escala de 1 a 10']
  id_consulta int
  id_categoria int
}

// ----------------------------------------------
// Relacionamentos (Chaves Estrangeiras)
// ----------------------------------------------

// Vários clientes podem ter o mesmo plano de saúde
Ref: CLIENTE.id_plano > PLANO_SAUDE.id_plano

// Um cliente pode ter várias consultas
Ref: CONSULTA.id_cliente > CLIENTE.id_cliente

// Um médico pode realizar várias consultas
Ref: CONSULTA.id_medico > MEDICO.id_medico

// Uma consulta pode gerar vários exames
Ref: EXAME.id_consulta > CONSULTA.id_consulta

// Uma categoria pode agrupar vários exames
Ref: EXAME.id_categoria > CATEGORIA_EXAME.id_categoria