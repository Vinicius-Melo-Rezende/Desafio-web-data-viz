
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
    nickname varchar(45) NOT NULL unique,
	senha VARCHAR(50) NOT NULL,
	fk_CodigoAtivacao varchar(50),
	constraint fkCodigoEmpresa foreign key (fk_CodigoAtivacao) references empresa(CodigoAtivacao),
    constraint fkComposta primary key (idUsuario, fk_CodigoAtivacao)
);
    SELECT idUsuario, nome, email, fk_CodigoAtivacao as CodigoAtivacao FROM usuario WHERE nickname = 'edu' AND senha = 'edu';

create table registro (
	idRegistro INT AUTO_INCREMENT,
	dt_registro datetime default current_timestamp,
	statusVolume boolean,
	fk_empresa INT,
    constraint fkComposta2 primary key (idRegistro, fk_empresa),
	constraint fkEmpresa2 FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa)
);

INSERT INTO empresa (razao_social, NomeFantasia, CodigoAtivacao, cnpj) VALUES
('Tech Solutions Ltda', 'TechSol', 'ACT12345', '12345678000101'),
('Agro Vida S.A.', 'AgroVida', 'ACT67890', '98765432000199'),
('HidroClean Serviços', 'HidroClean', 'ACT11223', '11223344000155'),
('BlueWater Tecnologia', 'BlueWater', 'ACT44556', '55667788000133'),
('Green Energy Ltda', 'GreenEnergy', 'ACT77889', '99887766000177');