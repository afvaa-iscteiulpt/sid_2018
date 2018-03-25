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
from dba.LogVariaveisMedidas as novo, dba.LogVariaveisMedidas as antigo
where novo.operacao ='U'
AND  antigo.idLogVariaveisMedidas =(select max(idLogVariaveisMedidas) 
                             	    from   dba.LogVariaveisMedidas
                             	    where  idCultura = novo.idCultura
				                    and    idVariavel = novo.idVariavel
                             	    and    idLogVariaveisMedidas < novo.idLogVariaveisMedidas)
;