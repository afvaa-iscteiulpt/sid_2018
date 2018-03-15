IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores')
drop user "Investigadores";
create user "Investigadores";
grant group to "Investigadores";

IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Administradores')
drop user "Administradores";
create user "Administradores";
grant group to "Administradores";

IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Mongo')
drop user "Mongo";
create user "Mongo";

revoke all from "Investigadores";
grant insert, delete, update on DBA.VariaveisMedidas to "Investigadores";
grant insert, delete, update on DBA.Medicoes to "Investigadores";

revoke all from "Administradores";
grant select on DBA.HumidadeTemperatura to "Administradores";
grant select on DBA.Medicoes to "Administradores";
grant select on DBA.Variaveis to "Administradores";
grant select on DBA.VariaveisMedidas to "Administradores";
grant select, insert, delete, update on DBA.Cultura to "Administradores";
grant select, insert, delete, update on DBA.Investigador to "Administradores";

revoke all from "Mongo";
grant insert on DBA.HumidadeTemperatura to "Mongo";
