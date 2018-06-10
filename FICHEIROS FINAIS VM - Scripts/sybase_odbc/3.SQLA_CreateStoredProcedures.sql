drop procedure if exists sp_insLogSelects;

drop procedure if exists sp_softDeleteMedicoes;

drop procedure if exists sp_softDeleteInvestigador;

drop procedure if exists sp_softDeleteCultura;

drop procedure if exists sp_softDeleteVariaveis;

drop procedure if exists sp_softDeleteVariaveisMedidas;


create procedure "DBA"."sp_insLogSelects"( 
    IN arg_command VARCHAR(500) DEFAULT ''
)
/* RESULT( column_name column_type, ... ) */
BEGIN
	DECLARE fix_command_temp VARCHAR(500);
    DECLARE fix_command VARCHAR(500);
    DECLARE isAdmin SMALLINT;
    DECLARE utilizadorLigado VARCHAR(50);

    SET isAdmin = 0;

    /* Substitui§o das views pelas tabelas LOG */
    SELECT (
        replace(replace(replace(replace(replace(arg_command, 
            'DBA.CulturaPorInvestigador', 'LogCultura'),
            'DBA.InvestigadorPorInvestigador', 'LogInvestigador'),
            'DBA.VariaveisPorInvestigador', 'LogVariaveis'), 
            'DBA.MedicoesPorInvestigador', 'LogMedicoes'),
			'DBA.HumidadeTemperatura', 'LogHumidadeTemperatura'))
    INTO fix_command;

    SET fix_command_temp = fix_command;
	
	/* Substitui§o das tabelas pelas tabelas LOG */
    SELECT (
        replace(replace(replace(replace(replace(replace(replace(fix_command, 
            ' Cultura', ' LogCultura'),
			',Cultura', ',LogCultura '),
            ' Investigador', ' LogInvestigador'),
			',Investigador', ',LogInvestigador'),
            'Variaveis', 'LogVariaveis'), 
            'Medicoes', 'LogMedicoes'),
			'DBA.', ''))
    INTO fix_command;

    IF (fix_command = fix_command_temp)
    THEN SELECT 0 INTO isAdmin
    ELSE SELECT 1 INTO isAdmin
    ENDIF;

    /* Aplica§o do fator data de opera§o anterior */
    IF (charindex('WHERE', fix_command) > 0)
    THEN SELECT replace(fix_command, 'WHERE ', 'WHERE dataOperacao <= ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD') + ' AND ')
    INTO fix_command;

    ELSE IF (charindex('ORDER BY', fix_command) > 0)
    THEN SELECT replace(fix_command, 'ORDER BY ', 'WHERE dataOperacao <= ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD') + ' ORDER BY ')
    INTO fix_command;

    ELSE IF (charindex('INNER JOIN', fix_command) > 0)
    THEN SELECT replace(fix_command, 'INNER JOIN ', 'WHERE dataOperacao <= ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD') + ' INNER JOIN ')
    INTO fix_command;

    ELSE IF (charindex('LEFT JOIN', fix_command) > 0)
    THEN SELECT replace(fix_command, 'LEFT JOIN ', 'WHERE dataOperacao <= ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD') + ' LEFT JOIN ')
    INTO fix_command;

    ELSE IF (charindex('RIGHT JOIN', fix_command) > 0)
    THEN SELECT replace(fix_command, 'RIGHT JOIN ', 'WHERE dataOperacao <= ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD') + ' RIGHT JOIN ')
    INTO fix_command;

    ELSE IF (charindex('JOIN', fix_command) > 0)
    THEN SELECT replace(fix_command, 'JOIN ', 'WHERE dataOperacao <= ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD') + ' JOIN ')
    INTO fix_command;

    ELSE SELECT (fix_command + ' WHERE dataOperacao <= ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD')) INTO fix_command;
    
    END IF; END IF; END IF; END IF; END IF; END IF;
   
    /* Adapta§o da data de opera§o   tabela existente */
	IF (charindex('LogCultura', fix_command) > 0)
    THEN SELECT replace(fix_command, 'dataOperacao', 'LogCultura.dataOperacao') INTO fix_command;

    ELSE IF (charindex('LogInvestigador', fix_command) > 0)
    THEN SELECT replace(fix_command, 'dataOperacao', 'LogInvestigador.dataOperacao') INTO fix_command;

    ELSE IF (charindex('LogVariaveis', fix_command) > 0)
    THEN SELECT replace(fix_command, 'dataOperacao', 'LogVariaveis.dataOperacao') INTO fix_command;

    ELSE IF (charindex('LogMedicoes', fix_command) > 0)
    THEN SELECT replace(fix_command, 'dataOperacao', 'LogMedicoes.dataOperacao') INTO fix_command;

    ELSE IF (charindex('LogHumidadeTemperatura', fix_command) > 0)
    THEN SELECT replace(fix_command, 'dataOperacao', 'LogHumidadeTemperatura.dataOperacao') INTO fix_command;
    
    END IF; END IF; END IF; END IF; END IF;

    /* Inser§o do comando na tabela logSelect */
    INSERT INTO LogSelect (comandoSelect, utilizador, dataOperacao)
    VALUES (fix_command, user_name(), CURRENT TIMESTAMP);
	
    /* Verifica se é um admin ou investigador e permite o execute */
    SELECT FIRST Investigador.email INTO utilizadorLigado FROM Investigador
	WHERE Investigador.email = user_name();
	
    IF utilizadorLigado IS NOT NULL AND isAdmin = 1 THEN 
        RAISERROR 23000 'Nao tem permissao para efetuar o comando'
    ELSE
        EXECUTE IMMEDIATE WITH RESULT SET ON arg_command;
    END IF;
