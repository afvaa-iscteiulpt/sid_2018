DROP EVENT if exists "DBA"."Export_to_MySQL";

CREATE EVENT "DBA"."Export_to_MySQL"
SCHEDULE schedule_2_times_a_day
	START TIME '12:00:00'
	EVERY 12 HOURS
HANDLER BEGIN
	----------------------------
	CALL dba.Export_to_MySQL;
	----------------------------
	MESSAGE STRING (
	'Evento ' , 
	EVENT_PARAMETER ( 'EventName' ),
        ' despoletado em ',
	CURRENT TIMESTAMP,
	' devido ao schedule ',
	EVENT_PARAMETER ( 'ScheduleName' )) TO CONSOLE;
END;