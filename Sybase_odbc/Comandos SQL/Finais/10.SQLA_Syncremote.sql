ALTER PROCEDURE "DBA"."sp_syncRemote"()

BEGIN
    DECLARE lastid INTEGER;
     

SET lastid = (SELECT MAX(idLogCultura) FROM logcultura_remoteMysql);
    IF (lastid IS NULL) THEN
INSERT logcultura_remoteMysql SELECT * FROM LogCultura;
    ELSE 
INSERT logcultura_remoteMysql SELECT * FROM LogCultura WHERE idLogCultura > lastid;
   END IF;


SET lastid = (SELECT MAX(idMedicao) FROM loghumidadetemperatura_remoteMysql);
    IF (lastid IS NULL) THEN
INSERT loghumidadetemperatura_remoteMysql SELECT * FROM HumidadeTemperatura;
    ELSE 
INSERT loghumidadetemperatura_remoteMysql SELECT * FROM HumidadeTemperatura WHERE idMedicao > lastid;
   END IF;


SET lastid = (SELECT MAX(idLogInvestigador) FROM LogInvestigador);
    IF (lastid IS NULL) THEN
INSERT loginvestigador_remoteMysql SELECT * FROM LogInvestigador;
    ELSE 
INSERT loginvestigador_remoteMysql SELECT * FROM LogInvestigador WHERE idLogInvestigador > lastid;
   END IF;


SET lastid = (SELECT MAX(idLogMedicoes) FROM LogMedicoes);
    IF (lastid IS NULL) THEN
INSERT logmedicoes_remoteMysql SELECT * FROM LogMedicoes;
    ELSE 
INSERT logmedicoes_remoteMysql SELECT * FROM LogMedicoes WHERE idLogMedicoes > lastid;
   END IF;


SET lastid = (SELECT MAX(idLogSelect) FROM LogSelect);
    IF (lastid IS NULL) THEN
INSERT logselect_remoteMysql SELECT * FROM LogSelect;
    ELSE 
INSERT logselect_remoteMysql SELECT * FROM LogSelect WHERE idLogSelect > lastid;
   END IF;

SET lastid = (SELECT MAX(idLogVariaveis) FROM LogVariaveis);
    IF (lastid IS NULL) THEN
INSERT logvariaveis_remoteMysql SELECT * FROM LogVariaveis;
    ELSE 
INSERT logvariaveis_remoteMysql SELECT * FROM LogVariaveis WHERE idLogVariaveis > lastid;
   END IF;


SET lastid = (SELECT MAX(idLogVariaveisMedidas) FROM LogVariaveisMedidas);
    IF (lastid IS NULL) THEN
INSERT logvariaveismedidas_remoteMysql SELECT * FROM LogVariaveisMedidas;
    ELSE 
INSERT logvariaveismedidas_remoteMysql SELECT * FROM LogVariaveisMedidas WHERE idLogVariaveisMedidas > lastid;
   END IF;


COMMIT
   
END