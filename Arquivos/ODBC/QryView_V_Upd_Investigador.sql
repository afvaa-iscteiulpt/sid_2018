SELECT  novo.idLogInvestigador as idLogInvestigador_new,
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
from dba.LogInvestigador as novo, dba.LogInvestigador as antigo
where novo.operacao ='U'
AND  antigo.idLogInvestigador =(select max(idlogInvestigador) 
                                 from   dba.LogInvestigador 
                                 where  idInvestigador = novo.idInvestigador
                                 and    idLogInvestigador < novo.idLogInvestigador)
;
