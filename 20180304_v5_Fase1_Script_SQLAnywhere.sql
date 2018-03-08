/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     05/03/2018 19:12:19                          */
/*==============================================================*/


drop trigger if exists tr_del_Cultura;

drop trigger if exists tr_ins_Cultura;

drop trigger if exists tr_upd_Cultura;

drop trigger if exists tr_del_Investigador;

drop trigger if exists tr_ins_Investigadior;

drop trigger if exists tr_upd_Investigador;

drop trigger if exists tr_del_Medicoes;

drop trigger if exists tr_ins_Medicoes;

drop trigger if exists tr_upd_Medicoes;

drop trigger if exists tr_del_Variaveis;

drop trigger if exists tr_ins_Variaveis;

drop trigger if exists tr_upd_Variaveis;

drop trigger if exists tr_del_VariaveisMedidas;

drop trigger if exists tr_ins_VariaveisMedidas;

drop trigger if exists tr_upd_VariaveisMedidas;

if exists(select 1 from sys.sysforeignkey where role='FK_CULTURA_INVESTIGA_INVESTIG') then
    alter table Cultura
       delete foreign key FK_CULTURA_INVESTIGA_INVESTIG
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEDICOES_MEDICOESV_VARIAVEI') then
    alter table Medicoes
       delete foreign key FK_MEDICOES_MEDICOESV_VARIAVEI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VARIAVEI_VARIAVEIS_CULTURA') then
    alter table VariaveisMedidas
       delete foreign key FK_VARIAVEI_VARIAVEIS_CULTURA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VARIAVEI_VARIAVEIS_VARIAVEI') then
    alter table VariaveisMedidas
       delete foreign key FK_VARIAVEI_VARIAVEIS_VARIAVEI
end if;

drop index if exists Cultura.INVESTIGADORCULTURA_FK;

drop index if exists Cultura.CULTURA_PK;

drop table if exists Cultura;

drop index if exists HumidadeTemperatura.HUMIDADETEMPERATURA_PK;

drop table if exists HumidadeTemperatura;

drop index if exists Investigador.INVESTIGADOR_PK;

drop table if exists Investigador;

drop index if exists LogCultura.LOGCULTURA_PK;

drop table if exists LogCultura;

drop index if exists LogInvestigador.LOGINVESTIGADOR_PK;

drop table if exists LogInvestigador;

drop index if exists LogMedicoes.LOGMEDICOES_PK;

drop table if exists LogMedicoes;

drop index if exists LogSelect.LOGSELECT_PK;

drop table if exists LogSelect;

drop index if exists LogVariaveis.LOGVARIAVEIS_PK;

drop table if exists LogVariaveis;

drop index if exists LogVariaveisMedidas.LOGVARIAVEISMEDIDAS_PK;

drop table if exists LogVariaveisMedidas;

drop index if exists Medicoes.MEDICOESVARMEDIDAS_FK;

drop index if exists Medicoes.MEDICOES_PK;

drop table if exists Medicoes;

drop index if exists Variaveis.VARIAVEIS_PK;

drop table if exists Variaveis;

drop index if exists VariaveisMedidas.VARIAVEISCULTURA_FK2;

drop index if exists VariaveisMedidas.VARIAVEISCULTURA_FK;

drop index if exists VariaveisMedidas.VARIAVEISMEDIDAS_PK;

drop table if exists VariaveisMedidas;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_Cultura') then
      drop sequence S_Cultura
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_HumidadeTemperatura') then
      drop sequence S_HumidadeTemperatura
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_Investigador') then
      drop sequence S_Investigador
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LogCultura') then
      drop sequence S_LogCultura
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LogInvestigador') then
      drop sequence S_LogInvestigador
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LogMedicoes') then
      drop sequence S_LogMedicoes
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LogSelect') then
      drop sequence S_LogSelect
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LogVariaveis') then
      drop sequence S_LogVariaveis
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LogVariaveisMedidas') then
      drop sequence S_LogVariaveisMedidas
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_Medicoes') then
      drop sequence S_Medicoes
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_Variaveis') then
      drop sequence S_Variaveis
end if;

create sequence S_Cultura;

create sequence S_HumidadeTemperatura;

create sequence S_Investigador;

create sequence S_LogCultura;

create sequence S_LogInvestigador;

create sequence S_LogMedicoes;

create sequence S_LogSelect;

create sequence S_LogVariaveis;

create sequence S_LogVariaveisMedidas;

create sequence S_Medicoes;

