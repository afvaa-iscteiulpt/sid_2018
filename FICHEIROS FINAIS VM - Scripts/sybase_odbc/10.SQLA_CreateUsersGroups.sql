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
revoke membership in group "Administradores" from "SuperAdministrador";
grant membership in group "Administradores" to "SuperAdministrador";

/*==============================================================*/
/* Grant Table Permissions                 						*/
/*==============================================================*/

/*
INVESTIGADORES
*/
grant insert, update on DBA.Medicoes to "Investigadores";  

/*
ADMINISTRADORES
*/
grant select, insert, delete, update on DBA.HumidadeTemperatura to "Administradores";
grant select, insert, delete, update on DBA.Medicoes to "Administradores";
grant select, insert, delete, update on DBA.Variaveis to "Administradores";
grant select, insert, delete, update on DBA.VariaveisMedidas to "Administradores";
grant select, insert, delete, update on DBA.Cultura to "Administradores";
grant select on DBA.Investigador to "Administradores";

/*
SUPERADMINISTRADOR - COPIA DE ADMINISTRADORES
*/
grant select, insert, delete, update on DBA.HumidadeTemperatura to "SuperAdministrador";
grant select, insert, delete, update on DBA.Medicoes to "SuperAdministrador";
grant select, insert, delete, update on DBA.Variaveis to "SuperAdministrador";
grant select, insert, delete, update on DBA.VariaveisMedidas to "SuperAdministrador";
grant select, insert, delete, update on DBA.Cultura to "SuperAdministrador";
grant select on DBA.Investigador to "SuperAdministrador";

/*
MONGODB
*/
grant insert on DBA.HumidadeTemperatura to "MongoDB";

/*==============================================================*/
/* Grant Views Permissions              						*/
/*==============================================================*/

/*
INVESTIGADORES
*/
grant select on InvestigadorPorInvestigador to "Investigadores";
grant select on CulturaPorInvestigador to "Investigadores";
grant select on VariaveisPorInvestigador to "Investigadores";
grant select on VariaveisMedidasPorInvestigador to "Investigadores";
grant select on MedicoesPorInvestigador to "Investigadores";
grant select on AlertasPorInvestigador to "Investigadores";


/*==============================================================*/
/* Grant Stored Procedures Permissions      					*/
/*==============================================================*/

/*
INVESTIGADORES
*/
grant execute on SP_softDeleteMedicoes to "Investigadores";
grant execute on sp_insLogSelects to "Investigadores";

/*
SUPERADMINISTRADOR
*/

grant execute on SP_createAdministrador to "SuperAdministrador";
grant execute on SP_dropAdministrador to "SuperAdministrador";

/*
ADMINISTRADORES
*/
grant execute on SP_softDeleteMedicoes to "Administradores";
grant execute on SP_softDeleteVariaveisMedidas to "Administradores";
grant execute on SP_softDeletevariaveis to "Administradores";
grant execute on SP_softDeleteCultura to "Administradores";
grant execute on SP_softDeleteInvestigador to "Administradores";
grant execute on sp_insLogSelects to "Administradores";

grant execute on SP_createInvestigador to "SuperAdministrador";
grant execute on SP_alterInvestigador to "SuperAdministrador";
grant execute on SP_dropInvestigador to "SuperAdministrador";




