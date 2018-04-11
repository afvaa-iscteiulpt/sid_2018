/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/04/2018 22:25:11                          */
/*==============================================================*/


drop table if exists LOGCONSULTAS;

drop table if exists LOGCULTURA;

drop table if exists LOGHUMIDADETEMPERATURA;

drop table if exists LOGINVESTIGADORES;

drop table if exists LOGMEDICOES;

drop table if exists LOGVARIAVEIS;

drop table if exists LOGVARIAVEISMEDIDAS;

/*==============================================================*/
/* Table: LOGCONSULTAS                                          */
/*==============================================================*/
create table LOGCONSULTAS
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
/* Table: LOGCULTURA                                            */
/*==============================================================*/
create table LOGCULTURA
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
/* Table: LOGHUMIDADETEMPERATURA                                */
/*==============================================================*/
create table LOGHUMIDADETEMPERATURA
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
/* Table: LOGINVESTIGADORES                                     */
/*==============================================================*/
create table LOGINVESTIGADORES
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
/* Table: LOGMEDICOES                                           */
/*==============================================================*/
create table LOGMEDICOES
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
/* Table: LOGVARIAVEIS                                          */
/*==============================================================*/
create table LOGVARIAVEIS
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
/* Table: LOGVARIAVEISMEDIDAS                                   */
/*==============================================================*/
create table LOGVARIAVEISMEDIDAS
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

