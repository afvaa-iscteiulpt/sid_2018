/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     15/04/2018 11:10:14                          */
/*==============================================================*/


drop trigger if exists Log_Create_Cultura;

drop trigger if exists Log_Create_HumidadeTemperatura;

drop trigger if exists Log_Create_Investigador;

drop trigger if exists Log_Create_Medicao;

drop trigger if exists Log_Create_VariaveisMedidas;

drop trigger if exists Log_Create_Variavel;

drop trigger if exists Log_Delete_Cultura;

drop trigger if exists Log_Delete_HumidadeTemperatura;

drop trigger if exists Log_Delete_Investigador;

drop trigger if exists Log_Delete_Medicao;

drop trigger if exists Log_Delete_VariaveisMedidas;

drop trigger if exists Log_Delete_Variavel;

drop trigger if exists Log_Update_Cultura;

drop trigger if exists Log_Update_HumidadeTemperatura;

drop trigger if exists Log_Update_Investigador;

drop trigger if exists Log_Update_Medicao;

drop trigger if exists Log_Update_VariaveisMedidas;

drop trigger if exists Log_Update_Variavel;



CREATE TRIGGER "Log_Create_Cultura" AFTER INSERT
ORDER 1 ON "DBA"."CULTURA"
REFERENCING NEW AS new_ins
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO Log_Cultura (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            IDCULTURA,
                            NOMECULTURA,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            EMAILINVESTIGADOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'I',
                            new_ins.IDCULTURA,
                            new_ins.NOMECULTURA,
                            new_ins.limiteInferiorTemperatura,
                            new_ins.limiteSuperiorTemperatura,
                            new_ins.limiteInferiorHumidade,
                            new_ins.limiteSuperiorHumidade,
                            new_ins.EMAILINVESTIGADOR,
                            /*user_name(),*/);
END;


CREATE TRIGGER "Log_Create_HumidadeTemperatura" AFTER INSERT
ORDER 1 ON "DBA"."HUMIDADETEMPERATURA"
REFERENCING NEW AS new_ins
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO Log_HumidadeTemperatura (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            VALORMEDICAOHUMIDADE,
                            VALORMEDICAOTEMPERATURA)

            VALUES         (date(now()),
                            datetime(now()),
                            'I',
                            new_ins.VALORMEDICAOHUMIDADE,
                            new_ins.VALORMEDICAOTEMPERATURA,
                            /*user_name(),*/);
END;


CREATE TRIGGER "Log_Create_Investigador" AFTER INSERT
ORDER 1 ON "DBA"."INVESTIGADOR"
REFERENCING NEW AS new_ins
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_INVESTIGADORES (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                EMAIL,
                                NOMEINVESTIGADOR)
    VALUES                      (date(now()),
                                datetime(now()),
                                'I',
                                 new_ins.EMAIL,
                                 new_ins.NOMEINVESTIGADOR);
END;

CREATE TRIGGER "Log_Create_Medicao" AFTER INSERT
ORDER 1 ON "DBA"."MEDICOES"
REFERENCING NEW AS new_ins
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_MEDICOES (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                NUMEROMEDICAO,
                                VALORMEDICAO,
                                IDVARIAVEL,
                                IDCULTURA)
    VALUES                      (date(now()),
                                datetime(now()),
                                'I',
                                 new_ins.NUMEROMEDICAO,
                                 new_ins.VALORMEDICAO,
                                 new_ins.IDVARIAVEL,
                                 new_ins.IDCULTURA);
END;


CREATE TRIGGER "Log_Create_VariaveisMedidas" AFTER INSERT
ORDER 1 ON "DBA"."VARIAVEISMEDIDAS"
REFERENCING NEW AS new_ins
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_VARIAVEISMEDIDAS (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                LIMITEINFERIOR,
                                LIMITESUPERIOR,
                                IDVARIAVEL,
                                IDCULTURA)
    VALUES                      (date(now()),
                                datetime(now()),
                                'I',
                                 new_ins.LIMITEINFERIOR,
                                 new_ins.LIMITESUPERIOR,
                                 new_ins.IDVARIAVEL,
                                 new_ins.IDCULTURA);
