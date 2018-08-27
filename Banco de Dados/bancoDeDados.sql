create table Sistema(
codigoSistema int primary key not null,
nome varchar(50) not null,
descricao ntext not null
)

create table Orgao
(
codigoOrgao int primary key not null,
descricao ntext not null,
nome varchar(30) not null,
imagem varchar(50) not null,
codigoSistema int not null
constraint fkSistema foreign key(codigoSistema) references Sistema(codigoSistema)
)



create table Usuario(
codigoUsuario int primary key not null,
nome varchar(30) not null,
sobrenome varchar(30) not null,
senha varchar(30) not null,
email varchar(40) not null,
)

create table Acesso(
idAcesso int primary key not null,
data datetime not null,
codigoUsuario int not null
constraint fkUsuario foreign key(codigoUsuario) references Usuario(codigoUsuario),
senha varchar(30) not null
constraint fkSenha foreign key(senha) references Usuario(senha)
)

create table Quiz
(
codigoQuiz int primary key not null,
pergunta ntext  not null,
resposta ntext not null,
codigoUsuario int not null
constraint fkQuizUsuario foreign key(codigoUsuario) references Usuario(codigoUsuario)
)

create table Ranking
(
codigoQuiz int primary key not null,
nome varchar(30) not null,
codigoUsuario int not null
constraint fkRnkUsuario foreign key(codigoUsuario) references Usuario(codigoUsuario),
pontos int not null,
data datetime not null
)
