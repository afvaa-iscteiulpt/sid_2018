CREATE PROCEDURE "DBA"."sp_resetData" ()

BEGIN
	TRUNCATE TABLE Medicoes;

	TRUNCATE TABLE VariaveisMedidas;

	TRUNCATE TABLE Cultura;

	TRUNCATE TABLE HumidadeTemperatura;

	TRUNCATE TABLE Investigador;

	TRUNCATE TABLE LogCultura;

	TRUNCATE TABLE LogInvestigador;

	TRUNCATE TABLE LogMedicoes;

	TRUNCATE TABLE LogSelect;

	TRUNCATE TABLE LogVariaveis;

	TRUNCATE TABLE LogVariaveisMedidas;

	TRUNCATE TABLE Variaveis;
END
