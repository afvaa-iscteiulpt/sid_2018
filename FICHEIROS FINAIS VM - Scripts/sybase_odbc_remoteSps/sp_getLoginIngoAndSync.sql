ALTER PROCEDURE "DBA"."sp_syncWithRemoteSp"(IN tabela VARCHAR(50), IN idCultura INT, 
IN IdInvestigador INT, IN nomeCultura VARCHAR(100), IN limiteInferiorTemperatura DECIMAL(8, 2), 
IN limiteSuperiorTemperatura DECIMAL(8, 2), IN limiteInferiorHumidade DECIMAL(8, 2), IN limiteSuperiorHumidade DECIMAL(8, 2), 
IN deleted SMALLINT , IN utilizador VARCHAR(50), IN operacao CHAR(1), IN dataOperacao TIMESTAMP, IN idLogCultura INT) 
at 'mysqlodbc_remote;mysqlodbcremotesps;;syncSybaseRemoteSp'


ALTER PROCEDURE "DBA"."sp_getLogInfoAndSync"( arg_id INTEGER )

BEGIN
    DECLARE lastid INTEGER;
    DECLARE @idCultura INT;
    DECLARE @IdInvestigador INT;
    DECLARE @nomeCultura VARCHAR(100);
    DECLARE @limiteInferiorTemperatura DECIMAL(8, 2);
    DECLARE @limiteSuperiorTemperatura DECIMAL(8, 2);
    DECLARE @limiteInferiorHumidade DECIMAL(8, 2);
    DECLARE @limiteSuperiorHumidade DECIMAL(8, 2);
    DECLARE @deleted SMALLINT;
    DECLARE @utilizador VARCHAR(50);
    DECLARE @operacao CHAR(1);
    DECLARE @dataOperacao TIMESTAMP;
    DECLARE @idLogCultura INT;
    declare logculturarows cursor for SELECT * FROM LogCultura;
    declare logculturarows2 cursor for SELECT * FROM LogCultura WHERE idLogCultura > lastid;
    
    SET lastid = (SELECT MAX(idCultura) FROM LogCultura);
	IF (arg_id IS NULL) THEN
        
		IF (lastid IS NULL) THEN
		
            open logculturarows;
                fetch logculturarows into  @idCultura, @IdInvestigador, @nomeCultura, @limiteInferiorTemperatura, @limiteSuperiorTemperatura, @limiteInferiorHumidade, @limiteSuperiorHumidade, @deleted, @utilizador, @operacao, @dataOperacao, @idLogCultura;
        
            while (@@sqlstatus = 0) loop
                 CALL sp_syncWithRemoteSp('logcultura', @idCultura, @IdInvestigador, @nomeCultura, @limiteInferiorTemperatura, @limiteSuperiorTemperatura, @limiteInferiorHumidade, @limiteSuperiorHumidade, @deleted, @utilizador, @operacao, @dataOperacao, @idLogCultura);
                    fetch next from logculturarows into  @idCultura, @IdInvestigador, @nomeCultura, @limiteInferiorTemperatura, @limiteSuperiorTemperatura, @limiteInferiorHumidade, @limiteSuperiorHumidade, @deleted, @utilizador, @operacao, @dataOperacao, @idLogCultura;
        
            end loop;  

            
           

		ELSE 
			
             open logculturarows2;
                fetch logculturarows2 into  @idCultura, @IdInvestigador, @nomeCultura, @limiteInferiorTemperatura, @limiteSuperiorTemperatura, @limiteInferiorHumidade, @limiteSuperiorHumidade, @deleted, @utilizador, @operacao, @dataOperacao, @idLogCultura;
            
           
                CALL sp_syncWithRemoteSp('logcultura', @idCultura, @IdInvestigador, @nomeCultura, @limiteInferiorTemperatura, @limiteSuperiorTemperatura, @limiteInferiorHumidade, @limiteSuperiorHumidade, @deleted, @utilizador, @operacao, @dataOperacao, @idLogCultura)
            

		END IF;
	ELSE 
		IF (lastid IS NULL) THEN
			//INSERT logcultura_remote SELECT TOP arg_id * FROM LogCultura ORDER BY idLogCultura ASC;
		ELSE 
			//INSERT logcultura_remote SELECT TOP arg_id * FROM LogCultura WHERE idLogCultura > lastid ORDER BY idLogCultura ASC;
		END IF;
	END IF;
	COMMIT;

    /*
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
    */
END