create sequence S_Variaveis;

/*==============================================================*/
/* Table: Cultura                                               */
/*==============================================================*/
create table Cultura 
(
   idCultura            integer                        not null default (S_Cultura.nextval),
   idInvestigador       integer                        not null,
   nomeCultura          varchar(100)                   not null,
   limiteInferiorTemperatura decimal(8,2)                   not null,
   limiteSuperiorTemperatura decimal(8,2)                   not null,
   limiteInferiorHumidade decimal(8,2)                   not null,
   limiteSuperiorHumidade decimal(8,2)                   not null,
   deleted              smallint                       null,
   constraint PK_CULTURA primary key (idCultura)
);

/*==============================================================*/
/* Index: CULTURA_PK                                            */
/*==============================================================*/
create unique index CULTURA_PK on Cultura (
idCultura ASC
);

/*==============================================================*/
/* Index: INVESTIGADORCULTURA_FK                                */
/*==============================================================*/
create index INVESTIGADORCULTURA_FK on Cultura (
idInvestigador ASC
);

/*==============================================================*/
/* Table: HumidadeTemperatura                                   */
/*==============================================================*/
create table HumidadeTemperatura 
(
   dataMedicao          date                           not null,
   horaMedicao          time                           not null,
   valorMedicaoTemperatura decimal(8,2)                   not null,
   valorMedicaoHumidade decimal(8,2)                   not null,
   idMedicao            integer                        not null default (S_HumidadeTemperatura.nextval),
   constraint PK_HUMIDADETEMPERATURA primary key (idMedicao)
);

/*==============================================================*/
/* Index: HUMIDADETEMPERATURA_PK                                */
/*==============================================================*/
create unique index HUMIDADETEMPERATURA_PK on HumidadeTemperatura (
idMedicao ASC
);

/*==============================================================*/
/* Table: Investigador                                          */
/*==============================================================*/
create table Investigador 
(
   idInvestigador       integer                        not null default (S_Investigador.nextval),
   email                varchar(50)                    not null,
   nomeInvestigador     varchar(100)                   not null,
   deleted              smallint                       null,
   constraint PK_INVESTIGADOR primary key (idInvestigador)
);

/*==============================================================*/
/* Index: INVESTIGADOR_PK                                       */
/*==============================================================*/
create unique index INVESTIGADOR_PK on Investigador (
idInvestigador ASC
);

/*==============================================================*/
/* Table: LogCultura                                            */
/*==============================================================*/
create table LogCultura 
(
   idCultura            integer                        not null,
   idInvestigador       integer                        not null,
   nomeCultura          varchar(100)                   not null,
   limiteInferiorTemperatura decimal(8,2)                   not null,
   limiteSuperiorTemperatura decimal(8,2)                   not null,
   limiteInferiorHumidade decimal(8,2)                   not null,
   limiteSuperiorHumidade decimal(8,2)                   not null,
   utilizador           varchar(50)                    not null,
   operacao             char(1)                        not null,
   dataOperacao         timestamp                      not null,
   idLogCultura         integer                        not null default (S_LogCultura.nextval),
   constraint PK_LOGCULTURA primary key (idLogCultura)
);

/*==============================================================*/
/* Index: LOGCULTURA_PK                                         */
/*==============================================================*/
create unique index LOGCULTURA_PK on LogCultura (
idLogCultura ASC
);

/*==============================================================*/
/* Table: LogInvestigador                                       */
/*==============================================================*/
create table LogInvestigador 
(
   idInvestigador       integer                        not null,
   email                varchar(50)                    not null,
   nomeInvestigador     varchar(100)                   not null,
   utilizador           varchar(50)                    not null,
   operacao             char(1)                        not null,
   dataOperacao         timestamp                      not null,
   idLogInvestigador    integer                        not null default (S_LogInvestigador.nextval),
   constraint PK_LOGINVESTIGADOR primary key (idLogInvestigador)
);

/*==============================================================*/
/* Index: LOGINVESTIGADOR_PK                                    */
/*==============================================================*/
create unique index LOGINVESTIGADOR_PK on LogInvestigador (
idLogInvestigador ASC
);

/*==============================================================*/
/* Table: LogMedicoes                                           */
/*==============================================================*/
create table LogMedicoes 
(
   idCultura            integer                        not null,
   idVariavel           integer                        not null,
   numeroMedicao        integer                        not null,
   dataMedicao          date                           not null,
   horaMedicao          time                           not null,
   utilizador           varchar(50)                    not null,
   operacao             char(1)                        not null,
   dataOperacao         timestamp                      not null,
   idLogMedicoes        integer                        not null default (S_LogMedicoes.nextval),
   constraint PK_LOGMEDICOES primary key (idLogMedicoes)
);

