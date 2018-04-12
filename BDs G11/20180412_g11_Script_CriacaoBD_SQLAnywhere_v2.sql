/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     12/04/2018 22:13:20                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CULTURA_INVESTIGA_INVESTIG') then
    alter table CULTURA
       delete foreign key FK_CULTURA_INVESTIGA_INVESTIG
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEDICOES_VARIAVEIS_VARIVEIS') then
    alter table MEDICOES
       delete foreign key FK_MEDICOES_VARIAVEIS_VARIVEIS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VARIVEIS_CULTURA_CULTURA') then
    alter table VARIVEISMEDIDAS
       delete foreign key FK_VARIVEIS_CULTURA_CULTURA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VARIVEIS_VARIAVEIS_VARIAVEI') then
    alter table VARIVEISMEDIDAS
       delete foreign key FK_VARIVEIS_VARIAVEIS_VARIAVEI
end if;

drop index if exists CULTURA.INVESTIGADOR_FK;

drop index if exists CULTURA.CULTURA_PK;

drop table if exists CULTURA;

drop index if exists HUMIDADETEMPERATURA.HUMIDADETEMPERATURA_PK;

drop table if exists HUMIDADETEMPERATURA;

drop index if exists INVESTIGADOR.INVESTIGADOR_PK;

drop table if exists INVESTIGADOR;

drop index if exists LOGCONSULTAS.LOGCONSULTAS_PK;

drop table if exists LOGCONSULTAS;

drop index if exists LOGCULTURA.LOGCULTURA_PK;

drop table if exists LOGCULTURA;

drop index if exists LOGHUMIDADETEMPERATURA.LOGHUMIDADETEMPERATURA_PK;

drop table if exists LOGHUMIDADETEMPERATURA;

drop index if exists LOGINVESTIGADORES.LOGINVESTIGADORES_PK;

drop table if exists LOGINVESTIGADORES;

drop index if exists LOGMEDICOES.LOGMEDICOES_PK;

drop table if exists LOGMEDICOES;

drop index if exists LOGVARIAVEIS.LOGVARIAVEIS_PK;

drop table if exists LOGVARIAVEIS;

drop index if exists LOGVARIAVEISMEDIDAS.LOGVARIAVEISMEDIDAS_PK;

drop table if exists LOGVARIAVEISMEDIDAS;

drop index if exists MEDICOES.VARIAVEISMEDIDAS_FK;

drop index if exists MEDICOES.MEDICOES_PK;

drop table if exists MEDICOES;

drop index if exists VARIAVEIS.VARIAVEIS_PK;

drop table if exists VARIAVEIS;

drop index if exists VARIVEISMEDIDAS.CULTURA_FK;

drop index if exists VARIVEISMEDIDAS.VARIAVEIS_FK;

drop index if exists VARIVEISMEDIDAS.VARIVEISMEDIDAS_PK;

drop table if exists VARIVEISMEDIDAS;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_CULTURA') then
      drop sequence S_CULTURA
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_HUMIDADETEMPERATURA') then
      drop sequence S_HUMIDADETEMPERATURA
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LOGCONSULTAS') then
      drop sequence S_LOGCONSULTAS
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LOGCULTURA') then
      drop sequence S_LOGCULTURA
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LOGHUMIDADETEMPERATURA') then
      drop sequence S_LOGHUMIDADETEMPERATURA
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LOGINVESTIGADORES') then
      drop sequence S_LOGINVESTIGADORES
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LOGMEDICOES') then
      drop sequence S_LOGMEDICOES
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LOGVARIAVEIS') then
      drop sequence S_LOGVARIAVEIS
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_LOGVARIAVEISMEDIDAS') then
      drop sequence S_LOGVARIAVEISMEDIDAS
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_MEDICOES') then
      drop sequence S_MEDICOES
end if;

if exists(select 1 from sys.syssequence s
   where sequence_name='S_VARIAVEIS') then
      drop sequence S_VARIAVEIS
end if;

create sequence S_CULTURA;

create sequence S_HUMIDADETEMPERATURA;

create sequence S_LOGCONSULTAS;

create sequence S_LOGCULTURA;

create sequence S_LOGHUMIDADETEMPERATURA;

create sequence S_LOGINVESTIGADORES;

create sequence S_LOGMEDICOES;

create sequence S_LOGVARIAVEIS;

