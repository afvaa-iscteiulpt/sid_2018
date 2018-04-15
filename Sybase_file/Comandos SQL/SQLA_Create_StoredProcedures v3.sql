drop procedure if exists consultCulturas;

drop procedure if exists consultHumidadeTemperatura;

drop procedure if exists consultMedicoes;

drop procedure if exists consultVariaveis;

drop procedure if exists consultVariaveisMedidas;

drop procedure if exists createVariavelMedida;

drop procedure if exists deleteMedicoes;

drop procedure if exists insertMedicoes;

drop procedure if exists updateMedicoes;


CREATE PROCEDURE "DBA"."consultCulturas"( OUT identificador INTEGER, OUT Nome_Culturas VARCHAR(100), OUT Investigador VARCHAR(100) )
/* RESULT( column_name column_type, ... ) */
BEGIN
	SELECT IDCULTURA, NOMECULTURA, EMAILINVESTIGADOR
    FROM CULTURA;
END;


CREATE PROCEDURE "DBA"."consultHumidadeTemperatura"( OUT Id_medicao INTEGER, OUT Data_medicao DATE, OUT Hora TIME, OUT Valor_Temperatura DECIMAL (8,2), OUT Valor_Humidade DECIMAL(8,2))
/* RESULT( column_name column_type, ... ) */
BEGIN
	SELECT IDMEDICAO, DATAMEDICAO, HORAMEDICAO, VALORMEDICAOTEMPERATURA, VALORMEDICAOHUMIDADE
    FROM HUMIDADETEMPERATURA
END;


CREATE PROCEDURE "DBA"."consultMedicoes"(IN id_cult INTEGER/*cultureName VARCHAR(100)*/, OUT id_Medicao INTEGER, OUT id_Cultura VARCHAR(100), 
                                        OUT Valor DECIMAL(8,2), OUT LimiteInferior DECIMAL(8,2), OUT LimiteSuperior DECIMAL(8,2), 
                                        OUT Investigador VARCHAR(100))
/* RESULT( column_name column_type, ... ) */
BEGIN
    INSERT INTO LOG_CONSULTAS (DATELOG,
                                TIME_LOG,
                                TIPOLOG,
                                UTILIZADOR,
                                NOMECULTURA,
                                ACESSO)
    VALUES                      (date(now()),
                                datetime(now()),
                                'S',
                                 (select CULTURA.EMAILINVESTIGADOR from CULTURA where cultura.IDCULTURA=id_cult),
                                id_cult,
                                user_name());	

    SELECT MEDICOES.NUMEROMEDICAO, MEDICOES.IDCULTURA, MEDICOES.VALORMEDICAO, VARIAVEISMEDIDAS.LIMITEINFERIOR, VARIAVEISMEDIDAS.LIMITESUPERIOR, CULTURA.EMAILINVESTIGADOR 
    FROM MEDICOES, VARIAVEISMEDIDAS, CULTURA
    WHERE id_cult=MEDICOES.IDCULTURA AND MEDICOES.IDVARIAVEL=VARIAVEISMEDIDAS.IDVARIAVEL AND CULTURA.IDCULTURA=VARIAVEISMEDIDAS.IDCULTURA;

END;


CREATE PROCEDURE "DBA"."consultVariaveis"( OUT identificador INTEGER, OUT Nome_Variavel VARCHAR(100))
/* RESULT( column_name column_type, ... ) */
BEGIN
	SELECT IDVARIAVEL, NOMEVARIAVEL
    FROM VARIAVEIS
END;


CREATE PROCEDURE "DBA"."consultVariaveisMedidas"( OUT id_Cultura VARCHAR(100), OUT id_Variavel VARCHAR(100), OUT limite_inferior DECIMAL(8,2), OUT limite_superior DECIMAL (8,2))
/* RESULT( column_name column_type, ... ) */
BEGIN
	SELECT IDCULTURA, IDVARIAVEL, LIMITEINFERIOR, LIMITESUPERIOR
    FROM VARIAVEISMEDIDAS
END;


CREATE PROCEDURE "DBA"."createVariavelMedida"( IN id_cultura VARCHAR(100), IN id_variavel VARCHAR(100), IN limite_inferior DECIMAL(8,2), IN limite_superior DECIMAL(8,2))
/* RESULT( column_name column_type, ... ) */
BEGIN
	INSERT INTO VARIAVEISMEDIDAS (LIMITEINFERIOR,
                                LIMITESUPERIOR,
                                IDVARIAVEL,
                                IDCULTURA)
    VALUES                      (limite_inferior,
                                limite_superior,
                                id_variavel,
                                id_cultura);

END;


CREATE PROCEDURE "DBA"."deleteMedicoes"( IN numero_medicao INTEGER )
/* RESULT( column_name column_type, ... ) */
BEGIN
    DELETE FROM MEDICOES
        WHERE MEDICOES.NUMEROMEDICAO = numero_medicao;
END;


CREATE PROCEDURE "DBA"."insertMedicoes"(IN valor DECIMAL(8,2), IN id_variavel INTEGER , IN id_cultura INTEGER  )
/* RESULT( column_name column_type, ... ) */
BEGIN
    INSERT INTO MEDICOES (DATAMEDICAO,
                            HORAMEDICAO,
                            VALORMEDICAO,
                            IDVARIAVEL,
                            IDCULTURA)
    VALUES                   (date(now()),
                             datetime(now()),
                             valor,
                             id_variavel,
                             id_cultura);
END;


CREATE PROCEDURE "DBA"."updateMedicoes"( IN valor DECIMAL(8,2), IN numero_medicao INTEGER )
/* RESULT( column_name column_type, ... ) */
BEGIN
	UPDATE MEDICOES
    SET VALORMEDICAO = valor
    WHERE NUMEROMEDICAO = numero_medicao;
END;