/*==============================================================*/
/* Index: LOGMEDICOES_PK                                        */
/*==============================================================*/
create unique index LOGMEDICOES_PK on LogMedicoes (
idLogMedicoes ASC
);

/*==============================================================*/
/* Table: LogSelect                                             */
/*==============================================================*/
create table LogSelect 
(
   idLogSelect          integer                        not null default (S_LogSelect.nextval),
   comandoSelect        varchar(1024)                  not null,
   utilizador           varchar(50)                    not null,
   operacao             char(1)                        not null,
   dataOperacao         timestamp                      not null,
   constraint PK_LOGSELECT primary key (idLogSelect)
);

/*==============================================================*/
/* Index: LOGSELECT_PK                                          */
/*==============================================================*/
create unique index LOGSELECT_PK on LogSelect (
idLogSelect ASC
);

/*==============================================================*/
/* Table: LogVariaveis                                          */
/*==============================================================*/
create table LogVariaveis 
(
   idVariavel           integer                        not null,
   nomeVariavel         varchar(100)                   not null,
   utilizador           varchar(50)                    not null,
   operacao             char(1)                        not null,
   dataOperacao         timestamp                      not null,
   idLogVariaveis       integer                        not null default (S_LogVariaveis.nextval),
   constraint PK_LOGVARIAVEIS primary key (idLogVariaveis)
);

/*==============================================================*/
/* Index: LOGVARIAVEIS_PK                                       */
/*==============================================================*/
create unique index LOGVARIAVEIS_PK on LogVariaveis (
idLogVariaveis ASC
);

/*==============================================================*/
/* Table: LogVariaveisMedidas                                   */
/*==============================================================*/
create table LogVariaveisMedidas 
(
   idCultura            integer                        not null,
   idVariavel           integer                        not null,
   limiteInferior       decimal(8,2)                   not null,
   limiteSuperior       decimal(8,2)                   not null,
   utilizador           varchar(50)                    not null,
   operacao             char(1)                        null,
   dataOperacao         timestamp                      null,
   idLogVariaveisMedidas integer                        not null default (S_LogVariaveisMedidas.nextval),
   constraint PK_LOGVARIAVEISMEDIDAS primary key (idLogVariaveisMedidas)
);

/*==============================================================*/
/* Index: LOGVARIAVEISMEDIDAS_PK                                */
/*==============================================================*/
create unique index LOGVARIAVEISMEDIDAS_PK on LogVariaveisMedidas (
idLogVariaveisMedidas ASC
);

/*==============================================================*/
/* Table: Medicoes                                              */
/*==============================================================*/
create table Medicoes 
(
   idCultura            integer                        not null,
   idVariavel           integer                        not null,
   numeroMedicao        integer                        not null default (S_Medicoes.nextval),
   dataMedicao          date                           not null,
   horaMedicao          time                           not null,
   deleted              smallint                       null,
   constraint PK_MEDICOES primary key (idCultura, idVariavel, numeroMedicao)
);

/*==============================================================*/
/* Index: MEDICOES_PK                                           */
/*==============================================================*/
create unique index MEDICOES_PK on Medicoes (
idCultura ASC,
idVariavel ASC,
numeroMedicao ASC
);

/*==============================================================*/
/* Index: MEDICOESVARMEDIDAS_FK                                 */
/*==============================================================*/
create index MEDICOESVARMEDIDAS_FK on Medicoes (
idCultura ASC,
idVariavel ASC
);

/*==============================================================*/
/* Table: Variaveis                                             */
/*==============================================================*/
create table Variaveis 
(
   idVariavel           integer                        not null default (S_Variaveis.nextval),
   nomeVariavel         varchar(100)                   not null,
   deleted              smallint                       null,
   constraint PK_VARIAVEIS primary key (idVariavel)
);

/*==============================================================*/
/* Index: VARIAVEIS_PK                                          */
/*==============================================================*/
create unique index VARIAVEIS_PK on Variaveis (
idVariavel ASC
);

/*==============================================================*/
/* Table: VariaveisMedidas                                      */
/*==============================================================*/
create table VariaveisMedidas 
(
   idCultura            integer                        not null,
   idVariavel           integer                        not null,
   limiteInferior       decimal(8,2)                   not null,
   limiteSuperior       decimal(8,2)                   not null,
   deleted              smallint                       null,
   constraint PK_VARIAVEISMEDIDAS primary key (idCultura, idVariavel)
);

