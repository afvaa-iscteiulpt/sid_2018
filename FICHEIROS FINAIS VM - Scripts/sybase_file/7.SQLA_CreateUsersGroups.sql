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
ADMINISTRADOR
*/
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'Administrador')
create user "Administrador";
revoke all from "Administrador";

/*==============================================================*/
/* Grant Table Permissions                 						*/
/*==============================================================*/

/*
ADMINISTRADORES
*/
grant select, insert, delete, update on DBA.Cultura to "Administrador";
grant insert, delete, update on DBA.HumidadeTemperatura to "Administrador";
grant select on DBA.Medicoes to "Administrador";
grant select, insert, delete, update on DBA.Variaveis to "Administrador";
grant select, insert, delete, update on DBA.VariaveisMedidas to "Administrador";
grant select, insert, delete, update on DBA.Investigador to "Administrador";

// LOGS
grant select on DBA.log_variaveis to "Administrador";
grant select on DBA.log_consultas to "Administrador";
grant select on DBA.log_medicoes to "Administrador";
grant select on DBA.log_cultura to "Administrador";
grant select on DBA.log_humidadetemperatura to "Administrador";
grant select on DBA.log_variaveismedidas to "Administrador";
grant select on DBA.log_investigadores to "Administrador";


/*==============================================================*/
/* Grant Stored Procedures Permissions      					*/
/*==============================================================*/

/*
INVESTIGADORES
*/

grant execute on deleteMedicoes to "Investigadores";
grant execute on insertMedicoes to "Investigadores";
grant execute on updateMedicoes to "Investigadores";
grant execute on consultCulturas to "Investigadores";
grant execute on consultHumidadeTemperatura to "Investigadores";
grant execute on consultVariaveis to "Investigadores";
grant execute on consultVariaveisMedidas to "Investigadores";
grant execute on consultMedicoes to "Investigadores";

/*
ADMINISTRADORES
*/

grant execute on createVariavelMedida to "Administrador";

grant execute on createInvestigador to "Administrador";
grant execute on deleteInvestigador to "Administrador";


