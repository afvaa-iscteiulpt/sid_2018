IF NOT EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores')
create user "Investigadores";
grant group to "Investigadores";

IF NOT EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Administradores')
create user "Administradores";
grant group to "Administradores";

IF NOT EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Mongo')
create user "Mongo";

// Permissões para Investigadores terao que ser atualizadas para implementar Triggers/SPs
// Para limitar por cultura pretencente ao respetivo investigador
revoke all from "Investigadores";
// Falta das grant aos views de select das tabelas Cultura, VariaveisMedidas e Medicoes
grant update on DBA.Cultura to "Investigadores"; // Precisa de trigger before update
grant insert, delete, update on DBA.Medicoes to "Investigadores";  // Precisa de trigger before update, delete, insert

revoke all from "Administradores";
grant select on DBA.HumidadeTemperatura to "Administradores";
grant select on DBA.Medicoes to "Administradores";
grant select on DBA.Variaveis to "Administradores";
grant select, insert, delete, update on DBA.VariaveisMedidas to "Administradores";
grant select, insert, delete, update on DBA.Cultura to "Administradores";
grant select, insert, delete, update on DBA.Investigador to "Administradores";

revoke all from "Mongo";
grant insert on DBA.HumidadeTemperatura to "Mongo";