create sequence S_LOGVARIAVEISMEDIDAS;

create sequence S_MEDICOES;

create sequence S_VARIAVEIS;

/*==============================================================*/
/* Table: CULTURA                                               */
/*==============================================================*/
create table CULTURA 
(
   IDCULTURA            integer                        not null default autoincrement,
   NOMECULTURA          varchar(100)                   not null,
   LIMITEINFERIORTEMPERATURA decimal(4,2)                   null,
   LIMITESUPERIORTEMPERATURA decimal(4,2)                   null,
   LIMITEINFERIORHUMIDADE decimal(4,2)                   null,
   LIMITESUPERIORHUMIDADE decimal(4,2)                   null,
   EMAILINVESTIGADOR    varchar(50)                    null,
   constraint PK_CULTURA primary key (IDCULTURA)
);

/*==============================================================*/
/* Index: CULTURA_PK                                            */
/*==============================================================*/
create unique index CULTURA_PK on CULTURA (
IDCULTURA ASC
);

/*==============================================================*/
/* Index: INVESTIGADOR_FK                                       */
/*==============================================================*/
create index INVESTIGADOR_FK on CULTURA (
EMAILINVESTIGADOR ASC
);

/*==============================================================*/
/* Table: HUMIDADETEMPERATURA                                   */
/*==============================================================*/
create table HUMIDADETEMPERATURA 
(
   IDMEDICAO            integer                        not null default autoincrement,
   DATAMEDICAO          date                           not null,
   HORAMEDICAO          time                           not null,
   VALORMEDICAOTEMPERATURA decimal(8,2)                   null,
   VALORMEDICAOHUMIDADE decimal(8,2)                   null,
   constraint PK_HUMIDADETEMPERATURA primary key (IDMEDICAO)
);

/*==============================================================*/
/* Index: HUMIDADETEMPERATURA_PK                                */
/*==============================================================*/
create unique index HUMIDADETEMPERATURA_PK on HUMIDADETEMPERATURA (
IDMEDICAO ASC
);

/*==============================================================*/
/* Table: INVESTIGADOR                                          */
/*==============================================================*/
create table INVESTIGADOR 
(
   EMAIL                varchar(50)                    not null,
   NOMEINVESTIGADOR     varchar(100)                   not null,
   constraint PK_INVESTIGADOR primary key (EMAIL)
);

/*==============================================================*/
/* Index: INVESTIGADOR_PK                                       */
/*==============================================================*/
create unique index INVESTIGADOR_PK on INVESTIGADOR (
EMAIL ASC
);

/*==============================================================*/
/* Table: LOGCONSULTAS                                          */
/*==============================================================*/
create table LOGCONSULTAS 
(
   IDLOG                integer                        not null default autoincrement,
   DATELOG              date                           not null,
   TIME_LOG             time                           not null,
   TIPOLOG              char(1)                        not null,
   UTILIZADOR           char(100)                      not null,
   NOMECULTURA          char(100)                      not null,
   ACESSO               char(100)                      not null,
   constraint PK_LOGCONSULTAS primary key (IDLOG)
);

/*==============================================================*/
/* Index: LOGCONSULTAS_PK                                       */
/*==============================================================*/
create unique index LOGCONSULTAS_PK on LOGCONSULTAS (
IDLOG ASC
);

/*==============================================================*/
/* Table: LOGCULTURA                                            */
/*==============================================================*/
create table LOGCULTURA 
(
   IDLOG                integer                        not null default autoincrement,
   DATELOG              date                           not null,
   TIME_LOG             time                           not null,
   TIPOLOG              char(1)                        not null,
   IDCULTURA            integer                        not null,
   NOMECULTURA          char(100)                      not null,
   LIMITEINFERIORTEMPERATURA integer                        null,
   LIMITESUPERIORTEMPERATURA integer                        null,
   LIMITEINFERIORHUMIDADE integer                        null,
   LIMITESUPERIORHUMIDADE integer                        null,
   EMAILINVESTIGADOR    varchar(50)                    null,
   COLUNAALTERADA       char(100)                      null,
   VALOR_ANTERIOR       char(100)                      null,
   VALOR_POSTERIOR      char(100)                      null,
   constraint PK_LOGCULTURA primary key (IDLOG)
);

