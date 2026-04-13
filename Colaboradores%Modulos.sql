// A empresa disponibilizará os módulos com a descrição, o
// objetivo e a carga horária total. 
//Cada módulo terá conteúdos que devem ter a
// descrição, o objetivo e a carga horária.
// O colaborador poderá inscrever-se em mais de um módulo e os
// conteúdos podem ser oferecidos em mais de um módulo. 
//Ao inscrever-se no
// módulo, os conteúdos devem ficar disponíveis para cada colaborador e deve
// ser registrada a data e horário de início e fim de cada conteúdo para emissão
// do certificado de participação.
table colaborador{
  id_colaborador integer [pk,increment,not null]
  cpf char(11) [not null]
  nome varchar (100) [not null]
  telefone phone (11) [not null]
  email email [not null]
}
Table colaboradorInscrito {
  id_colaborador_moldulo integer [pk,increment,not null]
  id_colaborador integer [not null]
  id_modulo integer [not null]
}
table modulos{
  id_modulo integer [pk,increment,not null]
  descricao_modulo text [not null]
  objetivo text [not null]
  cargaHorariaHoras decimal (10,2) 
}
table conteudosNoModulo {
  id_contpormodulo integer [pk,increment,not null]
  id_modulo integer [not null]
  id_conteudo  integer [not null]
}
table conteudo {
  id_conteudo integer [pk,increment,not null]
  descricao text [not null]
  objetivo text [not null]
  cargaHorariaHoras decimal (10,2) 
}
table emissaoCertificado{
  id_certificado integer [pk,increment,not null]
  id_modulo integer [not null]
  id_conteudo integer [not null]
  dt_inicio date [not null]
  dt_fim date [not null]
}


Ref: "colaborador"."id_colaborador" < "colaboradorInscrito"."id_colaborador"

Ref: "modulos"."id_modulo" < "colaboradorInscrito"."id_modulo"

Ref: "modulos"."id_modulo" < "conteudosNoModulo"."id_modulo"

Ref: "conteudo"."id_conteudo" < "conteudosNoModulo"."id_conteudo"
