/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     19/03/2018 20:24:43                          */
/*==============================================================*/
IF EXISTS (
		SELECT 1
		FROM sys.sysforeignkey
		WHERE ROLE = 'FK_CULTURA_INVESTIGA_INVESTIG'
		) then
	ALTER TABLE Cultura

DELETE FOREIGN KEY FK_CULTURA_INVESTIGA_INVESTIG END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.sysforeignkey
			WHERE ROLE = 'FK_MEDICOES_MEDICOESV_VARIAVEI'
			) then
		ALTER TABLE Medicoes

DELETE FOREIGN KEY FK_MEDICOES_MEDICOESV_VARIAVEI END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.sysforeignkey
			WHERE ROLE = 'FK_VARIAVEI_VARIAVEIS_CULTURA'
			) then
		ALTER TABLE VariaveisMedidas

DELETE FOREIGN KEY FK_VARIAVEI_VARIAVEIS_CULTURA END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.sysforeignkey
			WHERE ROLE = 'FK_VARIAVEI_VARIAVEIS_VARIAVEI'
			) then
		ALTER TABLE VariaveisMedidas

DELETE FOREIGN KEY FK_VARIAVEI_VARIAVEIS_VARIAVEI END

IF ;
	DROP INDEX

IF EXISTS Cultura.INVESTIGADORCULTURA_FK;
	DROP INDEX

IF EXISTS Cultura.CULTURA_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'Cultura'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE Cultura

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS Cultura;
	DROP INDEX

IF EXISTS HumidadeTemperatura.HUMIDADETEMPERATURA_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'HumidadeTemperatura'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE HumidadeTemperatura

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS HumidadeTemperatura;
	DROP INDEX

IF EXISTS Investigador.INVESTIGADOR_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'Investigador'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE Investigador

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS Investigador;
	DROP INDEX

IF EXISTS LogCultura.LOGCULTURA_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'LogCultura'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE LogCultura

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS LogCultura;
	DROP INDEX

IF EXISTS LogInvestigador.LOGINVESTIGADOR_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'LogInvestigador'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE LogInvestigador

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS LogInvestigador;
	DROP INDEX

IF EXISTS LogMedicoes.LOGMEDICOES_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'LogMedicoes'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE LogMedicoes

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS LogMedicoes;
	DROP INDEX

IF EXISTS LogSelect.LOGSELECT_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'LogSelect'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE LogSelect

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS LogSelect;
	DROP INDEX

IF EXISTS LogVariaveis.LOGVARIAVEIS_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'LogVariaveis'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE LogVariaveis

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS LogVariaveis;
	DROP INDEX

IF EXISTS LogVariaveisMedidas.LOGVARIAVEISMEDIDAS_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'LogVariaveisMedidas'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE LogVariaveisMedidas

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS LogVariaveisMedidas;
	DROP INDEX

IF EXISTS Medicoes.MEDICOESVARMEDIDAS_FK;
	DROP INDEX

IF EXISTS Medicoes.MEDICOES_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'Medicoes'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE Medicoes

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS Medicoes;
	DROP INDEX

IF EXISTS Variaveis.VARIAVEIS_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'Variaveis'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE Variaveis

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS Variaveis;
	DROP INDEX

IF EXISTS VariaveisMedidas.VARIAVEISCULTURA_FK2;
	DROP INDEX

IF EXISTS VariaveisMedidas.VARIAVEISCULTURA_FK;
	DROP INDEX

IF EXISTS VariaveisMedidas.VARIAVEISMEDIDAS_PK;
	IF EXISTS (
			SELECT 1
			FROM sys.sysconstraint k
			INNER JOIN sys.systab t
				ON (
						t.object_id = k.table_object_id
						AND t.table_name = 'VariaveisMedidas'
						)
			WHERE k.constraint_type = 'P'
			) then
		ALTER TABLE VariaveisMedidas

DELETE PRIMARY KEY END

IF ;
	DROP TABLE

IF EXISTS VariaveisMedidas;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_Cultura'
			) then
		DROP sequence S_Cultura
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_HumidadeTemperatura'
			) then
		DROP sequence S_HumidadeTemperatura
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_LogCultura'
			) then
		DROP sequence S_LogCultura
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_LogInvestigador'
			) then
		DROP sequence S_LogInvestigador
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_LogMedicoes'
			) then
		DROP sequence S_LogMedicoes
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_LogSelect'
			) then
		DROP sequence S_LogSelect
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_LogVariaveis'
			) then
		DROP sequence S_LogVariaveis
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_LogVariaveisMedidas'
			) then
		DROP sequence S_LogVariaveisMedidas
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_Medicoes'
			) then
		DROP sequence S_Medicoes
	END

