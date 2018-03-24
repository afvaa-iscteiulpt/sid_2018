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
    
    SELECT (
        'SELECT (' + replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(arg_command, 
            ' Cultura ', ' LogCultura '),
            ',Cultura ', ',LogCultura '),
            ' Cultura,', ' LogCultura,'),
            ',Cultura,', ',LogCultura,'),
            ' Investigador ', ' LogInvestigador '),
            ',Investigador ', ',LogInvestigador '),
            ' Investigador,', ' LogInvestigador,'),
            ',Investigador,', ',LogInvestigador,'), 
            'Variaveis', 'LogVariaveis'), 
            'Medicoes', 'LogMedicoes'),
			'HumidadeTemperatura', 'LogHumidadeTemperatura') 
	    + ') WHERE dataOperacao < ' + dateformat(CURRENT TIMESTAMP, 'YYYY-MM-DD')) 
    INTO fix_command;

	/* Falta o IF para alterar o timestamp para ir buscar à tabela selecionada */
	
    INSERT INTO LogSelect (comandoSelect, utilizador, dataOperacao)
    VALUES (fix_command, 1, CURRENT TIMESTAMP);
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