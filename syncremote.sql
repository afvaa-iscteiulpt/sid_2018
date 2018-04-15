ALTER PROCEDURE "DBA"."sp_syncRemote"(IN arg_id INTEGER DEFAULT NULL)

BEGIN
    DECLARE lastid INTEGER;
     
	SET lastid = (SELECT MAX(idLogCultura) FROM logcultura_remote);
	IF (arg_id IS NULL) THEN
		IF (lastid IS NULL) THEN
			INSERT logcultura_remote SELECT * FROM LogCultura;
		ELSE 
			INSERT logcultura_remote SELECT * FROM LogCultura WHERE idLogCultura > lastid;
		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			INSERT logcultura_remote SELECT TOP arg_id * FROM LogCultura ORDER BY idLogCultura ASC;
		ELSE 
			INSERT logcultura_remote SELECT TOP arg_id * FROM LogCultura WHERE idLogCultura > lastid ORDER BY idLogCultura ASC;
		END IF;
	END IF;
	COMMIT;

	SET lastid = (SELECT MAX(idMedicao) FROM loghumidadetemperatura_remote);
	IF (arg_id IS NULL) THEN
		IF (lastid IS NULL) THEN
			INSERT loghumidadetemperatura_remote SELECT * FROM HumidadeTemperatura;
		ELSE 
			INSERT loghumidadetemperatura_remote SELECT * FROM HumidadeTemperatura WHERE idMedicao > lastid;
		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			INSERT loghumidadetemperatura_remote SELECT TOP arg_id * FROM HumidadeTemperatura ORDER BY idMedicao ASC;
		ELSE 
			INSERT loghumidadetemperatura_remote SELECT TOP arg_id * FROM HumidadeTemperatura WHERE idMedicao > lastid ORDER BY idMedicao ASC;
		END IF;
	END IF;
	COMMIT;
	

	SET lastid = (SELECT MAX(idLogInvestigador) FROM loginvestigador_remote);
	IF (arg_id IS NULL) THEN
		IF (lastid IS NULL) THEN
			INSERT loginvestigador_remote SELECT * FROM LogInvestigador;
		ELSE 
			INSERT loginvestigador_remote SELECT * FROM LogInvestigador WHERE idLogInvestigador > lastid;
		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			INSERT loginvestigador_remote SELECT TOP arg_id * FROM LogInvestigador ORDER BY idLogInvestigador ASC;
		ELSE 
			INSERT loginvestigador_remote SELECT TOP arg_id * FROM LogInvestigador WHERE idLogInvestigador > lastid ORDER BY idLogInvestigador ASC;
		END IF;
	END IF;
	COMMIT;

	SET lastid = (SELECT MAX(idLogMedicoes) FROM logmedicoes_remote);
	IF (arg_id IS NULL) THEN
		IF (lastid IS NULL) THEN
			INSERT logmedicoes_remote SELECT * FROM LogMedicoes;
		ELSE 
			INSERT logmedicoes_remote SELECT * FROM LogMedicoes WHERE idLogMedicoes > lastid;
		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			INSERT logmedicoes_remote SELECT TOP arg_id * FROM LogMedicoes ORDER BY idLogMedicoes ASC;
		ELSE 
			INSERT logmedicoes_remote SELECT TOP arg_id * FROM LogMedicoes WHERE idLogMedicoes > lastid ORDER BY idLogMedicoes ASC;
		END IF;
	END IF;
	COMMIT;

	SET lastid = (SELECT MAX(idLogSelect) FROM logselect_remote);
	IF (arg_id IS NULL) THEN
		IF (lastid IS NULL) THEN
			INSERT logselect_remote SELECT * FROM LogSelect;
		ELSE 
			INSERT logselect_remote SELECT * FROM LogSelect WHERE idLogSelect > lastid;
		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			INSERT logselect_remote SELECT TOP arg_id * FROM LogSelect ORDER BY idLogSelect ASC;
		ELSE 
			INSERT logselect_remote SELECT TOP arg_id * FROM LogSelect WHERE idLogSelect > lastid ORDER BY idLogSelect ASC;
		END IF;
	END IF;
	COMMIT;

	SET lastid = (SELECT MAX(idLogVariaveis) FROM logvariaveis_remote);
	IF (arg_id IS NULL) THEN
		IF (lastid IS NULL) THEN
			INSERT logvariaveis_remote SELECT * FROM LogVariaveis;
		ELSE 
			INSERT logvariaveis_remote SELECT * FROM LogVariaveis WHERE idLogVariaveis > lastid;
		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			INSERT logvariaveis_remote SELECT TOP arg_id * FROM LogVariaveis ORDER BY idLogVariaveis ASC;
		ELSE 
			INSERT logvariaveis_remote SELECT TOP arg_id * FROM LogVariaveis WHERE idLogVariaveis > lastid ORDER BY idLogVariaveis ASC;
		END IF;
	END IF;
	COMMIT;

    

	SET lastid = (SELECT MAX(idLogVariaveisMedidas) FROM logvariaveismedidas_remote);
	IF (arg_id IS NULL) THEN
		IF (lastid IS NULL) THEN
			INSERT logvariaveismedidas_remote SELECT * FROM LogVariaveisMedidas;
		ELSE 
			INSERT logvariaveismedidas_remote SELECT * FROM LogVariaveisMedidas WHERE idLogVariaveisMedidas > lastid;
		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			INSERT logvariaveismedidas_remote SELECT TOP arg_id * FROM LogVariaveisMedidas ORDER BY idLogVariaveisMedidas ASC;
		ELSE 
			INSERT logvariaveismedidas_remote SELECT TOP arg_id * FROM LogVariaveisMedidas WHERE idLogVariaveisMedidas > lastid ORDER BY idLogVariaveisMedidas ASC;
		END IF;
	END IF;
	COMMIT;
END