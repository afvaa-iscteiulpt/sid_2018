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

/*
ADMINISTRADORES
*/
grant execute on createVariavelMedida to "Administrador";

grant execute on createInvestigador to "Administrador";
grant execute on deleteInvestigador to "Administrador";


