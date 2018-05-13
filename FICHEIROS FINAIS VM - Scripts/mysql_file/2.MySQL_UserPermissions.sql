/*==============================================================*/
/* Create Users and Groups              						*/
/*==============================================================*/

# Nao tem proteção caso o user já exista

/*
AUDITOR
*/
create user 'Auditor' identified by 'password';
revoke all privileges, grant option from 'Auditor';

/*==============================================================*/
/* Grant Table Permissions                 						*/
/*==============================================================*/

/*
AUDITOR
*/
grant select on Log_Cultura to Auditor;
grant select on Log_Consultas to Auditor;
grant select on Log_HumidadeTemperatura to Auditor;
grant select on Log_Investigadores to Auditor;
grant select on Log_Medicoes to Auditor;
grant select on Log_Variaveis to Auditor;
grant select on Log_VariaveisMedidas to Auditor;