/*==============================================================*/
/* Index: VARIAVEISMEDIDAS_PK                                   */
/*==============================================================*/
create unique index VARIAVEISMEDIDAS_PK on VariaveisMedidas (
idCultura ASC,
idVariavel ASC
);

/*==============================================================*/
/* Index: VARIAVEISCULTURA_FK                                   */
/*==============================================================*/
create index VARIAVEISCULTURA_FK on VariaveisMedidas (
idVariavel ASC
);

/*==============================================================*/
/* Index: VARIAVEISCULTURA_FK2                                  */
/*==============================================================*/
create index VARIAVEISCULTURA_FK2 on VariaveisMedidas (
idCultura ASC
);

alter table Cultura
   add constraint FK_CULTURA_INVESTIGA_INVESTIG foreign key (idInvestigador)
      references Investigador (idInvestigador)
      on update restrict
      on delete restrict;

alter table Medicoes
   add constraint FK_MEDICOES_MEDICOESV_VARIAVEI foreign key (idCultura, idVariavel)
      references VariaveisMedidas (idCultura, idVariavel)
      on update restrict
      on delete restrict;

alter table VariaveisMedidas
   add constraint FK_VARIAVEI_VARIAVEIS_CULTURA foreign key (idCultura)
      references Cultura (idCultura)
      on update restrict
      on delete restrict;

alter table VariaveisMedidas
   add constraint FK_VARIAVEI_VARIAVEIS_VARIAVEI foreign key (idVariavel)
      references Variaveis (idVariavel)
      on update restrict
      on delete restrict;


create trigger tr_del_Cultura after delete order 1 on Cultura
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
            INSERT INTO LogCultura (idCultura,
                            idInvestigador,
                            nomeCultura,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            utilizador,
                            operacao,
                            dataOperacao)
            VALUES         (old_del.idCultura,
                            old_del.idInvestigador,
                            old_del.nomeCultura,
                            old_del.limiteInferiorTemperatura,
                            old_del.limiteSuperiorTemperatura,
                            old_del.limiteInferiorHumidade,
                            old_del.limiteSuperiorHumidade,
                            user_name(),
                            'D',
                            now() );
end;


create trigger tr_ins_Cultura after insert order 1 on Cultura
referencing new as new_ins for each row
begin 
 INSERT INTO LogCultura (idCultura,
                            idInvestigador,
                            nomeCultura,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            utilizador,
                            operacao,
                            dataOperacao)
            VALUES         (new_ins.idCultura,
                            new_ins.idInvestigador,
                            new_ins.nomeCultura,
                            new_ins.limiteInferiorTemperatura,
                            new_ins.limiteSuperiorTemperatura,
                            new_ins.limiteInferiorHumidade,
                            new_ins.limiteSuperiorHumidade,
                            user_name(),
                            'I',
                            now() );
end;


create trigger tr_upd_Cultura after update of idCultura,
                                         idInvestigador
order 1 on Cultura
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    
           INSERT INTO LogCultura (idCultura,
                            idInvestigador,
                            nomeCultura,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            utilizador,
                            operacao,
                            dataOperacao)
            VALUES         (new_upd.idCultura,
                            new_upd.idInvestigador,
                            new_upd.nomeCultura,
                            new_upd.limiteInferiorTemperatura,
                            new_upd.limiteSuperiorTemperatura,
                            new_upd.limiteInferiorHumidade,
                            new_upd.limiteSuperiorHumidade,
                            user_name(),
                            'U',
                            now() );
end;


create trigger tr_del_Investigador after delete order 1 on Investigador
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    insert into LogInvestigador (idInvestigador,
                                 email,
                                 nomeInvestigador,
                                 utilizador,
                                 operacao,
                                 dataOperacao)
            VALUES              (old_del.idInvestigador,
                                 old_del.email,
                                 old_del.nomeInvestigador,
                                 user_name(),
                                 'D',
                                 now() );
end;


create trigger tr_ins_Investigadior after insert order 1 on Investigador
referencing new as new_ins for each row
begin 
 INSERT INTO LogInvestigador (idInvestigador,
                                 email,
                                 nomeInvestigador,
                                 utilizador,
                                 operacao,
                                 dataOperacao)
    VALUES                      (new_ins.idInvestigador,
                                 new_ins.email,
                                 new_ins.nomeInvestigador,
                                 user_name(),
                                 'I',
                                 now() );
