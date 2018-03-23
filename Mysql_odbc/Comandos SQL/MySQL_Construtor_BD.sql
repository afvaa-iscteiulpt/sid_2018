/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/03/2018 19:06:34                          */
/*==============================================================*/


drop table if exists LogCultura;

drop table if exists LogHumidadeTemperatura;

drop table if exists LogInvestigador;

drop table if exists LogMedicoes;

drop table if exists LogSelect;

drop table if exists LogVariaveis;

drop table if exists LogVariaveisMedidas;

/*==============================================================*/
/* Table: LogCultura                                            */
/*==============================================================*/
create table LogCultura
(
   idCultura            int not null,
   IdInvestigador       int not null,
   nomeCultura          varchar(100) not null,
   limiteInferiorTemperatura decimal(8,2) not null,
   limiteSuperiorTemperatura decimal(8,2) not null,
   limiteInferiorHumidade decimal(8,2) not null,
   limiteSuperiorHumidade decimal(8,2) not null,
   deleted              bool not null,
   utilizador           varchar(50) not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogCultura         int not null,
   primary key (idLogCultura)
);

/*==============================================================*/
/* Table: LogHumidadeTemperatura                                */
/*==============================================================*/
create table LogHumidadeTemperatura
(
   dataHoraMedicao      timestamp not null,
   valorMedicaoTemperatura decimal(8,2) not null,
   valorMedicaoHumidade decimal(8,2) not null,
   idMedicao            bigint not null,
   primary key (idMedicao)
);

/*==============================================================*/
/* Table: LogInvestigador                                       */
/*==============================================================*/
create table LogInvestigador
(
   idInvestigador       int not null,
   email                varchar(50) not null,
   nomeInvestigador     varchar(100) not null,
   deleted              bool not null,
   utilizador           varchar(50) not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogInvestigador    int not null,
   primary key (idLogInvestigador)
);

/*==============================================================*/
/* Table: LogMedicoes                                           */
/*==============================================================*/
create table LogMedicoes
(
   idCultura            int not null,
   idVariavel           int not null,
   numeroMedicao        bigint not null,
   dataHoraMedicao      timestamp not null,
   valorMedicao         decimal(8,2) not null,
   deleted              bool not null,
   utilizador           varchar(50) not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogMedicoes        int not null,
   primary key (idLogMedicoes)
);

/*==============================================================*/
/* Table: LogSelect                                             */
/*==============================================================*/
create table LogSelect
(
   idLogSelect          int not null,
   comandoSelect        varchar(1024) not null,
   utilizador           varchar(50) not null,
   dataOperacao         timestamp not null,
   primary key (idLogSelect)
);

/*==============================================================*/
/* Table: LogVariaveis                                          */
/*==============================================================*/
create table LogVariaveis
(
   idVariavel           int not null,
   nomeVariavel         varchar(100) not null,
   deleted              bool,
   utilizador           varchar(50) not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogVariaveis       int not null,
   primary key (idLogVariaveis)
);

/*==============================================================*/
/* Table: LogVariaveisMedidas                                   */
/*==============================================================*/
create table LogVariaveisMedidas
(
   idCultura            int not null,
   idVariavel           int not null,
   limiteInferior       decimal(8,2) not null,
   limiteSuperior       decimal(8,2) not null,
   deleted              bool not null,
   utilizador           varchar(50) not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogVariaveisMedidas int not null,
   primary key (idLogVariaveisMedidas)
);

