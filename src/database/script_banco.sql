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


select * from usuarios;


