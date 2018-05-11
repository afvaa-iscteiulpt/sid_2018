DROP VIEW

IF EXISTS InvestigadorPorInvestigador;
	DROP VIEW

IF EXISTS CulturaPorInvestigador;
	DROP VIEW

IF EXISTS VariaveisMedidasPorInvestigador;
	DROP VIEW

IF EXISTS VariaveisPorInvestigador;
	DROP VIEW

IF EXISTS MedicoesPorInvestigador;
	CREATE VIEW "DBA"."InvestigadorPorInvestigador" (/* view_column_name, ... */)
	AS
	SELECT *
	FROM Investigador
	WHERE email = user_name()
		AND deleted = 0;

	CREATE VIEW "DBA"."CulturaPorInvestigador" (/* view_column_name, ... */)
	AS
	SELECT Cultura.idCultura,
		Cultura.idInvestigador,
		Cultura.nomeCultura,
		Cultura.limiteInferiorTemperatura,
		Cultura.limiteSuperiorTemperatura,
		Cultura.limiteInferiorHumidade,
		Cultura.limiteSuperiorHumidade,
		Cultura.deleted
	FROM Cultura,
		Investigador
	WHERE Cultura.idInvestigador = Investigador.idInvestigador
		AND Investigador.email = user_name()
		AND Cultura.deleted = 0;

	CREATE VIEW "DBA"."VariaveisMedidasPorInvestigador" (/* view_column_name, ... */)
	AS
	SELECT VariaveisMedidas.idCultura,
		VariaveisMedidas.idVariavel,
		VariaveisMedidas.limiteInferior,
		VariaveisMedidas.limiteSuperior,
		VariaveisMedidas.deleted
	FROM VariaveisMedidas,
		CulturaPorInvestigador
	WHERE VariaveisMedidas.idCultura = CulturaPorInvestigador.idCultura
		AND VariaveisMedidas.deleted = 0;

	CREATE VIEW "DBA"."VariaveisPorInvestigador" (/* view_column_name, ... */)
	AS
	SELECT Variaveis.idVariavel,
		Variaveis.nomeVariavel,
		Variaveis.deleted
	FROM Variaveis,
		VariaveisMedidasPorInvestigador
	WHERE Variaveis.idVariavel = VariaveisMedidasPorInvestigador.idVariavel
		AND Variaveis.deleted = 0;

	CREATE VIEW "DBA"."MedicoesPorInvestigador" (/* view_column_name, ... */)
	AS
	SELECT Medicoes.idCultura,
		Medicoes.idVariavel,
		Medicoes.numeroMedicao,
		Medicoes.dataHoraMedicao,
		Medicoes.deleted
	FROM Medicoes,
		CulturaPorInvestigador
	WHERE CulturaPorInvestigador.idCultura = Medicoes.idCultura
		AND Medicoes.deleted = 0;
