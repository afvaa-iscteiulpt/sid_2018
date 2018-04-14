/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     14/04/2018 10:11:30                          */
/*==============================================================*/
/* ----------------------- ----------*/
/* início das tabelas antigas -------*/
/* ----------------------- ----------*/
drop table if exists LOGCONSULTAS;

drop table if exists LOGCULTURA;

drop table if exists LOGHUMIDADETEMPERATURA;

drop table if exists LOGINVESTIGADORES;

drop table if exists LOGMEDICOES;

drop table if exists LOGVARIAVEIS;

drop table if exists LOGVARIAVEISMEDIDAS;
/* ----------------------- ----------*/
/* fim das tabelas antigas ----------*/
/* ----------------------- ----------*/

drop table if exists LOG_CONSULTAS;

drop table if exists LOG_CULTURA;

drop table if exists LOG_HUMIDADETEMPERATURA;

drop table if exists LOG_INVESTIGADORES;

drop table if exists LOG_MEDICOES;

drop table if exists LOG_VARIAVEIS;

drop table if exists LOG_VARIAVEISMEDIDAS;

/*==============================================================*/
/* Table: LOG_CONSULTAS                                         */
/*==============================================================*/
create table LOG_CONSULTAS
(
   IDLOG                int not null,
   DATELOG              date not null,
   TIME_LOG             time not null,
   TIPOLOG              char(1) not null,
   UTILIZADOR           char(100) not null,
   NOMECULTURA          char(100) not null,
   ACESSO               char(100) not null,
   primary key (IDLOG)
);

/*==============================================================*/
/* Table: LOG_CULTURA                                           */
/*==============================================================*/
create table LOG_CULTURA
(
   IDLOG                int not null,
   DATELOG              date not null,
   TIME_LOG             time not null,
   TIPOLOG              char(1) not null,
   IDCULTURA            int not null,
   NOMECULTURA          char(100) not null,
   LIMITEINFERIORTEMPERATURA int,
   LIMITESUPERIORTEMPERATURA int,
   LIMITEINFERIORHUMIDADE int,
   LIMITESUPERIORHUMIDADE int,
   EMAILINVESTIGADOR    varchar(50),
   COLUNAALTERADA       char(100),
   VALOR_ANTERIOR       char(100),
   VALOR_POSTERIOR      char(100),
   primary key (IDLOG)
);

/*==============================================================*/
/* Table: LOG_HUMIDADETEMPERATURA                               */
/*==============================================================*/
create table LOG_HUMIDADETEMPERATURA
(
   IDLOG                int not null,
   DATELOG              date not null,
   TIME_LOG             time not null,
   TIPOLOG              char(1) not null,
   VALORMEDICAOHUMIDADE decimal(8,2),
   VALORMEDICAOTEMPERATURA decimal(8,2),
   COLUNAALTERADA       char(100),
   VALOR_ANTERIOR       char(100),
   VALOR_POSTERIOR      char(100),
   primary key (IDLOG)
);

/*==============================================================*/
/* Table: LOG_INVESTIGADORES                                    */
/*==============================================================*/
create table LOG_INVESTIGADORES
(
   IDLOG                int not null,
   DATELOG              date not null,
   TIME_LOG             time not null,
   TIPOLOG              char(1) not null,
   EMAIL                char(50),
   NOMEINVESTIGADOR     char(100),
   COLUNAALTERADA       char(100),
   VALOR_ANTERIOR       char(100),
   VALOR_POSTERIOR      char(100),
   primary key (IDLOG)
);

/*==============================================================*/
/* Table: LOG_MEDICOES                                          */
/*==============================================================*/
create table LOG_MEDICOES
(
   IDLOG                int not null,
   DATELOG              date not null,
   TIME_LOG             time not null,
   TIPOLOG              char(1) not null,
   NUMEROMEDICAO        int,
   VALORMEDICAO         int,
   IDVARIAVEL           int,
   IDCULTURA            int,
   COLUNAALTERADA       char(100),
   VALOR_ANTERIOR       char(100),
   VALOR_POSTERIOR      char(100),
   primary key (IDLOG)
);

/*==============================================================*/
/* Table: LOG_VARIAVEIS                                         */
/*==============================================================*/
create table LOG_VARIAVEIS
(
   IDLOG                int not null,
   DATELOG              date not null,
   TIME_LOG             time not null,
   TIPOLOG              char(1) not null,
   IDVARIAVEL           int not null,
   NOMEVARIAVEL         char(100),
   COLUNAALTERADA       char(100),
   VALOR_ANTERIOR       char(100),
   VALOR_POSTERIOR      char(100),
   primary key (IDLOG)
);

/*==============================================================*/
/* Table: LOG_VARIAVEISMEDIDAS                                  */
/*==============================================================*/
create table LOG_VARIAVEISMEDIDAS
(
   IDLOG                int not null,
   DATELOG              date not null,
   TIME_LOG             time not null,
   TIPOLOG              char(1) not null,
   LIMITEINFERIOR       decimal(8,2),
   LIMITESUPERIOR       decimal(8,2),
   IDVARIAVEL           int not null,
   IDCULTURA            int not null,
   COLUNAALTERADA       char(100),
   VALOR_ANTERIOR       char(100),
   VALOR_POSTERIOR      char(100),
   primary key (IDLOG)
);

