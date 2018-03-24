ALTER PROCEDURE "DBA"."sp_GeraDados"( IN arg_id INTEGER )

BEGIN
    DECLARE intCount INTEGER;
    DECLARE lastIdInvestigador INTEGER;
    DECLARE lastIdCultura INTEGER;
    DECLARE lastIdVariaveis INTEGER;
    DECLARE idCulturaParaVariaveisMedidas INTEGER;
    DECLARE idVariavelParaVariaveisMedidas INTEGER;
    DECLARE idCulturaParaMedicoes INTEGER;
    DECLARE idVariavelParaMedicoes INTEGER;
    DECLARE randomParaMedicoes INTEGER;
    SET intCount = 0;	

    SET lastIdInvestigador = (SELECT MAX(idInvestigador) FROM Investigador);
    SET lastIdCultura = (SELECT MAX(idCultura) FROM Cultura);
    SET lastIdVariaveis = (SELECT MAX(idVariavel) FROM Variaveis);

    IF (lastIdInvestigador IS NULL) THEN
        SET lastIdInvestigador = 0;
    END IF; 

    IF (lastIdCultura IS NULL) THEN
        SET lastIdCultura = 0;
    END IF; 

    IF (lastIdVariaveis IS NULL) THEN
        SET lastIdVariaveis = 0;
    END IF;
       
    IF (arg_id IS NULL) THEN
        SET arg_id = 10000;
    END IF; 

    WHILE intCount < arg_id LOOP
        SET lastIdInvestigador = lastIdInvestigador + 1;
        SET lastIdCultura = lastIdCultura + 1;
        SET lastIdVariaveis = lastIdVariaveis + 1;
        SET intCount = intCount + 1;
               
        INSERT INTO Investigador (email, nomeInvestigador, deleted) VALUES ('user' + CAST(lastIdInvestigador AS VARCHAR) + '@sid.pt', 'Investigador ' + CAST(lastIdInvestigador AS VARCHAR),0);
        

        INSERT INTO Cultura (idInvestigador, nomeCultura, limiteInferiorTemperatura, limiteSuperiorTemperatura, limiteInferiorHumidade, limiteSuperiorHumidade, deleted) VALUES ((SELECT FIRST idInvestigador FROM Investigador ORDER BY RAND()), 'Cult' + CAST(lastIdCultura AS VARCHAR), CAST((RAND()*50) + 1 AS VARCHAR), CAST((RAND()*50) + 1 AS VARCHAR), CAST((RAND()*100) + 1 AS VARCHAR), CAST((RAND()*100) + 1 AS VARCHAR), 0);


        INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Temp' + CAST(lastIdVariaveis AS VARCHAR), 0);
        

        SET idCulturaParaVariaveisMedidas = (SELECT FIRST idCultura FROM Cultura ORDER BY RAND());
        SET idVariavelParaVariaveisMedidas = (SELECT FIRST idVariavel FROM Variaveis ORDER BY RAND());
        WHILE (SELECT idCultura FROM VariaveisMedidas WHERE idCultura = idCulturaParaVariaveisMedidas AND idVariavel = idVariavelParaVariaveisMedidas) IS NOT NULL LOOP
            SET idCulturaParaVariaveisMedidas = (SELECT FIRST idCultura FROM Cultura ORDER BY RAND());
            SET idVariavelParaVariaveisMedidas = (SELECT FIRST idVariavel FROM Variaveis ORDER BY RAND());
        END LOOP;   
        INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (idCulturaParaVariaveisMedidas, idVariavelParaVariaveisMedidas, CAST((RAND()*50) + 1 AS VARCHAR), CAST((RAND()*50) + 1 AS VARCHAR), 0);
 

        SET idCulturaParaMedicoes = (SELECT FIRST idCultura FROM VariaveisMedidas ORDER BY RAND());
        SET idVariavelParaMedicoes = (SELECT FIRST idVariavel FROM VariaveisMedidas ORDER BY RAND());
        WHILE (SELECT idCultura FROM VariaveisMedidas WHERE idCultura = idCulturaParaMedicoes AND idVariavel = idVariavelParaMedicoes) IS NULL LOOP
            SET idCulturaParaMedicoes = (SELECT FIRST idCultura FROM VariaveisMedidas ORDER BY RAND());
            SET idVariavelParaMedicoes = (SELECT FIRST idVariavel FROM VariaveisMedidas ORDER BY RAND());
        END LOOP;
        INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao,  deleted) VALUES (idCulturaParaMedicoes, idVariavelParaMedicoes, (TODAY() - (RAND()*100)*500) , CAST((RAND()*50) + 1 AS VARCHAR), 0);


        INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ((TODAY() - RAND()*100*500), CAST((RAND()*50) + 1 AS VARCHAR), CAST((RAND()*50) + 1 AS VARCHAR));       


        INSERT INTO LogSelect (comandoSelect, utilizador, dataOperacao) VALUES ('COMANDOSELECT', 'DBA', ((TODAY() - (RAND()*100)*500)));             

    END LOOP; 
END

