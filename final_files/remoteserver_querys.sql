/*==============================================================*/
/* Remote Server                            					*/
/*==============================================================*/
CREATE SERVER "logsMySQL_remote" CLASS 'MYSQLODBC' USING 'logsDb';

/*==============================================================*/
/* External Login                            					*/
/*==============================================================*/
CREATE EXTERNLOGIN "DBA" TO "logsMySQL_remote" REMOTE LOGIN 'mysqlremote' IDENTIFIED BY '***';

/*==============================================================*/
/* Proxy Tables                         						*/
/*==============================================================*/
CREATE EXISTING TABLE "DBA"."logcultura_remote" AT 'logsMySQL_remote;logsdb;;logcultura';
CREATE EXISTING TABLE "DBA"."loginvestigador_remote" AT 'logsMySQL_remote;logsdb;;loginvestigador';
CREATE EXISTING TABLE "DBA"."logmedicoes_remote" AT 'logsMySQL_remote;logsdb;;logmedicoes';
CREATE EXISTING TABLE "DBA"."logselect_remote" AT 'logsMySQL_remote;logsdb;;logselect';
CREATE EXISTING TABLE "DBA"."logvariaveis_remote" AT 'logsMySQL_remote;logsdb;;logvariaveis';
CREATE EXISTING TABLE "DBA"."logvariaveismedidas_remote" AT 'logsMySQL_remote;logsdb;;logvariaveismedidas';