IF ;
	IF EXISTS (
			SELECT 1
			FROM sys.syssequence s
			WHERE sequence_name = 'S_Variaveis'
			) then
		DROP sequence S_Variaveis
	END

IF ;
	CREATE sequence S_Cultura;

CREATE sequence S_HumidadeTemperatura;

CREATE sequence S_LogCultura;

CREATE sequence S_LogInvestigador;

CREATE sequence S_LogMedicoes;

CREATE sequence S_LogSelect;

CREATE sequence S_LogVariaveis;

CREATE sequence S_LogVariaveisMedidas;

CREATE sequence S_Medicoes;

CREATE sequence S_Variaveis;

/*==============================================================*/
/* Table: Cultura                                               */
/*==============================================================*/
CREATE TABLE Cultura (
	idCultura INT NOT NULL DEFAULT autoincrement,
	idInvestigador INT NOT NULL,
	nomeCultura VARCHAR(100) NOT NULL,
	limiteInferiorTemperatura DECIMAL(8, 2) NOT NULL,
	limiteSuperiorTemperatura DECIMAL(8, 2) NOT NULL,
	limiteInferiorHumidade DECIMAL(8, 2) NOT NULL,
	limiteSuperiorHumidade DECIMAL(8, 2) NOT NULL,
	deleted SMALLINT NOT NULL
	);

ALTER TABLE Cultura ADD CONSTRAINT PK_CULTURA PRIMARY KEY (idCultura);

/*==============================================================*/
/* Index: CULTURA_PK                                            */
/*==============================================================*/
CREATE UNIQUE INDEX CULTURA_PK ON Cultura (idCultura ASC);

/*==============================================================*/
/* Index: INVESTIGADORCULTURA_FK                                */
/*==============================================================*/
CREATE INDEX INVESTIGADORCULTURA_FK ON Cultura (idInvestigador ASC);

/*==============================================================*/
/* Table: HumidadeTemperatura                                   */
/*==============================================================*/
CREATE TABLE HumidadeTemperatura (
	dataHoraMedicao TIMESTAMP NOT NULL,
	valorMedicaoTemperatura DECIMAL(8, 2),
	valorMedicaoHumidade DECIMAL(8, 2),
	idMedicao INT NOT NULL DEFAULT autoincrement
	);

ALTER TABLE HumidadeTemperatura ADD CONSTRAINT PK_HUMIDADETEMPERATURA PRIMARY KEY (idMedicao);

/*==============================================================*/
/* Index: HUMIDADETEMPERATURA_PK                                */
/*==============================================================*/
CREATE UNIQUE INDEX HUMIDADETEMPERATURA_PK ON HumidadeTemperatura (idMedicao ASC);

/*==============================================================*/
/* Table: Investigador                                          */
/*==============================================================*/
CREATE TABLE Investigador (
	idInvestigador INT NOT NULL DEFAULT autoincrement,
	email VARCHAR(50) NOT NULL,
	nomeInvestigador VARCHAR(100) NOT NULL,
	deleted SMALLINT NOT NULL
	);

ALTER TABLE Investigador ADD CONSTRAINT PK_INVESTIGADOR PRIMARY KEY (idInvestigador);

/*==============================================================*/
/* Index: INVESTIGADOR_PK                                       */
/*==============================================================*/
CREATE UNIQUE INDEX INVESTIGADOR_PK ON Investigador (idInvestigador ASC);

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
	deleted SMALLINT NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao TIMESTAMP NOT NULL,
	idLogCultura INT NOT NULL DEFAULT autoincrement
	);

ALTER TABLE LogCultura ADD CONSTRAINT PK_LOGCULTURA PRIMARY KEY (idLogCultura);

/*==============================================================*/
/* Index: LOGCULTURA_PK                                         */
/*==============================================================*/
CREATE UNIQUE INDEX LOGCULTURA_PK ON LogCultura (idLogCultura ASC);

/*==============================================================*/
/* Table: LogInvestigador                                       */
/*==============================================================*/
CREATE TABLE LogInvestigador (
	idInvestigador INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	nomeInvestigador VARCHAR(100) NOT NULL,
	deleted SMALLINT NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao TIMESTAMP NOT NULL,
	idLogInvestigador INT NOT NULL DEFAULT autoincrement
	);

ALTER TABLE LogInvestigador ADD CONSTRAINT PK_LOGINVESTIGADOR PRIMARY KEY (idLogInvestigador);

