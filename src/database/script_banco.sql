create database projeto_individual;
use projeto_individual;

create table usuarios (
id int primary key auto_increment,
nome varchar (100),
cpf char (11) unique,
email varchar(145),
senha varchar (50)
);

create table questionario (
id int primary key auto_increment,
pergunta1 varchar(200),
pergunta2 varchar(200)
);

create table notas(
id int primary key auto_increment,
nota_antes int,
nota_depois int,
fkUsuarios int,
constraint fkNotasUsuarios foreign key (fkUsuarios) references usuarios(id)
);

create table usuario_resposta (
fkUsuarios int,
fkQuestionario int,
primary key (fkUsuarios, fkQuestionario),
gostou varchar(100),
praticara char(3),
dataHora datetime default current_timestamp,
constraint fkRespostaUsuario foreign key (fkUsuarios) references usuarios(id),
constraint fkRespostaQuestionario foreign key (fkQuestionario) references questionario(id)
);


insert into questionario (pergunta1, pergunta2) values
('O que você mais gostou no site?', 'Pretende praticar mais atividades artísticas para o bem-estar emocional?');
select * from usuarios;
select * from notas;
select * from questionario;
select * from usuario_resposta;
delete from usuarios where id = 17;

create view ViewMediaAntes as select truncate(avg(nota_antes), 1) as MediaAntes  from notas ;
create view ViewMediaDepois as select truncate(avg(nota_depois), 1) as MediaDepois from notas ;

select count(id)  as 'Usários cadastrados no mês' from usuarios join usuario_resposta 
on fkUsuarios = usuarios.id where dataHora >= '2026-05-01 00:00:00';

create view ViewGraficos as select u.id, u.nome, nota_antes, nota_depois from usuarios as u join notas on fkUsuarios = u.id order by u.id desc limit 5;

create view ViewGeral as select u.id, u.nome, nota_antes, nota_depois, gostou as 'o que mais gostou do site?', praticara as 'pretende praticar mais atividades artísticas?' 
from usuarios as u join notas on notas.fkUsuarios = u.id join usuario_resposta on usuario_resposta.fkUsuarios = u.id;

create view ViewMenorNotaDepois as select u.nome, nota_antes, nota_depois from usuarios as u 
join notas on u.id = fkUsuarios where nota_depois = (select min(nota_depois) from notas);

create view ViewQtdNota10 as select count(u.id) as qtdNota10 from usuarios as u 
join notas on u.id = fkUsuarios where nota_depois = 10
;

select * from ViewMenorNotaDepois;
select * from ViewQtdNota10;
select * from ViewMediaAntes;
select * from ViewMediaDepois;
select * from ViewGeral;

create view ViewKPIS as select * from ViewMenorNotaDepois,
ViewQtdNota10,
ViewMediaAntes,
ViewMediaDepois;

select * from ViewKPIS;

select * from ViewGraficos ; 


