// Creating users and groups
IF NOT EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores')
create user "Investigadores";
grant group to "Investigadores";

IF NOT EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Administradores')
create user "Administradores";
grant group to "Administradores";

IF NOT EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Mongo')
create user "Mongo";

IF NOT EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'SuperAdministrador')
create user "SuperAdministrador";

// Table permissions
// Falta das grant aos views de select das tabelas Cultura, VariaveisMedidas e Medicoes
revoke all from "Investigadores";
grant insert, update on DBA.Medicoes to "Investigadores";  // Precisa de trigger before update, delete, insert

CREATE USER "Administrador Andre" IDENTIFIED BY 'pass';
GRANT DBA, REMOTE DBA TO "Administrador Andre";


revoke all from "Administradores";
grant select, insert, delete, update on DBA.HumidadeTemperatura to "Administradores";
grant select, insert, delete, update on DBA.Medicoes to "Administradores"; // SD SP
grant select, insert, delete, update on DBA.Variaveis to "Administradores"; // SD SP
grant select, insert, delete, update on DBA.VariaveisMedidas to "Administradores"; // SD SP
grant select, insert, delete, update on DBA.Cultura to "Administradores"; // SD SP
grant select, insert, delete, update on DBA.Investigador to "Administradores"; // SD SP

revoke all from "Mongo";
grant insert on DBA.HumidadeTemperatura to "Mongo";

revoke all from "SuperAdministrador";
/*
Como dar permissão para adicionar users (investigadores e admins) à base de dados em codigo sql?
*/

/*
Ver como dar permissão para criar usários e atribuir grupos
*/

// Stored Procedure Permissions