--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     18/03/2018 19:30:24                          */
/*==============================================================*/
/* SCRIPT PARA CRIAÇÃO DE Proxy Tables no SQLAnywhere (Sybase), */
/* com base no "remote server" logsDb_remote e na base de dados */
/* e na base de dados remota mysqlodbc.                            */
/*==============================================================*/
/*==============================================================*/
/* Remote Server                            					*/
/*==============================================================*/

/*-------------------------------------------------------------------------------------------------
*  DROP das Proxy Tables 
* -------------------------------------------------------------------------------------------------
*/
DROP TABLE

IF EXISTS "DBA"."logcultura_remote";
	DROP TABLE

IF EXISTS "DBA"."loginvestigador_remote";
	DROP TABLE
IF EXISTS "DBA"."logmedicoes_remote";
	DROP TABLE

IF EXISTS "DBA"."logselect_remote";
	DROP TABLE

IF EXISTS "DBA"."logvariaveis_remote";
	DROP TABLE

IF EXISTS "DBA"."logvariaveismedidas_remote";
	DROP TABLE

IF EXISTS "DBA"."loghumidadetemperatura_remote";

/* Descomentar if remote server existir. */
/*DROP SERVER "mysqlodbc_remote";*/

CREATE SERVER "mysqlodbc_remote" CLASS 'MYSQLODBC' USING 'mysqlodbc';

/*==============================================================*/
/* External Login                            					*/
/*==============================================================*/
CREATE EXTERNLOGIN "DBA" TO "mysqlodbc_remote" REMOTE LOGIN 'mysqlremote' IDENTIFIED BY 'mysqlremoteserver';

	/*-------------------------------------------------------------------------------------------------
*  CREATE das Proxy Tables 
* -------------------------------------------------------------------------------------------------
*/
CREATE EXISTING TABLE "DBA"."logcultura_remote" AT 'mysqlodbc_remote;mysqlodbc;;logcultura';

CREATE EXISTING TABLE "DBA"."loginvestigador_remote" AT 'mysqlodbc_remote;mysqlodbc;;loginvestigador';

CREATE EXISTING TABLE "DBA"."logmedicoes_remote" AT 'mysqlodbc_remote;mysqlodbc;;logmedicoes';

CREATE EXISTING TABLE "DBA"."logselect_remote" AT 'mysqlodbc_remote;mysqlodbc;;logselect';

CREATE EXISTING TABLE "DBA"."logvariaveis_remote" AT 'mysqlodbc_remote;mysqlodbc;;logvariaveis';

CREATE EXISTING TABLE "DBA"."logvariaveismedidas_remote" AT 'mysqlodbc_remote;mysqlodbc;;logvariaveismedidas';

CREATE EXISTING TABLE "DBA"."loghumidadetemperatura_remote" AT 'mysqlodbc_remote;mysqlodbc;;loghumidadetemperatura';
