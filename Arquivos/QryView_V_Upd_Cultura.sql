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
from dba.LogCultura as novo, dba.LogCultura as antigo
where novo.operacao ='U'
AND  antigo.idLogCultura =(select max(idlogCultura) 
                                 from   dba.LogCultura 
                                 where  idCultura = novo.idCultura
                                 and    idLogCultura < novo.idLogCultura)
;