/*==============================================================*/
/* Index: LOGINVESTIGADOR_PK                                    */
/*==============================================================*/
CREATE UNIQUE INDEX LOGINVESTIGADOR_PK ON LogInvestigador (idLogInvestigador ASC);

/*==============================================================*/
/* Table: LogMedicoes                                           */
/*==============================================================*/
CREATE TABLE LogMedicoes (
	idCultura INT NOT NULL,
	idVariavel INT NOT NULL,
	numeroMedicao BIGINT NOT NULL,
	dataHoraMedicao TIMESTAMP NOT NULL,
	valorMedicao DECIMAL(8, 2) NOT NULL,
	deleted SMALLINT NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao TIMESTAMP NOT NULL,
	idLogMedicoes INT NOT NULL DEFAULT autoincrement
	);

ALTER TABLE LogMedicoes ADD CONSTRAINT PK_LOGMEDICOES PRIMARY KEY (idLogMedicoes);

/*==============================================================*/
/* Index: LOGMEDICOES_PK                                        */
/*==============================================================*/
CREATE UNIQUE INDEX LOGMEDICOES_PK ON LogMedicoes (idLogMedicoes ASC);

/*==============================================================*/
/* Table: LogSelect                                             */
/*==============================================================*/
CREATE TABLE LogSelect (
	idLogSelect INT NOT NULL DEFAULT autoincrement,
	comandoSelect VARCHAR(1024) NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	dataOperacao TIMESTAMP NOT NULL
	);

ALTER TABLE LogSelect ADD CONSTRAINT PK_LOGSELECT PRIMARY KEY (idLogSelect);

/*==============================================================*/
/* Index: LOGSELECT_PK                                          */
/*==============================================================*/
CREATE UNIQUE INDEX LOGSELECT_PK ON LogSelect (idLogSelect ASC);

/*==============================================================*/
/* Table: LogVariaveis                                          */
/*==============================================================*/
CREATE TABLE LogVariaveis (
	idVariavel INT NOT NULL,
	nomeVariavel VARCHAR(100) NOT NULL,
	deleted SMALLINT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao TIMESTAMP NOT NULL,
	idLogVariaveis INT NOT NULL DEFAULT autoincrement
	);

ALTER TABLE LogVariaveis ADD CONSTRAINT PK_LOGVARIAVEIS PRIMARY KEY (idLogVariaveis);

/*==============================================================*/
/* Index: LOGVARIAVEIS_PK                                       */
/*==============================================================*/
CREATE UNIQUE INDEX LOGVARIAVEIS_PK ON LogVariaveis (idLogVariaveis ASC);

/*==============================================================*/
/* Table: LogVariaveisMedidas                                   */
/*==============================================================*/
CREATE TABLE LogVariaveisMedidas (
	idCultura INT NOT NULL,
	idVariavel INT NOT NULL,
	limiteInferior DECIMAL(8, 2) NOT NULL,
	limiteSuperior DECIMAL(8, 2) NOT NULL,
	deleted SMALLINT NOT NULL,
	utilizador VARCHAR(50) NOT NULL,
	operacao CHAR(1) NOT NULL,
	dataOperacao TIMESTAMP NOT NULL,
	idLogVariaveisMedidas INT NOT NULL DEFAULT autoincrement
	);

ALTER TABLE LogVariaveisMedidas ADD CONSTRAINT PK_LOGVARIAVEISMEDIDAS PRIMARY KEY (idLogVariaveisMedidas);

/*==============================================================*/
/* Index: LOGVARIAVEISMEDIDAS_PK                                */
/*==============================================================*/
CREATE UNIQUE INDEX LOGVARIAVEISMEDIDAS_PK ON LogVariaveisMedidas (idLogVariaveisMedidas ASC);

/*==============================================================*/
/* Table: Medicoes                                              */
/*==============================================================*/
CREATE TABLE Medicoes (
	idCultura INT NOT NULL,
	idVariavel INT NOT NULL,
	numeroMedicao BIGINT NOT NULL DEFAULT autoincrement,
	dataHoraMedicao TIMESTAMP NOT NULL,
	valorMedicao DECIMAL(8, 2) NOT NULL,
	deleted SMALLINT NOT NULL
	);

ALTER TABLE Medicoes ADD CONSTRAINT PK_MEDICOES PRIMARY KEY (
	idCultura,
	idVariavel,
	numeroMedicao
	);

/*==============================================================*/
/* Index: MEDICOES_PK                                           */
/*==============================================================*/
CREATE UNIQUE INDEX MEDICOES_PK ON Medicoes (
	idCultura ASC,
	idVariavel ASC,
	numeroMedicao ASC
	);

