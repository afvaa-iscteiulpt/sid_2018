/*==============================================================*/
/* Create Users and Groups              						*/
/*==============================================================*/

# Nao tem proteção caso o user já exista

/*
AUDITOR
*/
create user 'Auditor' identified by 'password';
revoke all privileges, grant option from 'Auditor';

/*
MYSQLREMOTE
*/
create user 'MySQLRemote' identified by 'password';
revoke all privileges, grant option from 'MySQLRemove';

/*==============================================================*/
/* Grant Table Permissions                 						*/
/*==============================================================*/

/*
AUDITOR
*/
grant select on LogCultura to Auditor;
grant select on LogHumidadeTemperatura to Auditor;
grant select on LogInvestigador to Auditor;
grant select on LogMedicoes to Auditor;
grant select on LogSelect to Auditor;
grant select on LogVariaveis to Auditor;
grant select on LogVariaveisMedidas to Auditor;

/*
MYSQLREMOTE
*/
grant select, insert on LogCultura to MySQLRemote;
grant select, insert on LogHumidadeTemperatura to MySQLRemote;
grant select, insert on LogInvestigador to MySQLRemote;
grant select, insert on LogMedicoes to MySQLRemote;
grant select, insert on LogSelect to MySQLRemote;
grant select, insert on LogVariaveis to MySQLRemote;
grant select, insert on LogVariaveisMedidas to MySQLRemote;

/*==============================================================*/
/* Grant Views Permissions                 						*/
/*==============================================================*/

grant select on V_Upd_Investigador to Auditor;
grant select on V_Upd_Cultura to Auditor;
grant select on V_Upd_Variaveis to Auditor;
grant select on V_Upd_VariaveisMedidas to Auditor;
grant select on V_Upd_Medicoes to Auditor;




