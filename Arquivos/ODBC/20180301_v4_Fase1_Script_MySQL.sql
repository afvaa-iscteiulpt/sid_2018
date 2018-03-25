/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     01/03/2018 19:00:34                          */
/*==============================================================*/


drop table if exists LogCultura;

drop table if exists LogInvestigador;

drop table if exists LogMedicoes;

drop table if exists LogVariaveis;

drop table if exists LogVariaveisMedidas;

/*==============================================================*/
/* Table: LogCultura                                            */
/*==============================================================*/
create table LogCultura
(
   idCultura            int not null,
   nomeCultura          varchar(100) not null,
   limiteInferiorTemperatura decimal(8,2) not null,
   limiteSuperiorTemperatura decimal(8,2) not null,
   limiteInferiorHumidade decimal(8,2) not null,
   limiteSuperiorHumidade decimal(8,2) not null,
   operacao             char(1),
   dataOperacao         timestamp,
   emailInvestigador    varchar(50) not null,
   idLogCultura         int not null auto_increment,
   primary key (idLogCultura)
);

/*==============================================================*/
/* Table: LogInvestigador                                       */
/*==============================================================*/
create table LogInvestigador
(
   idInvestigador       int,
   email                varchar(50) not null,
   nomeInvestigador     varchar(100) not null,
   operacao             char(1),
   dataOperacao         timestamp,
   idLogInvestigador    int not null auto_increment,
   primary key (idLogInvestigador)
);

/*==============================================================*/
/* Table: LogMedicoes                                           */
/*==============================================================*/
create table LogMedicoes
(
   idCultura            int not null,
   idVariavel           int not null,
   numeroMedicao        int not null,
   dataMedicao          date not null,
   horaMedicao          time not null,
   operacao             char(1),
   dataOperacao         timestamp,
   idLogMedicoes        int not null auto_increment,
   primary key (idLogMedicoes)
);

/*==============================================================*/
/* Table: LogVariaveis                                          */
/*==============================================================*/
create table LogVariaveis
(
   idVariavel           int not null,
   nomeVariavel         varchar(100) not null,
   utilizador           varchar(50),
   operacao             char(1),
   dataOperacao         timestamp,
   idLogVariaveis       int not null auto_increment,
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
   operacao             char(1),
   dataOperacao         timestamp,
   limiteSuperior       decimal(8,2) not null,
   idLogVariaveisMedidas int not null auto_increment,
   primary key (idLogVariaveisMedidas)
);

