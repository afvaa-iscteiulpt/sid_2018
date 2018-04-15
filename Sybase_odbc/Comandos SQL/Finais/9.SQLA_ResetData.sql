ALTER PROCEDURE "DBA"."sp_resetData"( /* [IN | OUT | INOUT] parameter_name parameter_type [DEFAULT default_value], ... */ )
/* RESULT( column_name column_type, ... ) */
BEGIN
    truncate table Medicoes;
    truncate table VariaveisMedidas;
	truncate table Cultura;
    truncate table HumidadeTemperatura;
    truncate table Investigador;
    truncate table LogCultura;
    truncate table LogInvestigador;
    truncate table LogMedicoes;
    truncate table LogSelect;
    truncate table LogVariaveis;
    truncate table LogVariaveisMedidas;
    truncate table Variaveis;
END