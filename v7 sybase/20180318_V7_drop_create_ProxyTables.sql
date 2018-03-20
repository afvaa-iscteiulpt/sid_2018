/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     18/03/2018 19:30:24                          */
/*==============================================================*/
/* SCRIPT PARA CRIAÇÃO DE Proxy Tables no SQLAnywhere (Sybase), */    
/* com base no "remote server" logsDb_remote e na base de dados */
/* e na base de dados remota LogsDB.                            */
/*==============================================================*/
/*-------------------------------------------------------------------------------------------------
*  DROP das Proxy Tables 
* -------------------------------------------------------------------------------------------------
*/
DROP TABLE IF EXISTS "DBA"."logcultura_remote";

DROP TABLE IF EXISTS "DBA"."loginvestigador_remote";

DROP TABLE IF EXISTS "DBA"."logmedicoes_remote";

DROP TABLE IF EXISTS "DBA"."logselect_remote";

DROP TABLE IF EXISTS "DBA"."logvariaveis_remote";

DROP TABLE IF EXISTS "DBA"."logvariaveismedidas_remote";

DROP TABLE IF EXISTS "DBA"."loghumidadetemperatura_remote";

/*-------------------------------------------------------------------------------------------------
*  CREATE das Proxy Tables 
* -------------------------------------------------------------------------------------------------
*/
CREATE EXISTING TABLE "DBA"."logcultura_remote" AT 'logsDb_remote;logsdb;;logcultura';

CREATE EXISTING TABLE "DBA"."loginvestigador_remote" AT 'logsDb_remote;logsdb;;loginvestigador';

CREATE EXISTING TABLE "DBA"."logmedicoes_remote" AT 'logsDb_remote;logsdb;;logmedicoes';

CREATE EXISTING TABLE "DBA"."logselect_remote" AT 'logsDb_remote;logsdb;;logselect';

CREATE EXISTING TABLE "DBA"."logvariaveis_remote" AT 'logsDb_remote;logsdb;;logvariaveis';

CREATE EXISTING TABLE "DBA"."logvariaveismedidas_remote" AT 'logsDb_remote;logsdb;;logvariaveismedidas';

CREATE EXISTING TABLE "DBA"."loghumidadetemperatura_remote" AT 'logsDb_remote;logsdb;;loghumidadetemperatura';;