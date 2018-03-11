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
from dba.LogMedicoes as novo, dba.LogMedicoes as antigo
where novo.operacao ='U'
AND  antigo.idLogMedicoes =(select max(idLogMedicoes) 
                             	    from   dba.LogMedicoes
                             	    where  idCultura = novo.idCultura
				    and    idVariavel = novo.idVariavel
				    and    numeroMedicao = novo.numeroMedicao
                             	    and    idLogMedicoes < novo.idLogMedicoes)
;