/*==============================================================*/
/* Index: LOGCULTURA_PK                                         */
/*==============================================================*/
create unique index LOGCULTURA_PK on LOGCULTURA (
IDLOG ASC
);

/*==============================================================*/
/* Table: LOGHUMIDADETEMPERATURA                                */
/*==============================================================*/
create table LOGHUMIDADETEMPERATURA 
(
   IDLOG                integer                        not null default autoincrement,
   DATELOG              date                           not null,
   TIME_LOG             time                           not null,
   TIPOLOG              char(1)                        not null,
   VALORMEDICAOHUMIDADE decimal(8,2)                   null,
   VALORMEDICAOTEMPERATURA decimal(8,2)                   null,
   COLUNAALTERADA       char(100)                      null,
   VALOR_ANTERIOR       char(100)                      null,
   VALOR_POSTERIOR      char(100)                      null,
   constraint PK_LOGHUMIDADETEMPERATURA primary key (IDLOG)
);

/*==============================================================*/
/* Index: LOGHUMIDADETEMPERATURA_PK                             */
/*==============================================================*/
create unique index LOGHUMIDADETEMPERATURA_PK on LOGHUMIDADETEMPERATURA (
IDLOG ASC
);

/*==============================================================*/
/* Table: LOGINVESTIGADORES                                     */
/*==============================================================*/
create table LOGINVESTIGADORES 
(
   IDLOG                integer                        not null default autoincrement,
   DATELOG              date                           not null,
   TIME_LOG             time                           not null,
   TIPOLOG              char(1)                        not null,
   EMAIL                char(50)                       null,
   NOMEINVESTIGADOR     char(100)                      null,
   COLUNAALTERADA       char(100)                      null,
   VALOR_ANTERIOR       char(100)                      null,
   VALOR_POSTERIOR      char(100)                      null,
   constraint PK_LOGINVESTIGADORES primary key (IDLOG)
);

/*==============================================================*/
/* Index: LOGINVESTIGADORES_PK                                  */
/*==============================================================*/
create unique index LOGINVESTIGADORES_PK on LOGINVESTIGADORES (
IDLOG ASC
);

/*==============================================================*/
/* Table: LOGMEDICOES                                           */
/*==============================================================*/
create table LOGMEDICOES 
(
   IDLOG                integer                        not null default autoincrement,
   DATELOG              date                           not null,
   TIME_LOG             time                           not null,
   TIPOLOG              char(1)                        not null,
   NUMEROMEDICAO        integer                        null,
   VALORMEDICAO         integer                        null,
   IDVARIAVEL           integer                        null,
   IDCULTURA            integer                        null,
   COLUNAALTERADA       char(100)                      null,
   VALOR_ANTERIOR       char(100)                      null,
   VALOR_POSTERIOR      char(100)                      null,
   constraint PK_LOGMEDICOES primary key (IDLOG)
);

/*==============================================================*/
/* Index: LOGMEDICOES_PK                                        */
/*==============================================================*/
create unique index LOGMEDICOES_PK on LOGMEDICOES (
IDLOG ASC
);

/*==============================================================*/
/* Table: LOGVARIAVEIS                                          */
/*==============================================================*/
create table LOGVARIAVEIS 
(
   IDLOG                integer                        not null default autoincrement,
   DATELOG              date                           not null,
   TIME_LOG             time                           not null,
   TIPOLOG              char(1)                        not null,
   IDVARIAVEL           integer                        not null,
   NOMEVARIAVEL         char(100)                      null,
   COLUNAALTERADA       char(100)                      null,
   VALOR_ANTERIOR       char(100)                      null,
   VALOR_POSTERIOR      char(100)                      null,
   constraint PK_LOGVARIAVEIS primary key (IDLOG)
);

/*==============================================================*/
/* Index: LOGVARIAVEIS_PK                                       */
/*==============================================================*/
create unique index LOGVARIAVEIS_PK on LOGVARIAVEIS (
IDLOG ASC
);

/*==============================================================*/
/* Table: LOGVARIAVEISMEDIDAS                                   */
/*==============================================================*/
create table LOGVARIAVEISMEDIDAS 
(
   IDLOG                integer                        not null default autoincrement,
   DATELOG              date                           not null,
   TIME_LOG             time                           not null,
   TIPOLOG              char(1)                        not null,
   LIMITEINFERIOR       decimal(8,2)                   null,
   LIMITESUPERIOR       decimal(8,2)                   null,
   IDVARIAVEL           integer                        not null,
   IDCULTURA            integer                        not null,
   COLUNAALTERADA       char(100)                      null,
   VALOR_ANTERIOR       char(100)                      null,
   VALOR_POSTERIOR      char(100)                      null,
   constraint PK_LOGVARIAVEISMEDIDAS primary key (IDLOG)
);

