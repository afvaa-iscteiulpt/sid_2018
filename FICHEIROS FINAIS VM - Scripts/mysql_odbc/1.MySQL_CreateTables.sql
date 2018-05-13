/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/03/2018 19:06:34                          */
/*==============================================================*/
DROP TABLE

IF EXISTS LogCultura;
	DROP TABLE

IF EXISTS LogHumidadeTemperatura;
	DROP TABLE

IF EXISTS LogInvestigador;
	DROP TABLE

IF EXISTS LogMedicoes;
	DROP TABLE

IF EXISTS LogVariaveis;
	DROP TABLE

IF EXISTS LogSelect;
	DROP TABLE

IF EXISTS LogVariaveisMedidas;

/*==============================================================*/
/* Table: LogCultura                                            */
/*==============================================================*/
CREATE TABLE LogCultura (
		idCultura INT NOT NULL,
		IdInvestigador INT NOT NULL,
		nomeCultura VARCHAR(100) NOT NULL,
		limiteInferiorTemperatura DECIMAL(8, 2) NOT NULL,
		limiteSuperiorTemperatura DECIMAL(8, 2) NOT NULL,
		limiteInferiorHumidade DECIMAL(8, 2) NOT NULL,
		limiteSuperiorHumidade DECIMAL(8, 2) NOT NULL,
		deleted bool NOT NULL,
		utilizador VARCHAR(50) NOT NULL,
		operacao CHAR(1) NOT NULL,
		dataOperacao DATETIME NOT NULL,
		idLogCultura INT NOT NULL DEFAULT 0,
		PRIMARY KEY (idLogCultura)
		);

/*==============================================================*/
/* Table: LogHumidadeTemperatura                                */
/*==============================================================*/
CREATE TABLE LogHumidadeTemperatura (
	dataHoraMedicao DATETIME NOT NULL,
	valorMedicaoTemperatura DECIMAL(8, 2) NOT NULL,
	valorMedicaoHumidade DECIMAL(8, 2) NOT NULL,
	idMedicao BIGINT NOT NULL DEFAULT 0,
	PRIMARY KEY (idMedicao)
	);

/*==============================================================*/
/* Table: LogInvestigador                                       */
/*==============================================================*/
CREATE TABLE LogInvestigador (
	idInvestigador INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	nomeInvestigador VARCHAR(100) NOT NULL,
	deleted bool NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao DATETIME NOT NULL,
	idLogInvestigador INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idLogInvestigador)
	);

/*==============================================================*/
/* Table: LogMedicoes                                           */
/*==============================================================*/
CREATE TABLE LogMedicoes (
	idCultura INT NOT NULL,
	idVariavel INT NOT NULL,
	numeroMedicao BIGINT NOT NULL,
	dataHoraMedicao DATETIME NOT NULL,
	valorMedicao DECIMAL(8, 2) NOT NULL,
	deleted bool NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao DATETIME NOT NULL,
	idLogMedicoes INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idLogMedicoes)
	);

/*==============================================================*/
/* Table: LogSelect                                             */
/*==============================================================*/

CREATE TABLE LogSelect (
	idLogSelect INT NOT NULL DEFAULT 0,
	comandoSelect VARCHAR(1024) NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	dataOperacao DATETIME NOT NULL,
	PRIMARY KEY (idLogSelect)
	);


/*==============================================================*/
/* Table: LogVariaveis                                          */
/*==============================================================*/
CREATE TABLE LogVariaveis (
	idVariavel INT NOT NULL,
	nomeVariavel VARCHAR(100) NOT NULL,
	deleted bool,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao DATETIME NOT NULL,
	idLogVariaveis INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idLogVariaveis)
	);

/*==============================================================*/
/* Table: LogVariaveisMedidas                                   */
/*==============================================================*/
CREATE TABLE LogVariaveisMedidas (
	idCultura INT NOT NULL,
	idVariavel INT NOT NULL,
	limiteInferior DECIMAL(8, 2) NOT NULL,
	limiteSuperior DECIMAL(8, 2) NOT NULL,
	deleted bool NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao DATETIME NOT NULL,
	idLogVariaveisMedidas INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idLogVariaveisMedidas)
	);


