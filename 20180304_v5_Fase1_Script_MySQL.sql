/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     04/03/2018 21:29:16                          */
/*==============================================================*/


drop table if exists LogCultura;

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
   idInvestigador       int not null,
   nomeCultura          varchar(100) not null,
   limiteInferiorTemperatura decimal(8,2) not null,
   limiteSuperiorTemperatura decimal(8,2) not null,
   limiteInferiorHumidade decimal(8,2) not null,
   limiteSuperiorHumidade decimal(8,2) not null,
   utilizador           int not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogCultura         bigint not null auto_increment,
   primary key (idLogCultura)
);

/*==============================================================*/
/* Table: LogInvestigador                                       */
/*==============================================================*/
create table LogInvestigador
(
   idInvestigador       int not null,
   email                varchar(50) not null,
   nomeInvestigador     varchar(100) not null,
   utilizador           int not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogInvestigador    bigint not null auto_increment,
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
   dataMedicao          date not null,
   horaMedicao          time not null,
   utilizador           int not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogMedicoes        bigint not null auto_increment,
   primary key (idLogMedicoes)
);

/*==============================================================*/
/* Table: LogSelect                                             */
/*==============================================================*/
create table LogSelect
(
   idLogSelect          bigint not null auto_increment,
   comandoSelect        varchar(1024) not null,
   utilizador           int not null,
   operacao             char(1) not null,
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
   utilizador           int not null,
   operacao             char(1) not null,
   dataOperacao         timestamp not null,
   idLogVariaveis       bigint not null auto_increment,
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
   utilizador           int not null,
   operacao             char(1),
   dataOperacao         timestamp,
   idLogVariaveisMedidas bigint not null auto_increment,
   primary key (idLogVariaveisMedidas)
);

