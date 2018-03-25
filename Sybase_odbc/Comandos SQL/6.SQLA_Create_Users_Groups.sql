/*==============================================================*/
/* Create Users and Groups              						*/
/*==============================================================*/

/*
INVESTIGADORES
*/
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'Investigadores')
create user "Investigadores";
revoke all from "Investigadores";
grant group to "Investigadores";

/*
ADMINISTRADORES
*/
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'Administradores')
create user "Administradores";
revoke all from "Administradores";
grant group to "Administradores";

/*
MONGODB
*/
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'MongoDB')
create user "MongoDB" identified by "password";
revoke all from "MongoDB";

/*
SUPERADMINISTRADOR
*/
if not exists (select * FROM dbo.sysusers where dbo.sysusers.name = 'SuperAdministrador')
create user "SuperAdministrador" identified by "password";
revoke all from "SuperAdministrador";
grant membership in group "Administradores" to "SuperAdministrador";

/*==============================================================*/
/* Grant Table Permissions                 						*/
/*==============================================================*/

/*
INVESTIGADORES
*/
grant insert, update on DBA.Medicoes to "Investigadores";  
// REMEMBER: trigger before update e insert
// Falta grant as views de select das tabelas Cultura, VariaveisMedidas e Medicoes
// Falta grant a soft delete a tabela Medicoes

/*
ADMINISTRADORES
*/
// Faltam grants a SP de softDelete
grant select, insert, delete, update on DBA.HumidadeTemperatura to "Administradores";
grant select, insert, delete, update on DBA.Medicoes to "Administradores";
grant select, insert, delete, update on DBA.Variaveis to "Administradores";
grant select, insert, delete, update on DBA.VariaveisMedidas to "Administradores";
grant select, insert, delete, update on DBA.Cultura to "Administradores";
// Insert, update e delete de Investigadores atraves de SP_CreateInvestigador, SP_AlterInvestigador e SP_DropInvestigador
// de forma a sincronizar 
grant select on DBA.Investigador to "Administradores";

/*
MONGODB
*/
grant insert on DBA.HumidadeTemperatura to "MongoDB";

/*
SUPERADMINISTRADOR
*/
// Falta grants para criar admins atraves de SP_createInvestigador, SP_AlterInvestigador e SP_DeleteInvestigador









