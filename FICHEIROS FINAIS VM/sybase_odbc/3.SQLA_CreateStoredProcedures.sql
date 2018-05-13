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