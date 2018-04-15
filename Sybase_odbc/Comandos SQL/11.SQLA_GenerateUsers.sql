/*==============================================================*/
/* Generate Users                       						*/
/*==============================================================*/

//Bastante estranho, ele diz apenas que já tem membership nas ultimas linhas "inv10 e admin2"........

/*
INVESTIGADORES
*/
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv1')
create user "inv1" identified by 'inv1';
grant membership in group "Investigadores" to "inv1";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv2')
create user "inv2" identified by 'inv2';
grant membership in group "Investigadores" to "inv2";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv3')
create user "inv3" identified by 'inv3';
grant membership in group "Investigadores" to "inv3";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv4')
create user "inv4" identified by 'inv4';
grant membership in group "Investigadores" to "inv4";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv5')
create user "inv5" identified by 'inv5';
grant membership in group "Investigadores" to "inv5";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv6')
create user "inv6" identified by 'inv6';
grant membership in group "Investigadores" to "inv6";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv7')
create user "inv7" identified by 'inv7';
grant membership in group "Investigadores" to "inv7";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv8')
create user "inv8" identified by 'inv8';
grant membership in group "Investigadores" to "inv8";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv9')
create user "inv9" identified by 'inv9';
grant membership in group "Investigadores" to "inv9";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'inv10')
create user "inv10" identified by 'inv10';
revoke membership in group "Investigadores" from "inv10";
grant membership in group "Investigadores" to "inv10";

/*
ADMINISTRADORES
*/
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'admin1')
create user "admin1" identified by 'admin1';
grant membership in group "Administradores" to "admin1";
if not exists (select * from dbo.sysusers where dbo.sysusers.name = 'admin2')
create user "admin2" identified by 'admin2';
revoke membership in group "Administradores" from "admin2";
grant membership in group "Administradores" to "admin2";