END;


create procedure "DBA"."sp_softDeleteMedicoes"(IN arg_id INTEGER, IN arg_idCult INTEGER, IN arg_idVar INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
	UPDATE Medicoes
    SET deleted = 1
    WHERE numeroMedicao = arg_id AND idCultura = arg_idCult AND idVariavel = arg_idVar
END;


create procedure "DBA"."sp_softDeleteInvestigador"(IN arg_id INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
	UPDATE Investigador
    SET deleted = 1
    WHERE idInvestigador = arg_id
END;


create procedure "DBA"."sp_softDeleteCultura"(IN arg_id INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
	UPDATE Cultura
    SET deleted = 1
    WHERE idCultura = arg_id
END;


create procedure "DBA"."sp_softDeleteVariaveis"(IN arg_id INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
	UPDATE Variaveis
    SET deleted = 1
    WHERE idVariavel = arg_id
END;


create procedure "DBA"."sp_softDeleteVariaveisMedidas"(IN arg_idVar INTEGER, IN arg_idCul INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
	UPDATE VariaveisMedidas
    SET deleted = 1
    WHERE idVariavel = arg_idVar AND idCultura = arg_idCul
END;


CREATE PROCEDURE "DBA"."sp_NoDataAlert"(IN medicao INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
	DECLARE valorTemp DECIMAL(8,2);
    DECLARE valorHumi DECIMAL(8,2);
    DECLARE lastAlert INTEGER;

    SELECT valorMedicaoTemperatura INTO valorTemp FROM HumidadeTemperatura WHERE idMedicao = medicao; 
    SELECT valorMedicaoHumidade INTO valorHumi FROM HumidadeTemperatura WHERE idMedicao = medicao;

    SELECT count(idMedicao) INTO lastAlert FROM HumidadeTemperatura 
    WHERE idMedicao > medicao - 12 AND valorMedicaoHumidade = NULL AND valorMedicaoTemperatura = NULL;

    IF valorTemp IS NULL AND valorHumi IS NULL AND lastAlert = 0
    THEN
        INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
        VALUES ('NoDataAlert', NULL, now(), NULL);
        RETURN 3;
    ENDIF;

    SELECT count(idMedicao) INTO lastAlert FROM HumidadeTemperatura 
    WHERE idMedicao > medicao - 12 AND valorMedicaoTemperatura = NULL;

    IF valorTemp IS NULL AND lastAlert = 0
    THEN
        INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
        VALUES ('NoTempAlert', NULL, now(), NULL);
        RETURN 1;
    ENDIF;

    SELECT count(idMedicao) INTO lastAlert FROM HumidadeTemperatura 
    WHERE idMedicao > medicao - 12 AND valorMedicaoHumidade = NULL;

    IF valorHumi IS NULL AND lastAlert = 0
    THEN
        INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
        VALUES ('NoHumiAlert', NULL, now(), NULL);
        RETURN 2;
    ENDIF;

    RETURN 0;
END;


CREATE PROCEDURE "DBA"."sp_ReadErrorAlert"(IN medicao INTEGER, IN noDataAlert INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
	DECLARE valorTempNow DECIMAL(8,2);
    DECLARE valorTempBefore DECIMAL(8,2);
    DECLARE valorHumiNow DECIMAL(8,2);
    DECLARE valorHumiBefore DECIMAL(8,2);

    SELECT valorMedicaoTemperatura INTO valorTempNow FROM HumidadeTemperatura WHERE idMedicao = medicao;
    SELECT valorMedicaoTemperatura INTO valorTempBefore FROM HumidadeTemperatura WHERE idMedicao = medicao - 1; 
    SELECT valorMedicaoHumidade INTO valorHumiNow FROM HumidadeTemperatura WHERE idMedicao = medicao;
    SELECT valorMedicaoHumidade INTO valorHumiBefore FROM HumidadeTemperatura WHERE idMedicao = medicao - 1;

    IF abs(valorTempNow - valorTempBefore) >= 20 AND abs(valorHumiNow - valorHumiBefore) >= 20 AND noDataAlert = 0
    THEN
        INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
        VALUES ('ReadTempErrorAlert', NULL, now(), valorTempNow);
        INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
        VALUES ('ReadHumiErrorAlert', NULL, now(), valorHumiNow);
        RETURN 3;
    ENDIF;

    IF abs(valorTempNow - valorTempBefore) >= 20 AND noDataAlert <> 1 AND noDataAlert <> 3
    THEN
        INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
        VALUES ('ReadTempErrorAlert', NULL, now(), valorTempNow);
        RETURN 1;
    ENDIF;

    IF abs(valorHumiNow - valorHumiBefore) >= 20 AND noDataAlert <> 2 AND noDataAlert <> 3
    THEN
        INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
        VALUES ('ReadHumiErrorAlert', NULL, now(), valorHumiNow);
        RETURN 2;
    ENDIF;

    RETURN 0;
END;


CREATE PROCEDURE "DBA"."sp_TempAlert"(IN medicao INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
    DECLARE numAmostras INTEGER DEFAULT 60;
    DECLARE idMedicaoInicial INTEGER;
	DECLARE somaQuadX DECIMAL(8,2);
    DECLARE somaX DECIMAL(8,2);
    DECLARE somaTempY DECIMAL(8,2);
    DECLARE somaTempXY DECIMAL(8,2);
    DECLARE decliveTemp DECIMAL(8,2);
    DECLARE numNulls INTEGER;

    DECLARE valorTemp DECIMAL(8,2);
    DECLARE thresholdTemp DECIMAL(8,2) DEFAULT 3;
    
    //Procura valores limites das culturas para dete§o de alertas de proximidade dos limites
    SELECT valorMedicaoTemperatura INTO valorTemp FROM HumidadeTemperatura WHERE idMedicao = medicao;

    INSERT INTO AlertasHumidadeTemperatura(tipoAlerta, dataHora, idCultura, valorReg)
    SELECT 'LowTempAlert', now(), idCultura, valorTemp
    FROM Cultura WHERE limiteInferiorTemperatura > valorTemp - thresholdTemp;

    INSERT INTO AlertasHumidadeTemperatura(tipoAlerta, dataHora, idCultura, valorReg)
    SELECT 'HighTempAlert', now(), idCultura, valorTemp
    FROM Cultura WHERE limiteSuperiorTemperatura < valorTemp + thresholdTemp;

    //Inicia o clculo do declive dos dados atrav©s do m©todo de regresso linear para dete§o de
    //alertas de incremento ou decremento de temperatura ou humidade.
    SET idMedicaoInicial = medicao - numAmostras;
    
    IF (idMedicaoInicial >= 0)
    THEN
        SELECT sum(valorMedicaoTemperatura), sum(valorMedicaoTemperatura * (idMedicao - idMedicaoInicial)), 
            sum(idMedicao - idMedicaoInicial), sum(Power(idMedicao - idMedicaoInicial, 2))
        INTO somaTempY, somaTempXY, somaX, somaQuadX
        FROM HumidadeTemperatura WHERE idMedicao > idMedicaoInicial 
        AND idMedicao <= medicao
        AND valorMedicaoTemperatura IS NOT NULL;

        SELECT count(idMedicao) INTO numNulls FROM HumidadeTemperatura WHERE idMedicao > idMedicaoInicial 
        AND idMedicao <= medicao
        AND valorMedicaoTemperatura IS NOT NULL;
    
 
        //Calcula o declive da varia§o de temperatura e humidade
        SET decliveTemp = (numNulls * somaTempXY - somaTempY * somaX) / 
                            (numNulls * somaQuadX - Power(somaX,2));

        IF decliveTemp > 0.1
        THEN
            INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
            VALUES ('IncTempAlert', NULL, now(), valorTemp);
        ENDIF;

        IF decliveTemp < -0.1
        THEN
            INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
            VALUES ('DecTempAlert', NULL, now(), valorTemp);
        ENDIF;
    ENDIF;
END;


CREATE PROCEDURE "DBA"."sp_HumiAlert"(IN medicao INTEGER)
/* RESULT( column_name column_type, ... ) */
BEGIN
    DECLARE numAmostras INTEGER DEFAULT 60;
    DECLARE idMedicaoInicial INTEGER;
	DECLARE somaQuadX INTEGER;
    DECLARE somaX INTEGER;
    DECLARE somaHumiY INTEGER;
    DECLARE somaHumiXY INTEGER;
    DECLARE decliveHumi DECIMAL(8,2);
    DECLARE numNulls INTEGER;

    DECLARE valorHumi DECIMAL(8,2);
    DECLARE thresholdHumi DECIMAL(8,2) DEFAULT 5;
    
    //Procura valores limites das culturas para dete§o de alertas de proximidade dos limites
    SELECT valorMedicaoHumidade INTO valorHumi FROM HumidadeTemperatura WHERE idMedicao = medicao;

    INSERT INTO AlertasHumidadeTemperatura(tipoAlerta, dataHora, idCultura, valorReg)
    SELECT 'LowHumiAlert', now(), idCultura, valorHumi
    FROM Cultura WHERE limiteInferiorHumidade > valorHumi - thresholdHumi;
    
    //Inicia o clculo do declive dos dados atrav©s do m©todo de regresso linear para dete§o de
    //alertas de incremento ou decremento de temperatura ou humidade.
    SET idMedicaoInicial = medicao - numAmostras;
    
    IF (idMedicaoInicial >= 0)
    THEN 
        SELECT sum(valorMedicaoHumidade), sum(valorMedicaoHumidade * (idMedicao - idMedicaoInicial)), 
            sum(idMedicao - idMedicaoInicial), sum(Power(idMedicao - idMedicaoInicial, 2))
        INTO somaHumiY, somaHumiXY, somaX, somaQuadX
        FROM HumidadeTemperatura WHERE idMedicao > idMedicaoInicial 
        AND idMedicao <= medicao
        AND valorMedicaoHumidade IS NOT NULL;

        SELECT count(idMedicao) INTO numNulls FROM HumidadeTemperatura WHERE idMedicao > idMedicaoInicial 
        AND idMedicao <= medicao
        AND valorMedicaoHumidade IS NOT NULL;

        //Calcula o declive da varia§o de humidade
        SET decliveHumi = (numNulls * somaHumiXY - somaHumiY * somaX) / 
                            (numNulls * somaQuadX - Power(somaX,2));

        IF decliveHumi > 0.1
        THEN
            INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
            VALUES ('IncHumiAlert', NULL, now(), valorHumi);
        ENDIF;

        IF decliveHumi < -0.1
        THEN
            INSERT INTO AlertasHumidadeTemperatura (tipoAlerta, idCultura, dataHora, valorReg)
            VALUES ('DecHumiAlert', NULL, now(), valorHumi);
        ENDIF;
    ENDIF;
END;