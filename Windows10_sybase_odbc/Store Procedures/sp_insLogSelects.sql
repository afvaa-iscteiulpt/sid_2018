ALTER PROCEDURE "DBA"."sp_insLogSelects"( 
    IN arg_command VARCHAR(500) DEFAULT ''
)
/* RESULT( column_name column_type, ... ) */
BEGIN
	DECLARE fix_command VARCHAR(500);

    SELECT replace(replace(replace(replace(arg_command, 'Cultura', 'LogCultura'), 
        'Variaveis', 'LogVariaveis'),
        'Investigador', 'LogInvestigador'), 
        'Medicoes', 'LogMedicoes') 
    INTO fix_command;

    INSERT INTO LogSelects (dateTime, command)
    VALUES (CURRENT TIMESTAMP, fix_command);
END