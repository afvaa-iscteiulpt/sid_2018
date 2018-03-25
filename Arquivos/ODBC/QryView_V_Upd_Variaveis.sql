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
from dba.LogVariaveis as novo, dba.LogVariaveis as antigo
where novo.operacao ='U'
AND  antigo.idLogVariaveis =(select max(idLogVariaveis) 
                             from   dba.LogVariaveis
                             where  idVariavel = novo.idVariavel
                             and    idLogVariaveis < novo.idLogVariaveis)
;