END;


CREATE TRIGGER "Log_Create_Variavel" AFTER INSERT
ORDER 1 ON "DBA"."VARIAVEIS"
REFERENCING NEW AS new_ins
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_VARIAVEIS (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                IDVARIAVEL,
                                NOMEVARIAVEL)
    VALUES                      (date(now()),
                                datetime(now()),
                                'I',
                                 new_ins.IDVARIAVEL,
                                 new_ins.NOMEVARIAVEL);
END;


CREATE TRIGGER "Log_Delete_Cultura" AFTER DELETE
ORDER 1 ON "DBA"."CULTURA"
REFERENCING OLD AS old_del
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO Log_Cultura (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            IDCULTURA,
                            NOMECULTURA,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            EMAILINVESTIGADOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'D',
                            old_del.IDCULTURA,
                            old_del.NOMECULTURA,
                            old_del.limiteInferiorTemperatura,
                            old_del.limiteSuperiorTemperatura,
                            old_del.limiteInferiorHumidade,
                            old_del.limiteSuperiorHumidade,
                            old_del.EMAILINVESTIGADOR,
                            /*user_name(),*/);
END;



CREATE TRIGGER "Log_Delete_HumidadeTemperatura" AFTER DELETE
ORDER 1 ON "DBA"."HUMIDADETEMPERATURA"
REFERENCING OLD AS old_del
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO Log_HumidadeTemperatura (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            VALORMEDICAOHUMIDADE,
                            VALORMEDICAOTEMPERATURA)

            VALUES         (date(now()),
                            datetime(now()),
                            'D',
                            old_del.VALORMEDICAOHUMIDADE,
                            old_del.VALORMEDICAOTEMPERATURA,
                            /*user_name(),*/);
END;


CREATE TRIGGER "Log_Delete_Investigador" AFTER DELETE
ORDER 1 ON "DBA"."INVESTIGADOR"
REFERENCING OLD AS old_del
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_INVESTIGADORES (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                EMAIL,
                                NOMEINVESTIGADOR)
    VALUES                      (date(now()),
                                datetime(now()),
                                'D',
                                 old_del.EMAIL,
                                 old_del.NOMEINVESTIGADOR);
END;


CREATE TRIGGER "Log_Delete_Medicao" AFTER DELETE
ORDER 1 ON "DBA"."MEDICOES"
REFERENCING OLD AS old_del
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_MEDICOES (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                NUMEROMEDICAO,
                                VALORMEDICAO,
                                IDVARIAVEL,
                                IDCULTURA)
    VALUES                      (date(now()),
                                datetime(now()),
                                'D',
                                 old_del.NUMEROMEDICAO,
                                 old_del.VALORMEDICAO,
                                 old_del.IDVARIAVEL,
                                 old_del.IDCULTURA);
END;


CREATE TRIGGER "Log_Delete_VariaveisMedidas" AFTER DELETE
ORDER 1 ON "DBA"."VARIAVEISMEDIDAS"
REFERENCING OLD AS old_del
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_VARIAVEISMEDIDAS (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                LIMITEINFERIOR,
                                LIMITESUPERIOR,
                                IDVARIAVEL,
                                IDCULTURA)
    VALUES                      (date(now()),
                                datetime(now()),
                                'D',
                                 old_del.LIMITEINFERIOR,
                                 old_del.LIMITESUPERIOR,
                                 old_del.IDVARIAVEL,
                                 old_del.IDCULTURA);
END;


CREATE TRIGGER "Log_Delete_Variavel" AFTER DELETE
ORDER 1 ON "DBA"."VARIAVEIS"
REFERENCING OLD AS old_del
FOR EACH ROW /* WHEN( search_condition ) */
BEGIN
	INSERT INTO LOG_VARIAVEIS (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                IDVARIAVEL,
                                NOMEVARIAVEL)
    VALUES                      (date(now()),
                                datetime(now()),
                                'D',
                                 old_del.IDVARIAVEL,
                                 old_del.NOMEVARIAVEL);
