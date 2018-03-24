/* --------------------------------------------------------------------------------
* DROP DAS VIEWS SOBRE OS LOGS
*/ --------------------------------------------------------------------------------
DROP VIEW IF EXISTS V_Upd_Investigador;

DROP VIEW IF EXISTS V_Upd_Variaveis;

DROP VIEW IF EXISTS V_Upd_Cultura;

DROP VIEW IF EXISTS V_Upd_VariaveisMedidas;

DROP VIEW IF EXISTS V_Upd_Medicoes;

/* --------------------------------------------------------------------------------
*  CREATE DAS VIEWS SOBRE OS LOGS
*/ --------------------------------------------------------------------------------

CREATE VIEW V_Upd_Investigador AS
select
   novo.idLogInvestigador as idLogInvestigador_new,
   novo.idInvestigador,
   novo.email as email_new,
   novo.nomeInvestigador as nomeInvestigador_new,
   novo.deleted as deleted_new,
   novo.utilizador as utilizador_new,
   novo.operacao as operacao_new,
   novo.dataOperacao as dataOperacao_new,
   antigo.idLogInvestigador as idLogInvestigador_old,
   antigo.email as email_old,
   antigo.nomeInvestigador as nomeInvestigador_old,
   antigo.deleted as deleted_old,
   antigo.utilizador as utilizador_old,
   antigo.operacao as operacao_old,
   antigo.dataOperacao as dataOperacao_old
from
   LogInvestigador AS novo,
   LogInvestigador AS antigo
where
   novo.operacao = 'U'
   AND antigo.idLogInvestigador = (select max(idlogInvestigador) from LogInvestigador where idInvestigador = novo.idInvestigador and idLogInvestigador < novo.idLogInvestigador) 
   ;

CREATE VIEW V_Upd_Variaveis AS
SELECT  novo.idLogVariaveis as idLogVariaveis_new,
        novo.idVariavel,
        novo.deleted as deleted_new,
        novo.utilizador as utilizador_new,
        novo.operacao as operacao_new,
        novo.dataOperacao as dataOperacao_new, 
        antigo.idLogVariaveis as idLogVariaveis_old,
        antigo.deleted as deleted_old,
        antigo.utilizador as utilizador_old,
        antigo.operacao as operacao_old,  
        antigo.dataOperacao as dataOperacao_old
from LogVariaveis as novo, LogVariaveis as antigo
where novo.operacao ='U'
AND  antigo.idLogVariaveis =(select max(idLogVariaveis) 
                             from   LogVariaveis
                             where  idVariavel = novo.idVariavel
                             and    idLogVariaveis < novo.idLogVariaveis)
;


CREATE VIEW V_Upd_Cultura AS
SELECT  novo.idLogCultura as idLogCultura_new,
        novo.idCultura,
        novo.idInvestigador as idInvestigador_new, 
        novo.nomeCultura as nomeCultura_new,
	    novo.limiteInferiorTemperatura as limiteInferiorTemperatura_new,
	    novo.limiteSuperiorTemperatura as limiteSuperiorTemperatura_new,
	    novo.limiteInferiorHumidade as limiteInferiorHumidade_new,
	    novo.limiteSuperiorHumidade as limiteSuperiorHumidade_new,
        novo.deleted as deleted_new,
        novo.utilizador as utilizador_new,
        novo.operacao as operacao_new,
        novo.dataOperacao as dataOperacao_new, 
        antigo.idLogCultura as idLogCultura_old,
        antigo.idInvestigador as idInvestigador_old, 
        antigo.nomeCultura as nomeCultura_old,
	    antigo.limiteInferiorTemperatura as limiteInferiorTemperatura_old,
	    antigo.limiteSuperiorTemperatura as limiteSuperiorTemperatura_old,
	    antigo.limiteInferiorHumidade as limiteInferiorHumidade_old,
	    antigo.limiteSuperiorHumidade as limiteSuperiorHumidade_old,
        antigo.deleted as deleted_old,
        antigo.utilizador as utilizador_old,
        antigo.operacao as operacao_old,  
        antigo.dataOperacao as dataOperacao_old
from LogCultura as novo, LogCultura as antigo
where novo.operacao ='U'
AND  antigo.idLogCultura =(select max(idlogCultura) 
                                 from   LogCultura 
                                 where  idCultura = novo.idCultura
                                 and    idLogCultura < novo.idLogCultura)
;

CREATE VIEW V_Upd_VariaveisMedidas AS
SELECT  novo.idLogVariaveisMedidas as idLogVariaveisMedidas_new,
	    novo.idCultura,
            novo.idVariavel,
	    novo.limiteInferior as limiteInferior_new,
	    novo.limiteSuperior as limiteSuperior_new,
            novo.deleted as deleted_new,
            novo.utilizador as utilizador_new,
            novo.operacao as operacao_new,
            novo.dataOperacao as dataOperacao_new, 
            antigo.idLogVariaveisMedidas as idLogVariaveisMedidas_old,
	    antigo.limiteInferior as limiteInferior_old,
	    antigo.limiteSuperior as limiteSuperior_old,
            antigo.deleted as deleted_old,
            antigo.utilizador as utilizador_old,
            antigo.operacao as operacao_old,  
            antigo.dataOperacao as dataOperacao_old
from LogVariaveisMedidas as novo, LogVariaveisMedidas as antigo
where novo.operacao ='U'
AND  antigo.idLogVariaveisMedidas =(select max(idLogVariaveisMedidas) 
                             	    from   LogVariaveisMedidas
                             	    where  idCultura = novo.idCultura
				    and    idVariavel = novo.idVariavel
                             	    and    idLogVariaveisMedidas < novo.idLogVariaveisMedidas)
;

CREATE VIEW V_Upd_Medicoes AS
SELECT  novo.idLogMedicoes as idLogMedicoes_new,
	novo.idCultura,
        novo.idVariavel,
	    novo.numeroMedicao,
	    novo.dataMedicao as dataMedicao_new,
	    novo.horaMedicao as horaMedicao_new,
        novo.deleted as deleted_new,
        novo.utilizador as utilizador_new,
        novo.operacao as operacao_new,
        novo.dataOperacao as dataOperacao_new, 
        antigo.idLogMedicoes as idLogMedicoes_old,
	    antigo.dataMedicao as dataMedicao_old,
	    antigo.horaMedicao as horaMedicao_old,
        antigo.deleted as deleted_old,
        antigo.utilizador as utilizador_old,
        antigo.operacao as operacao_old,  
        antigo.dataOperacao as dataOperacao_old
from LogMedicoes as novo, LogMedicoes as antigo
where novo.operacao ='U'
AND  antigo.idLogMedicoes =(select max(idLogMedicoes) 
                             	    from   LogMedicoes
                             	    where  idCultura = novo.idCultura
				    and    idVariavel = novo.idVariavel
				    and    numeroMedicao = novo.numeroMedicao
                             	    and    idLogMedicoes < novo.idLogMedicoes)
;
