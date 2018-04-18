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
	DECLARE fix_command VARCHAR(500);

    /* Substituição das views pelas tabelas LOG */
    SELECT (
        replace(replace(replace(replace(replace(arg_command, 
            'DBA.CulturaPorInvestigador', 'LogCultura'),
            'DBA.InvestigadorPorInvestigador', 'LogInvestigador'),
            'DBA.VariaveisPorInvestigador', 'LogVariaveis'), 
            'DBA.MedicoesPorInvestigador', 'LogMedicoes'),
			'DBA.HumidadeTemperatura', 'LogHumidadeTemperatura'))
    INTO fix_command;
	
	/* Substituição das tabelas pelas tabelas LOG */
    SELECT (
        replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(fix_command, 
            ' Cultura ', ' LogCultura '),
			' Cultura,', ' LogCultura,'),
			',Cultura ', ',LogCultura '),
			',Cultura,', ',LogCultura,'),
            ' Investigador ', ' LogInvestigador '),
			' Investigador,', ' LogInvestigador,'),
			',Investigador ', ',LogInvestigador '),
			',Investigador,', ',LogInvestigador,'),
            'Variaveis', 'LogVariaveis'), 
            'Medicoes', 'LogMedicoes'),
			'DBA.', ''))
    INTO fix_command;

    /* Aplicação do fator data de operação anterior */
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
   
    /* Adaptação da data de operação à tabela existente */
	IF (charindex('LogCultura', fix_command) > 0)
    THEN SELECT replace(fix_command, 'dataOperacao', 'LogCultura.dataOperacao') INTO fix_command;

    ELSE IF (charindex("LogInvestigador", fix_command) > 0)
    THEN SELECT replace(fix_command, "dataOperacao", "LogInvestigador.dataOperacao") INTO fix_command;

    ELSE IF (charindex("LogVariaveis", fix_command) > 0)
    THEN SELECT replace(fix_command, "dataOperacao", "LogVariaveis.dataOperacao") INTO fix_command;

    ELSE IF (charindex("LogMedicoes", fix_command) > 0)
    THEN SELECT replace(fix_command, "dataOperacao", "LogMedicoes.dataOperacao") INTO fix_command;

    ELSE IF (charindex("LogHumidadeTemperatura", fix_command) > 0)
    THEN SELECT replace(fix_command, "dataOperacao", "LogHumidadeTemperatura.dataOperacao") INTO fix_command;
    
    END IF; END IF; END IF; END IF; END IF;

    /* Inserção do comando na tabela logSelect */
    INSERT INTO LogSelect (comandoSelect, utilizador, dataOperacao)
    VALUES (fix_command, user_name(), CURRENT TIMESTAMP);
	
	EXECUTE IMMEDIATE WITH RESULT SET ON arg_command;
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