end;


create trigger tr_upd_Investigador after update of idInvestigador
order 1 on Investigador
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    insert into LogInvestigador (idInvestigador,
                                 email,
                                 nomeInvestigador,
                                 utilizador,
                                 operacao,
                                 dataOperacao)
            VALUES              (new_upd.idInvestigador,
                                 new_upd.email,
                                 new_upd.nomeInvestigador,
                                 user_name(),
                                 'U',
                                 now());
end;


create trigger tr_del_Medicoes after delete order 1 on Medicoes
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogMedicoes			(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataMedicao,
                                     horaMedicao,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (old_del.idCultura,
                                     old_del.idVariavel,
                                     old_del.numeroMedicao,
                                     old_del.dataMedicao,
                                     old_del.horaMedicao,
                                     user_name(),
                                     'D',
                                     now() );    
end;


create trigger tr_ins_Medicoes after insert order 1 on Medicoes
referencing new as new_ins for each row
begin 
 INSERT INTO LogMedicoes 			(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataMedicao,
                                     horaMedicao,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_ins.idCultura,
                                     new_ins.idVariavel,
                                     new_ins.numeroMedicao,
                                     new_ins.dataMedicao,
                                     new_ins.horaMedicao,
                                     user_name(),
                                     'I',
                                     now() );
end;


create trigger tr_upd_Medicoes after update of idCultura,
                                         idVariavel,
                                         numeroMedicao
order 1 on Medicoes
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogMedicoes 		(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataMedicao,
                                     horaMedicao,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_upd.idCultura,
                                     new_upd.idVariavel,
                                     new_upd.numeroMedicao,
                                     new_upd.dataMedicao,
                                     new_upd.horaMedicao,
                                     user_name(),
                                     'U',
                                     now() );    
end;


create trigger tr_del_Variaveis after delete order 1 on Variaveis
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
            INSERT INTO LogVariaveis (idVariavel,
                              nomeVariavel,
                              utilizador,
                              operacao,
                              dataOperacao)
            VALUES           (old_del.idVariavel,
                              old_del.nomeVariavel,
                              user_name(),
                              'D',
                              now() );
end;


create trigger tr_ins_Variaveis after insert order 1 on Variaveis
referencing new as new_ins for each row
begin 
 INSERT INTO LogVariaveis (idVariavel,
                              nomeVariavel,
                              utilizador,
                              operacao,
                              dataOperacao)
            VALUES           (new_ins.idVariavel,
                              new_ins.nomeVariavel,
                              user_name(),
                              'I',
                              now() );
end;


create trigger tr_upd_Variaveis after update of idVariavel
order 1 on Variaveis
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
            INSERT INTO LogVariaveis (idVariavel,
                              nomeVariavel,
                              utilizador,
                              operacao,
                              dataOperacao)
            VALUES           (new_upd.idVariavel,
                              new_upd.nomeVariavel,
                              user_name(),
                              'U',
                              now() );
end;


create trigger tr_del_VariaveisMedidas after delete order 1 on VariaveisMedidas
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
     INSERT INTO LogVariaveisMedidas (idCultura,
                                     idVariavel,
                                     limiteInferior,
                                     limiteSuperior,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (old_del.idCultura,
                                     old_del.idVariavel,
                                     old_del.limiteInferior,
                                     old_del.limiteSuperior,
                                     user_name(),
                                     'D',
                                     now() );
end;


create trigger tr_ins_VariaveisMedidas after insert order 1 on VariaveisMedidas
referencing new as new_ins for each row
begin 
INSERT INTO LogVariaveisMedidas (idCultura,
                                     idVariavel,
                                     limiteInferior,
                                     limiteSuperior,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_ins.idCultura,
                                     new_ins.idVariavel,
                                     new_ins.limiteInferior,
                                     new_ins.limiteSuperior,
                                     user_name(),
                                     'I',
                                     now() );
end;


create trigger tr_upd_VariaveisMedidas after update of idCultura,
                                         idVariavel
order 1 on VariaveisMedidas
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
        INSERT INTO LogVariaveisMedidas (idCultura,
                                     idVariavel,
                                     limiteInferior,
                                     limiteSuperior,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_upd.idCultura,
                                     new_upd.idVariavel,
                                     new_upd.limiteInferior,
                                     new_upd.limiteSuperior,
                                     user_name(),
                                     'U',
                                     now() );
end;

