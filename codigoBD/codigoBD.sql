
CREATE DATABASE aqualytix;

USE aqualytix;

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50) NOT NULL UNIQUE,
    NomeFantasia varchar(50) NOT NULL UNIQUE,
    CodigoAtivacao varchar(50) NOT NULL UNIQUE,
	cnpj CHAR(14) NOT NULL UNIQUE
);

CREATE TABLE usuario (
	idUsuario INT AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50) NOT NULL UNIQUE,
    nickname varchar(45) NOT NULL,
	senha VARCHAR(50) NOT NULL,
	fk_CodigoAtivacao int,
	constraint fkCodigoEmpresa foreign key (fk_CodigoAtivacao) references empresa(CodigoAtivacao),
    constraint fkComposta primary key (idUsuario, fk_CodigoAtivacao)
);

create table registro (
	idRegistro INT PRIMARY KEY AUTO_INCREMENT,
	dt_registro datetime default current_timestamp,
	fk_empresa INT,
    constraint fkComposta2 primary key (idRegistro, fk_empresa),
	constraint fkEmpresa2 FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);
