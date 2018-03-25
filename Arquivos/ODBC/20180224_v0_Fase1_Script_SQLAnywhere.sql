/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     24/02/2018 09:02:31                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CULTURA_ASSOCIATI_INVESTIG') then
    alter table Cultura
       delete foreign key FK_CULTURA_ASSOCIATI_INVESTIG
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEDICOES_ASSOCIATI_VARIAVEI') then
    alter table Medicoes
       delete foreign key FK_MEDICOES_ASSOCIATI_VARIAVEI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VARIAVEI_ASSOCIATI_CULTURA') then
    alter table VariaveisMedidas
       delete foreign key FK_VARIAVEI_ASSOCIATI_CULTURA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VARIAVEI_ASSOCIATI_VARIAVEI') then
    alter table VariaveisMedidas
       delete foreign key FK_VARIAVEI_ASSOCIATI_VARIAVEI
end if;

drop index if exists Cultura.ASSOCIATION1_FK;

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

drop index if exists LogVariaveis.LOGVARIAVEIS_PK;

drop table if exists LogVariaveis;

drop index if exists LogVariaveisMedidas.LOGVARIAVEISMEDIDAS_PK;

drop table if exists LogVariaveisMedidas;

drop index if exists Medicoes.ASSOCIATION3_FK;

drop index if exists Medicoes.MEDICOES_PK;

drop table if exists Medicoes;

drop index if exists Variaveis.VARIAVEIS_PK;

drop table if exists Variaveis;

drop index if exists VariaveisMedidas.ASSOCIATION2_FK2;

drop index if exists VariaveisMedidas.ASSOCIATION2_FK;

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

create sequence S_LogCultura;

create sequence S_LogInvestigador;

create sequence S_LogMedicoes;

create sequence S_LogVariaveis;

create sequence S_LogVariaveisMedidas;

create sequence S_Medicoes;

create sequence S_Variaveis;

/*==============================================================*/
/* Table: Cultura                                               */
/*==============================================================*/
create table Cultura 
(
   idCultura            integer                        not null default autoincrement,
   email                varchar(50)                    not null,
   nomeCultura          varchar(100)                   not null,
   limiteInferiorTemperatura decimal(8,2)                   not null,
   limiteSuperiorTemperatura decimal(8,2)                   not null,
   limiteInferiorHumidade decimal(8,2)                   not null,
   limiteSuperiorHumidade decimal(8,2)                   not null,
   constraint PK_CULTURA primary key (idCultura)
);

/*==============================================================*/
/* Index: CULTURA_PK                                            */
/*==============================================================*/
create unique index CULTURA_PK on Cultura (
idCultura ASC
);

/*==============================================================*/
/* Index: ASSOCIATION1_FK                                       */
/*==============================================================*/
create index ASSOCIATION1_FK on Cultura (
email ASC
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
   email                varchar(50)                    not null,
   nomeInvestigador     varchar(100)                   not null,
   constraint PK_INVESTIGADOR primary key (email)
);

/*==============================================================*/
/* Index: INVESTIGADOR_PK                                       */
/*==============================================================*/
create unique index INVESTIGADOR_PK on Investigador (
email ASC
);

/*==============================================================*/
/* Table: LogCultura                                            */
/*==============================================================*/
create table LogCultura 
(
   idCultura            integer                        not null,
   nomeCultura          varchar(100)                   not null,
   limiteInferiorTemperatura decimal(8,2)                   not null,
   limiteSuperiorTemperatura decimal(8,2)                   not null,
   limiteInferiorHumidade decimal(8,2)                   not null,
   limiteSuperiorHumidade decimal(8,2)                   not null,
   emailInvestigador    varchar(50)                    not null,
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
   email                varchar(50)                    not null,
   nomeInvestigador     varchar(100)                   not null,
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
/* Table: LogVariaveis                                          */
/*==============================================================*/
create table LogVariaveis 
(
   idVariavel           integer                        not null,
   nomeVariavel         varchar(100)                   not null,
   utilizador           varchar(50)                    null,
   operacao             char(1)                        null,
   dataOperacao         timestamp                      null,
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
   numeroMedicao        integer                        not null default autoincrement,
   dataMedicao          date                           not null,
   horaMedicao          time                           not null,
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
/* Index: ASSOCIATION3_FK                                       */
/*==============================================================*/
create index ASSOCIATION3_FK on Medicoes (
idCultura ASC,
idVariavel ASC
);

/*==============================================================*/
/* Table: Variaveis                                             */
/*==============================================================*/
create table Variaveis 
(
   idVariavel           integer                        not null default autoincrement,
   nomeVariavel         varchar(100)                   not null,
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
/* Index: ASSOCIATION2_FK                                       */
/*==============================================================*/
create index ASSOCIATION2_FK on VariaveisMedidas (
idVariavel ASC
);

/*==============================================================*/
/* Index: ASSOCIATION2_FK2                                      */
/*==============================================================*/
create index ASSOCIATION2_FK2 on VariaveisMedidas (
idCultura ASC
);

alter table Cultura
   add constraint FK_CULTURA_ASSOCIATI_INVESTIG foreign key (email)
      references Investigador (email)
      on update restrict
      on delete restrict;

alter table Medicoes
   add constraint FK_MEDICOES_ASSOCIATI_VARIAVEI foreign key (idCultura, idVariavel)
      references VariaveisMedidas (idCultura, idVariavel)
      on update restrict
      on delete restrict;

alter table VariaveisMedidas
   add constraint FK_VARIAVEI_ASSOCIATI_CULTURA foreign key (idCultura)
      references Cultura (idCultura)
      on update restrict
      on delete restrict;

alter table VariaveisMedidas
   add constraint FK_VARIAVEI_ASSOCIATI_VARIAVEI foreign key (idVariavel)
      references Variaveis (idVariavel)
      on update restrict
      on delete restrict;

