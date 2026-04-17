Table colaborador {
  id_colaborador integer [pk, increment, not null]
  cpf char(11) [not null]
  nome varchar(100) [not null]
  telefone varchar(11) [not null]
  email varchar(100) [not null]
}

Table modulo {
  id_modulo integer [pk, increment, not null]
  descricao text [not null]
  objetivo text [not null]
  carga_horaria decimal(10,2) [not null]
}

Table conteudo {
  id_conteudo integer [pk, increment, not null]
  descricao text [not null]
  objetivo text [not null]
  carga_horaria decimal(10,2) [not null]
}

// N:M colaborador / modulo
Table inscricao {
  id_inscricao integer [pk, increment, not null]
  id_colaborador integer [not null]
  id_modulo integer [not null]
  dt_inscricao timestamp [not null]
}

// N:M modulo / conteudo
Table modulo_conteudo {
  id integer [pk, increment, not null]
  id_modulo integer [not null]
  id_conteudo integer [not null]
}

// TERNÁRIO: colaborador + modulo + conteudo
Table progresso {
  id_progresso integer [pk, increment, not null]
  id_colaborador integer [not null]
  id_modulo integer [not null]
  id_conteudo integer [not null]
  dt_inicio timestamp [not null]
  dt_fim timestamp
}

// certificado gerado ao concluir o módulo inteiro
Table certificado {
  id_certificado integer [pk, increment, not null]
  id_colaborador integer [not null]
  id_modulo integer [not null]
  dt_emissao timestamp [not null]
}

Ref: colaborador.id_colaborador < inscricao.id_colaborador
Ref: modulo.id_modulo < inscricao.id_modulo
Ref: modulo.id_modulo < modulo_conteudo.id_modulo
Ref: conteudo.id_conteudo < modulo_conteudo.id_conteudo
Ref: colaborador.id_colaborador < progresso.id_colaborador
Ref: modulo.id_modulo < progresso.id_modulo
Ref: conteudo.id_conteudo < progresso.id_conteudo
Ref: colaborador.id_colaborador < certificado.id_colaborador
Ref: modulo.id_modulo < certificado.id_modulo




////////////////////////////////////////////




enum situacao_matricula{
  CONCLUIDO 
  CANCELADO
}
Table colaborador {
  id_colaborador integer [pk, increment, not null]
  cpf char(11) [not null]
  nome varchar(100) [not null]
  telefone varchar(11) [not null]
  email varchar(100) [not null]
  instrutor boolean [not null, default: False]
}

Table modulo {
  id_modulo integer [pk, increment, not null]
  descricao text [not null]
  objetivo text [not null]
  carga_horaria decimal(10,2) [not null]
  colaborador_id integer [not null]
}

Table conteudo {
  id_conteudo integer [pk, increment, not null]
  descricao text [not null]
  objetivo text [not null]
  carga_horaria decimal(10,2) [not null]
}
Table documento {
  id integer [not null, increment]
  conteudo_id integer [not null]
  paginas integer [not null]
}

Table video {
  id integer [not null, increment]
  conteudo_id integer [not null]
  duracao integer [not null]
}

// N:M colaborador / modulo
Table inscricao {
  id_inscricao integer [pk, increment, not null]
  id_colaborador integer [not null]
  id_modulo integer [not null]
  status_matricula situacao_matricula [not null, default: 'INSCRITO']
  dt_inscricao timestamp [not null]
}

// N:M modulo / conteudo
Table modulo_conteudo {
  id integer [pk, increment, not null]
  id_modulo integer [not null]
  id_conteudo integer [not null]
}

// TERNÁRIO: colaborador + modulo + conteudo
Table progresso {
  id_progresso integer [pk, increment, not null]
  id_colaborador integer [not null]
  id_modulo integer [not null]
  id_conteudo integer [not null]
  dt_inicio timestamp [not null]
  dt_fim timestamp
}

// certificado gerado ao concluir o módulo inteiro
Table certificado {
  id_certificado integer [pk, increment, not null]
  id_colaborador integer [not null]
  id_modulo integer [not null]
  dt_emissao timestamp [not null]
}

Ref: colaborador.id_colaborador < inscricao.id_colaborador
Ref: modulo.id_modulo < inscricao.id_modulo
Ref: modulo.id_modulo < modulo_conteudo.id_modulo
Ref: conteudo.id_conteudo < modulo_conteudo.id_conteudo
Ref: colaborador.id_colaborador < progresso.id_colaborador
Ref: modulo.id_modulo < progresso.id_modulo
Ref: conteudo.id_conteudo < progresso.id_conteudo
Ref: colaborador.id_colaborador < certificado.id_colaborador
Ref: modulo.id_modulo < certificado.id_modulo

Ref: "conteudo"."id_conteudo" - "documento"."conteudo_id"

Ref: "conteudo"."id_conteudo" - "video"."conteudo_id"
