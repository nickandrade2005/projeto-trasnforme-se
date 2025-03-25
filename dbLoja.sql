-- apagar o banco de dados
drop database dbLoja;
 
-- criar o banco de dados
create database dbLoja;
 
-- acessar o banco de dados
use dbLoja;
 
-- criando as tabelas do banco de dados
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char(14) not null unique,
telCel char(10),
dataNasc date,
sexo char(1),
salario decimal(9,2),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado varchar(100),
siglaEst char(2),
complemento varchar(100),
primary key(codFunc)
);

create table tbFornecedores(
codforn int not null auto_increment,
nome varchar(50) not null,
email varchar(100),
cnpj char(18) not null,
primary key(codforn)	
);

create table tbprodutos(
codprod int not null auto_increment,
nome varchar(100),
valor decimal(9,2),
quantidade int,
database date,
codforn int not null,
primary key(codprod),
foreign key(codFunc)references(tbFornecedores));


create table tbcliente(
codcli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(9),
cpf char(14) not null unique,
primary key(codcli)	
);
create table tbusUsuario(
codUsu int not null auto_increment,
nome varchar(30) not null unique,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);
create table tbVendas(
codVenda int  not null auto_increment,
dataVenda date,	
horarioVenda time,
quantidade int,
valorTotal decimal (9,2),
codprod int not null,
codUsu int not null,
codcli int not null,
primary key (codVenda),
foreign key (codprod) references tbprodutos(codprod),
foreign key (codUsu) references tbusUsuario(codUsu),
foreign key (codcli) references tbcliente(codcli),
);

-- visualizando a estrutura da tabela

desc tbFuncionarios;
desc tbFornecedores;
desc tbprodutos;
desc tbcliente;
desc tbusUsuario;

--inserindo registros nas tabelas 
insert into tbFuncionarios(nome,email,cpf,telcel,dataNasc,sexo,salario,logradouro,numero,cep,bairro,cidade,estado,siglaEst,complemento)
values('Nicolas rafael','nicolasrafaeldahora76@gmail.com','525.562.648.-10','94824-2728,','14/01/05','m',4500.55,'Rua das miragens','55A')	
