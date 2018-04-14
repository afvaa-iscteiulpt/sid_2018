drop procedure if exists "DBA"."Export_to_MySQL";

create procedure "DBA"."Export_to_MySQL"
BEGIN
 	SELECT * FROM Log_HumidadeTemperatura;
	OUTPUT TO Log_HumidadeTemperatura.txt
    	FORMAT TEXT;
	
	SELECT * FROM Log_VariaveisMedidas;
	OUTPUT TO Log_VariaveisMedidas.txt
    	FORMAT TEXT;
	
	SELECT * FROM Log_Variaveis;
	OUTPUT TO Log_Variaveis.txt
    	FORMAT TEXT;
	
	SELECT * FROM Log_Cultura;
	OUTPUT TO Log_Cultura.txt
    	FORMAT TEXT;

	SELECT * FROM Log_Investigadores;
	OUTPUT TO Log_Investigadores.txt
    	FORMAT TEXT;

	SELECT * FROM Log_Medicoes;
	OUTPUT TO Log_Medicoes.txt
    	FORMAT TEXT;

	SELECT * FROM Log_Consultas;
	OUTPUT TO Log_Consultas.txt
    	FORMAT TEXT;
END;
