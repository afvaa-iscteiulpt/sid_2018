/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     18/03/2018 19:30:24                          */
/*==============================================================*/
/* SCRIPT PARA CRIAÇÃO DE STORED PROCEDURES                     */
/*==============================================================*/
drop procedure if exists sp_insLogSelects;

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

    INSERT INTO LogSelect (comandoSelect, utilizador, dataOperacao)
    VALUES (fix_command, 1, CURRENT TIMESTAMP);
END