/*==============================================================*/
/* Index: LOGVARIAVEISMEDIDAS_PK                                */
/*==============================================================*/
create unique index LOGVARIAVEISMEDIDAS_PK on LOGVARIAVEISMEDIDAS (
IDLOG ASC
);

/*==============================================================*/
/* Table: MEDICOES                                              */
/*==============================================================*/
create table MEDICOES 
(
   NUMEROMEDICAO        integer                        not null default autoincrement,
   DATAMEDICAO          date                           not null,
   HORAMEDICAO          time                           not null,
   VALORMEDICAO         decimal(8,2)                   not null,
   IDVARIAVEL           integer                        not null,
   IDCULTURA            integer                        not null,
   constraint PK_MEDICOES primary key (NUMEROMEDICAO)
);

/*==============================================================*/
/* Index: MEDICOES_PK                                           */
/*==============================================================*/
create unique index MEDICOES_PK on MEDICOES (
NUMEROMEDICAO ASC
);

/*==============================================================*/
/* Index: VARIAVEISMEDIDAS_FK                                   */
/*==============================================================*/
create index VARIAVEISMEDIDAS_FK on MEDICOES (
IDCULTURA ASC,
IDVARIAVEL ASC
);

/*==============================================================*/
/* Table: VARIAVEIS                                             */
/*==============================================================*/
create table VARIAVEIS 
(
   IDVARIAVEL           integer                        not null default autoincrement,
   NOMEVARIAVEL         varchar(100)                   not null,
   constraint PK_VARIAVEIS primary key (IDVARIAVEL)
);

/*==============================================================*/
/* Index: VARIAVEIS_PK                                          */
/*==============================================================*/
create unique index VARIAVEIS_PK on VARIAVEIS (
IDVARIAVEL ASC
);

/*==============================================================*/
/* Table: VARIVEISMEDIDAS                                       */
/*==============================================================*/
create table VARIVEISMEDIDAS 
(
   LIMITEINFERIOR       decimal(8,2)                   not null,
   LIMITESUPERIOR       decimal(8,2)                   not null,
   IDCULTURA            integer                        not null,
   IDVARIAVEL           integer                        not null,
   constraint PK_VARIVEISMEDIDAS primary key (IDCULTURA, IDVARIAVEL)
);

/*==============================================================*/
/* Index: VARIVEISMEDIDAS_PK                                    */
/*==============================================================*/
create unique index VARIVEISMEDIDAS_PK on VARIVEISMEDIDAS (
IDCULTURA ASC,
IDVARIAVEL ASC
);

/*==============================================================*/
/* Index: VARIAVEIS_FK                                          */
/*==============================================================*/
create index VARIAVEIS_FK on VARIVEISMEDIDAS (
IDVARIAVEL ASC
);

/*==============================================================*/
/* Index: CULTURA_FK                                            */
/*==============================================================*/
create index CULTURA_FK on VARIVEISMEDIDAS (
IDCULTURA ASC
);

alter table CULTURA
   add constraint FK_CULTURA_INVESTIGA_INVESTIG foreign key (EMAILINVESTIGADOR)
      references INVESTIGADOR (EMAIL)
      on update set null
      on delete set null;

alter table MEDICOES
   add constraint FK_MEDICOES_VARIAVEIS_VARIVEIS foreign key (IDCULTURA, IDVARIAVEL)
      references VARIVEISMEDIDAS (IDCULTURA, IDVARIAVEL)
      on update cascade
      on delete cascade;

alter table VARIVEISMEDIDAS
   add constraint FK_VARIVEIS_CULTURA_CULTURA foreign key (IDCULTURA)
      references CULTURA (IDCULTURA)
      on update cascade
      on delete cascade;

alter table VARIVEISMEDIDAS
   add constraint FK_VARIVEIS_VARIAVEIS_VARIAVEI foreign key (IDVARIAVEL)
      references VARIAVEIS (IDVARIAVEL)
      on update cascade
      on delete cascade;

