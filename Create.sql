SET DATESTYLE TO PostgreSQL,European;

create database Projeto;

CREATE SCHEMA Locadora;

CREATE SEQUENCE Locadora.IDVeiculo;
CREATE TABLE Locadora.Veiculo(
    IDVeiculo int default nextval('Locadora.IDVeiculo'::regclass) PRIMARY KEY,
    Dt_Aquisicao Date not null,
    Ano integer not null,
    Modelo Varchar(150) not null,
    Placa Varchar(10) not null,
    Status Varchar(12) not null,
    Preco_diaria Numeric(10,2)
);

CREATE SEQUENCE Locadora.IDCliente;
CREATE TABLE Locadora.Cliente(
    IDCliente int default nextval('Locadora.IDCliente'::regclass) PRIMARY KEY,
    CPF Varchar(11) not null,
    CNH Varchar(11) not null,
    Validade_CNH Date not null,
    Nome Varchar(150) not null,
    Dt_Cadastro Date not null,
    Dt_Nascimento Date not null,
    Telefone Varchar(11),
    Status Varchar(30)
);

CREATE SEQUENCE Locadora.IDDespachante;
CREATE TABLE Locadora.Despachante(
    IDDespachante int default nextval('Locadora.IDDespachante'::regclass) PRIMARY KEY,
    Nome Varchar(150) not null,
    Status Varchar(7) not null,
    Filial Varchar(150) not null
);

CREATE SEQUENCE Locadora.IDLocador;
CREATE TABLE Locadora.Locador(
    IDLocador int default nextval('Locadora.IDLocador'::regclass) PRIMARY KEY,
    Nome Varchar(150) not null,
    Status Varchar(7) not null,
    Filial Varchar(150) not null
);

CREATE SEQUENCE Locadora.IDLocacao;
CREATE TABLE Locadora.Locacao(
    IDLocacao int not null,
    IDVeiculo int not null references Locadora.Veiculo (IDVeiculo),
    IDCliente int not null references Locadora.Cliente (IDCliente),
    IDDespachante int references Locadora.Despachante (IDDespachante),
    Dt_Locacao Date not null,
    Dt_Entrega Date not null,
    Valor_Total Numeric(10,2) not null,
    CONSTRAINT Locacao_pkey PRIMARY KEY (IDLocacao, IDCliente, IDDespachante)
);