/*==============================================================*/
/* Index: MEDICOESVARMEDIDAS_FK                                 */
/*==============================================================*/
CREATE INDEX MEDICOESVARMEDIDAS_FK ON Medicoes (
	idCultura ASC,
	idVariavel ASC
	);

/*==============================================================*/
/* Table: Variaveis                                             */
/*==============================================================*/
CREATE TABLE Variaveis (
	idVariavel INT NOT NULL DEFAULT autoincrement,
	nomeVariavel VARCHAR(100) NOT NULL,
	deleted SMALLINT NOT NULL
	);

ALTER TABLE Variaveis ADD CONSTRAINT PK_VARIAVEIS PRIMARY KEY (idVariavel);

/*==============================================================*/
/* Index: VARIAVEIS_PK                                          */
/*==============================================================*/
CREATE UNIQUE INDEX VARIAVEIS_PK ON Variaveis (idVariavel ASC);

/*==============================================================*/
/* Table: VariaveisMedidas                                      */
/*==============================================================*/
CREATE TABLE VariaveisMedidas (
	idCultura INT NOT NULL,
	idVariavel INT NOT NULL,
	limiteInferior DECIMAL(8, 2) NOT NULL,
	limiteSuperior DECIMAL(8, 2) NOT NULL,
	deleted SMALLINT NOT NULL
	);

ALTER TABLE VariaveisMedidas ADD CONSTRAINT PK_VARIAVEISMEDIDAS PRIMARY KEY (
	idCultura,
	idVariavel
	);

/*==============================================================*/
/* Index: VARIAVEISMEDIDAS_PK                                   */
/*==============================================================*/
CREATE UNIQUE INDEX VARIAVEISMEDIDAS_PK ON VariaveisMedidas (
	idCultura ASC,
	idVariavel ASC
	);

/*==============================================================*/
/* Index: VARIAVEISCULTURA_FK                                   */
/*==============================================================*/
CREATE INDEX VARIAVEISCULTURA_FK ON VariaveisMedidas (idVariavel ASC);

/*==============================================================*/
/* Index: VARIAVEISCULTURA_FK2                                  */
/*==============================================================*/
CREATE INDEX VARIAVEISCULTURA_FK2 ON VariaveisMedidas (idCultura ASC);

ALTER TABLE Cultura ADD CONSTRAINT FK_CULTURA_INVESTIGA_INVESTIG FOREIGN KEY (idInvestigador) REFERENCES Investigador (idInvestigador) ON

UPDATE RESTRICT
	ON

DELETE RESTRICT;

ALTER TABLE Medicoes ADD CONSTRAINT FK_MEDICOES_MEDICOESV_VARIAVEI FOREIGN KEY (
	idCultura,
	idVariavel
	) REFERENCES VariaveisMedidas (
	idCultura,
	idVariavel
	) ON

UPDATE RESTRICT
	ON

DELETE RESTRICT;

ALTER TABLE VariaveisMedidas ADD CONSTRAINT FK_VARIAVEI_VARIAVEIS_CULTURA FOREIGN KEY (idCultura) REFERENCES Cultura (idCultura) ON

UPDATE RESTRICT
	ON

DELETE RESTRICT;

ALTER TABLE VariaveisMedidas ADD CONSTRAINT FK_VARIAVEI_VARIAVEIS_VARIAVEI FOREIGN KEY (idVariavel) REFERENCES Variaveis (idVariavel) ON

UPDATE RESTRICT
	ON

DELETE RESTRICT;

/*==============================================================*/
/* Table: AlertasHumidadeTemperatura                                      */
/*==============================================================*/

CREATE TABLE AlertasHumidadeTemperatura (
	idAlerta INT NOT NULL DEFAULT autoincrement,
	tipoAlerta VARCHAR(20) NOT NULL,
	idCultura INT,
	dataHora TIMESTAMP NOT NULL,
	valorReg DECIMAL(8,2)
	);
	
ALTER TABLE AlertasHumidadeTemperatura ADD CONSTRAINT ALERTAS_PK PRIMARY KEY (idAlerta);

/*==============================================================*/
/* Index: PK_ALERTAS		                                    */
/*==============================================================*/
CREATE UNIQUE INDEX PK_ALERTAS ON AlertasHumidadeTemperatura (idAlerta ASC);

/*==============================================================*/
/* Index: FK_CULTURA_ALERTAS                                    */
/*==============================================================*/
	
ALTER TABLE AlertasHumidadeTemperatura ADD CONSTRAINT FK_CULTURA_ALERTAS FOREIGN KEY ( 
	idCultura) 
REFERENCES Cultura ( idCultura ) ON UPDATE CASCADE ON DELETE CASCADE;

