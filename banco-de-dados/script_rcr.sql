DROP DATABASE RCR:
CREATE DATABASE RCR;
USE [RCR];

CREATE TABLE Tipo_cripto (
	tp_cripto INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nome_cripto VARCHAR(255),
	des_cripto VARCHAR(255),
);

CREATE TABLE Tipo_transacao (
	tp_transacao INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	des_transacao VARCHAR(255),
);

CREATE TABLE Usuario (
	id_usuario INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	email VARCHAR(255) UNIQUE,
	senha VARCHAR(255),
	nome VARCHAR(100),
	cpf CHAR(11) UNIQUE,
	dt_nascimento CHAR(10),
	telefone CHAR(11),
	tipo_usuario CHAR(11),
);

CREATE TABLE Endereco (
	id_endereco INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	rua VARCHAR(255),
	cidade VARCHAR(255),
	bairro VARCHAR(255),
	estado CHAR(2),
	numero VARCHAR(6),
	cep CHAR(8),
	complemento VARCHAR(40),
	fk_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
);

CREATE TABLE Chamados (
	id_chamado INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	assunto VARCHAR(255),
	descricao VARCHAR(5000),
	ch_data DATETIME,
	fk_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
);

CREATE TABLE Respostas (
	id_resposta INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	texto VARCHAR(1000),
	resp_data DATETIME,
	fk_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
	fk_chamado INT FOREIGN KEY REFERENCES Chamados(id_chamado),
);

CREATE TABLE Transacao (
	id_transacao INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	valor DECIMAL,
	tr_data DATETIME NOT NULL,
	status_transacao VARCHAR(50),
	fk_usuario INT FOREIGN KEY REFERENCES Usuario(id_usuario),
	fk_tipo_cripto INT FOREIGN KEY REFERENCES Tipo_cripto(tp_cripto),
	fk_tipo_transacao INT FOREIGN KEY REFERENCES Tipo_transacao(tp_transacao),
);