END;


CREATE TRIGGER "Log_Update_Cultura" AFTER UPDATE
ORDER 1 ON "DBA"."CULTURA"
REFERENCING new as new_upd old as old_upd
FOR EACH ROW /* WHEN( search_condition ) */

BEGIN 
   
    DECLARE @coluna_alt CHAR(200); 
    DECLARE @new_alt CHAR(200);
    DECLARE @old_alt CHAR(200);

    IF  new_upd.NOMECULTURA <> old_upd.NOMECULTURA THEN         
        SELECT (@coluna_alt + 'NomeCultura - ') INTO @coluna_alt;
        SELECT (@new_alt + new_upd.NOMECULTURA + ' - ') INTO @new_alt;
        SELECT (@old_alt + old_upd.NOMECULTURA + ' - ') INTO @old_alt;
    ENDIF;
    
    IF new_upd.limiteInferiorTemperatura <> old_upd.limiteInferiorTemperatura THEN
        SELECT (@coluna_alt + 'limiteInferiorTemperatura - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.limiteInferiorTemperatura as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.limiteInferiorTemperatura as varchar) + ' - ') INTO @old_alt;
    ENDIF;    

    IF new_upd.LIMITESUPERIORTEMPERATURA <> old_upd.LIMITESUPERIORTEMPERATURA THEN
        SELECT (@coluna_alt + 'limiteSuperiorTemperatura - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.limiteSuperiorTemperatura as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.limiteSuperiorTemperatura as varchar) + ' - ') INTO @old_alt;
    ENDIF;  

    IF new_upd.limiteInferiorHumidade <> old_upd.limiteInferiorHumidade THEN
        SELECT (@coluna_alt + 'limiteInferiorHumidade - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.limiteInferiorHumidade as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.limiteInferiorHumidade as varchar) + ' - ') INTO @old_alt;
    ENDIF; 

    IF new_upd.limiteSuperiorHumidade <> old_upd.limiteSuperiorHumidade THEN
        SELECT (@coluna_alt + 'limiteSuperiorHumidade - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.limiteSuperiorHumidade as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.limiteSuperiorHumidade as varchar) + ' - ') INTO @old_alt;
    ENDIF; 

    IF new_upd.EMAILINVESTIGADOR <> old_upd.EMAILINVESTIGADOR THEN
        SELECT (@coluna_alt + 'EmailInvestigador - ') INTO @coluna_alt;
        SELECT (@new_alt + new_upd.EMAILINVESTIGADOR + ' - ') INTO @new_alt;
        SELECT (@old_alt + old_upd.EMAILINVESTIGADOR + ' - ') INTO @old_alt;
    ENDIF;

   INSERT INTO Log_Cultura (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            IDCULTURA,
                            NOMECULTURA,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            EMAILINVESTIGADOR,
                            COLUNAALTERADA,
                            VALOR_ANTERIOR,
                            VALOR_POSTERIOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'U',
                            new_upd.IDCULTURA,
                            new_upd.NOMECULTURA,
                            new_upd.limiteInferiorTemperatura,
                            new_upd.limiteSuperiorTemperatura,
                            new_upd.limiteInferiorHumidade,
                            new_upd.limiteSuperiorHumidade,
                            new_upd.EMAILINVESTIGADOR,
                            @coluna_alt,
                            @old_alt,
                            @new_alt); 

END;


CREATE TRIGGER "Log_Update_HumidadeTemperatura" AFTER UPDATE
ORDER 1 ON "DBA"."HUMIDADETEMPERATURA"
REFERENCING new as new_upd old as old_upd
FOR EACH ROW /* WHEN( search_condition ) */

BEGIN 
   
    DECLARE @coluna_alt CHAR(200); 
    DECLARE @new_alt CHAR(200);
    DECLARE @old_alt CHAR(200); 

    IF new_upd.VALORMEDICAOHUMIDADE <> old_upd.VALORMEDICAOHUMIDADE THEN
        SELECT (@coluna_alt + 'ValorMedicaoHumidade - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.VALORMEDICAOHUMIDADE as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.VALORMEDICAOHUMIDADE as varchar) + ' - ') INTO @old_alt;
    ENDIF; 

    IF new_upd.VALORMEDICAOTEMPERATURA <> old_upd.VALORMEDICAOTEMPERATURA THEN
        SELECT (@coluna_alt + 'ValorMedicaoTemperatura - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.VALORMEDICAOTEMPERATURA as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.VALORMEDICAOTEMPERATURA as varchar) + ' - ') INTO @old_alt;
    ENDIF; 

    INSERT INTO Log_HumidadeTemperatura (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            VALORMEDICAOHUMIDADE,
                            VALORMEDICAOTEMPERATURA,
                            COLUNAALTERADA,
                            VALOR_ANTERIOR,
                            VALOR_POSTERIOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'U',
                            new_upd.VALORMEDICAOHUMIDADE,
                            new_upd.VALORMEDICAOTEMPERATURA,
                            @coluna_alt,
                            @old_alt,
                            @new_alt);   

END;


CREATE TRIGGER "Log_Update_Investigador" AFTER UPDATE
ORDER 1 ON "DBA"."INVESTIGADOR"
REFERENCING new as new_upd old as old_upd
FOR EACH ROW /* WHEN( search_condition ) */

BEGIN 
   
    DECLARE @coluna_alt CHAR(200); 
    DECLARE @new_alt CHAR(200);
    DECLARE @old_alt CHAR(200); 

   IF new_upd.EMAIL <> old_upd.EMAIL THEN
        SELECT (@coluna_alt + 'Email - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.EMAIL as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.EMAIL as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    IF new_upd.NOMEINVESTIGADOR <> old_upd.NOMEINVESTIGADOR THEN
        SELECT (@coluna_alt + 'NomeInvestigador - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.NOMEINVESTIGADOR as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.NOMEINVESTIGADOR as varchar) + ' - ') INTO @old_alt;
    ENDIF; 

    INSERT INTO LOG_INVESTIGADORES (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            EMAIL,
                            NOMEINVESTIGADOR,
                            COLUNAALTERADA,
                            VALOR_ANTERIOR,
                            VALOR_POSTERIOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'U',
                            new_upd.EMAIL,
                            new_upd.NOMEINVESTIGADOR,
                            @coluna_alt,
                            @old_alt,
                            @new_alt);

END;


CREATE TRIGGER "Log_Update_Medicao" AFTER UPDATE
ORDER 1 ON "DBA"."MEDICOES"
REFERENCING new as new_upd old as old_upd
FOR EACH ROW /* WHEN( search_condition ) */

BEGIN 
   
    DECLARE @coluna_alt CHAR(200); 
    DECLARE @new_alt CHAR(200);
    DECLARE @old_alt CHAR(200); 

   IF new_upd.NUMEROMEDICAO <> old_upd.NUMEROMEDICAO THEN
        SELECT (@coluna_alt + 'NumeroMedicao - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.NUMEROMEDICAO as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.NUMEROMEDICAO as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    IF new_upd.VALORMEDICAO <> old_upd.VALORMEDICAO THEN
        SELECT (@coluna_alt + 'ValorMedicao - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.VALORMEDICAO as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.VALORMEDICAO as varchar) + ' - ') INTO @old_alt;
    ENDIF; 

    IF new_upd.IDVARIAVEL <> old_upd.IDVARIAVEL THEN
        SELECT (@coluna_alt + 'IdVariavel - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.IDVARIAVEL as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.IDVARIAVEL as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    IF new_upd.IDCULTURA <> old_upd.IDCULTURA THEN
        SELECT (@coluna_alt + 'IdCultura - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.IDCULTURA as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.IDCULTURA as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    INSERT INTO LOG_MEDICOES (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            NUMEROMEDICAO,
                            VALORMEDICAO,
                            IDVARIAVEL,
                            IDCULTURA,
                            COLUNAALTERADA,
                            VALOR_ANTERIOR,
                            VALOR_POSTERIOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'U',
                            new_upd.NUMEROMEDICAO,
                            new_upd.VALORMEDICAO,
                            new_upd.IDVARIAVEL,
                            new_upd.IDCULTURA,
                            @coluna_alt,
                            @old_alt,
                            @new_alt);

END;


CREATE TRIGGER "Log_Update_VariaveisMedidas" AFTER UPDATE
ORDER 1 ON "DBA"."VARIAVEISMEDIDAS"
REFERENCING new as new_upd old as old_upd
FOR EACH ROW /* WHEN( search_condition ) */

BEGIN 
   
    DECLARE @coluna_alt CHAR(200); 
    DECLARE @new_alt CHAR(200);
    DECLARE @old_alt CHAR(200); 

   IF new_upd.LIMITEINFERIOR <> old_upd.LIMITEINFERIOR THEN
        SELECT (@coluna_alt + 'LimiteInferior - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.LIMITEINFERIOR as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.LIMITEINFERIOR as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    IF new_upd.LIMITESUPERIOR <> old_upd.LIMITESUPERIOR THEN
        SELECT (@coluna_alt + 'LimiteSuperior - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.LIMITESUPERIOR as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.LIMITESUPERIOR as varchar) + ' - ') INTO @old_alt;
    ENDIF; 

    IF new_upd.IDVARIAVEL <> old_upd.IDVARIAVEL THEN
        SELECT (@coluna_alt + 'IdVariavel - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.IDVARIAVEL as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.IDVARIAVEL as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    IF new_upd.IDCULTURA <> old_upd.IDCULTURA THEN
        SELECT (@coluna_alt + 'IdCultura - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.IDCULTURA as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.IDCULTURA as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    INSERT INTO LOG_VARIAVEISMEDIDAS (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            LIMITEINFERIOR,
                            LIMITESUPERIOR,
                            IDVARIAVEL,
                            IDCULTURA,
                            COLUNAALTERADA,
                            VALOR_ANTERIOR,
                            VALOR_POSTERIOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'U',
                            new_upd.LIMITEINFERIOR,
                            new_upd.LIMITESUPERIOR,
                            new_upd.IDVARIAVEL,
                            new_upd.IDCULTURA,
                            @coluna_alt,
                            @old_alt,
                            @new_alt);

END;


CREATE TRIGGER "Log_Update_Variavel" AFTER UPDATE
ORDER 1 ON "DBA"."VARIAVEIS"
REFERENCING new as new_upd old as old_upd
FOR EACH ROW /* WHEN( search_condition ) */

BEGIN 
   
    DECLARE @coluna_alt CHAR(200); 
    DECLARE @new_alt CHAR(200);
    DECLARE @old_alt CHAR(200); 

    IF new_upd.IDVARIAVEL <> old_upd.IDVARIAVEL THEN
        SELECT (@coluna_alt + 'IdVariavel - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.IDVARIAVEL as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.IDVARIAVEL as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    IF new_upd.NOMEVARIAVEL <> old_upd.NOMEVARIAVEL THEN
        SELECT (@coluna_alt + 'NomeVariavel - ') INTO @coluna_alt;
        SELECT (@new_alt + cast(new_upd.NOMEVARIAVEL as varchar) + ' - ') INTO @new_alt;
        SELECT (@old_alt + cast(old_upd.NOMEVARIAVEL as varchar) + ' - ') INTO @old_alt;
    ENDIF;

    INSERT INTO LOG_VARIAVEIS (DATELOG,
                            TIME_LOG,
                            TIPOLOG,
                            IDVARIAVEL,
                            NOMEVARIAVEL,
                            COLUNAALTERADA,
                            VALOR_ANTERIOR,
                            VALOR_POSTERIOR)

            VALUES         (date(now()),
                            datetime(now()),
                            'U',
                            new_upd.IDVARIAVEL,
                            new_upd.NOMEVARIAVEL,
                            @coluna_alt,
                            @old_alt,
                            @new_alt);

END;
