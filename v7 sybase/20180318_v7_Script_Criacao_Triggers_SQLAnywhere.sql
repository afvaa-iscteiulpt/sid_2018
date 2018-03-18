/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     18/03/2018 23:04:14                          */
/*==============================================================*/


drop trigger if exists tr_after_del_Cultura;

drop trigger if exists tr_after_ins_Cultura;

drop trigger if exists tr_after_upd_Cultura;

drop trigger if exists tr_after_ins_HumidadeTemp;

drop trigger if exists tr_after_del_Investigador;

drop trigger if exists tr_after_ins_Investigador;

drop trigger if exists tr_after_upd_Investigadorr;

drop trigger if exists tr_before_Ins_Investigador;

drop trigger if exists tr_before_del_Investigador;

drop trigger if exists tr_before_upd_Investigador;

drop trigger if exists tr_after_del_Medicoes;

drop trigger if exists tr_after_ins_Medicoes;

drop trigger if exists tr_after_upd_Medicoes;

drop trigger if exists tr_after_del_Variaveis;

drop trigger if exists tr_after_ins_Variaveis;

drop trigger if exists tr_after_upd_Variaveis;

drop trigger if exists tr_after_del_VariaveisMedidas;

drop trigger if exists tr_after_ins_VariaveisMedidas;

drop trigger if exists tr_after_upd_VariaveisMedidas;


create trigger tr_after_del_Cultura after delete order 1 on Cultura
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
           INSERT INTO LogCultura (idCultura,
                            idInvestigador,
                            nomeCultura,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            deleted,
                            utilizador,
                            operacao,
                            dataOperacao)
            VALUES         (old_del.idCultura,
                            old_del.idInvestigador,
                            old_del.nomeCultura,
                            old_del.limiteInferiorTemperatura,
                            old_del.limiteSuperiorTemperatura,
                            old_del.limiteInferiorHumidade,
                            old_del.deleted,
                            limiteSuperiorHumidade,
                            user_name(),
                            'D',
                            now() );
end;


create trigger tr_after_ins_Cultura after insert order 1 on Cultura
referencing new as new_ins for each row
begin 
INSERT INTO LogCultura (   idCultura,
                            idInvestigador,
                            nomeCultura,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            deleted,
                            utilizador,
                            operacao,
                            dataOperacao)
            VALUES         (new_ins.idCultura,
                            new_ins.idInvestigador,
                            new_ins.nomeCultura,
                            new_ins.limiteInferiorTemperatura,
                            new_ins.limiteSuperiorTemperatura,
                            new_ins.limiteInferiorHumidade,
                            new_ins.limiteSuperiorHumidade,
                            new_ins.deleted,
                            user_name(),
                            'I',
                            now() );
end;


create trigger tr_after_upd_Cultura after update of idCultura,
                                         idInvestigador
order 1 on Cultura
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    
           INSERT INTO LogCultura (idCultura,
                            idInvestigador,
                            nomeCultura,
                            limiteInferiorTemperatura,
                            limiteSuperiorTemperatura,
                            limiteInferiorHumidade,
                            limiteSuperiorHumidade,
                            deleted,
                            utilizador,
                            operacao,
                            dataOperacao)
            VALUES         (new_upd.idCultura,
                            new_upd.idInvestigador,
                            new_upd.nomeCultura,
                            new_upd.limiteInferiorTemperatura,
                            new_upd.limiteSuperiorTemperatura,
                            new_upd.limiteInferiorHumidade,
                            new_upd.limiteSuperiorHumidade,
                            new_upd.deleted,
                            user_name(),
                            'U',
                            now() );
end;


create trigger tr_after_ins_HumidadeTemp after insert order 1 on HumidadeTemperatura
referencing new as new_ins for each row
begin 
    INSERT INTO LogHumidadeTemperatura (dataHoraMedicao,
                                        valorMedicaoTemperatura,
                                        valorMedicaoHumidade,
                                        idMedicao)
            VALUES                      (new_ins.dataHoraMedicao,
                                         new_ins.valorMedicaoTemperatura,
                                         new_ins.valorMedicaoHumidade,
                                         new_ins.idMedicao);
end;


create trigger tr_after_del_Investigador after delete order 1 on Investigador
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
     insert into LogInvestigador (idInvestigador,
                                 email,
                                 nomeInvestigador,
                                 deleted,
                                 utilizador,
                                 operacao,
                                 dataOperacao)
            VALUES              (old_del.idInvestigador,
                                 old_del.email,
                                 old_del.nomeInvestigador,
                                 old_del.deleted,
                                 user_name(),
                                 'D',
                                 now() );
end;


create trigger tr_after_ins_Investigador after insert order 1 on Investigador
referencing new as new_ins for each row
begin
 INSERT INTO LogInvestigador (idInvestigador,
                                 email,
                                 nomeInvestigador,
                                 deleted,
                                 utilizador,
                                 operacao,
                                 dataOperacao)
    VALUES                      (new_ins.idInvestigador,
                                 new_ins.email,
                                 new_ins.nomeInvestigador,
                                 new_ins.deleted,
                                 user_name(),
                                 'I',
                                 now() );
end;


create trigger tr_after_upd_Investigadorr after update of idInvestigador
order 1 on Investigador
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    insert into LogInvestigador (idInvestigador,
                                 email,
                                 nomeInvestigador,
                                 utilizador,
                                 deleted,
                                 operacao,
                                 dataOperacao)
            VALUES              (new_upd.idInvestigador,
                                 new_upd.email,
                                 new_upd.nomeInvestigador,
                                 new_upd.deleted,
                                 user_name(),
                                 'U',
                                 now());
end;


create trigger tr_before_Ins_Investigador before insert order 1 on Investigador
referencing new as new_ins for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    
    IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = new_ins.email)
        drop user new_ins.email;
    END IF;
    CREATE USER new_ins.email IDENTIFIED BY 'senha';
    IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores')
        GRANT MEMBERSHIP IN GROUP Investigadores TO new_ins.email;
    ELSE
        user_defined_exception = 'N�o existe grupo defnido pars Investigadores';
        RAISERROR '99999' user_defined_exception;
        rollback;
    END IF;      
end;


create trigger tr_before_del_Investigador before delete order 1 on Investigador
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
         
    IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = old_del.email)
        drop user old_del.email;
    END IF;
 end;


create trigger tr_before_upd_Investigador before update of idInvestigador
order 1 on Investigador
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
   IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = old_upd.email)
          IF (new_upd.deleted = true) OR (old_upd.email <> new_upd.email)then
            -- Investigador "soft deleted" ou "anonimizado", ou com email alterado
             drop user old_upd.email;
          END IF
          IF (old_upd.email <> new_upd.email) then
                  IF (new_upd.email <> '') and (new_upd.email is not null)
                        CREATE USER new_upd.email IDENTIFIED BY 'senha';
                        IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores')
                               GRANT MEMBERSHIP IN GROUP Investigadores TO new_upd.email;
                        ELSE
                               user_defined_exception = 'N�o existe grupo defnido pars Investigadores';
                               RAISERROR '99999' user_defined_exception;
                               rollback;
                         END IF
                  END IF
          END IF
   END IF
end;


create trigger tr_after_del_Medicoes after delete order 1 on Medicoes
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogMedicoes			(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataHoraMedicao,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (old_del.idCultura,
                                     old_del.idVariavel,
                                     old_del.numeroMedicao,
                                     old_del.dataHoraMedicao,
                                     old_del.deleted,
                                     user_name(),
                                     'D',
                                     now() ); 
end;


create trigger tr_after_ins_Medicoes after insert order 1 on Medicoes
referencing new as new_ins for each row
begin 
 INSERT INTO LogMedicoes 			(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataHoraMedicao,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_ins.idCultura,
                                     new_ins.idVariavel,
                                     new_ins.numeroMedicao,
                                     new_ins.dataHoraMedicao,
                                     new_ins.deleted,
                                     user_name(),
                                     'I',
                                     now() );
end;


create trigger tr_after_upd_Medicoes after update of idCultura,
                                         idVariavel,
                                         numeroMedicao
order 1 on Medicoes
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogMedicoes 		(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataHoraMedicao,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_upd.idCultura,
                                     new_upd.idVariavel,
                                     new_upd.numeroMedicao,
                                     new_upd.dataHoraMedicao,
                                     new_upd.deleted,
                                     user_name(),
                                     'U',
                                     now() );       
end;


create trigger tr_after_del_Variaveis after delete order 1 on Variaveis
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogVariaveis (idVariavel,
                              nomeVariavel,
                              deleted,
                              utilizador,
                              operacao,
                              dataOperacao)
            VALUES           (old_del.idVariavel,
                              old_del.nomeVariavel,
                              old_del.deleted,
                              user_name(),
                              'D',
                              now() );
end;


create trigger tr_after_ins_Variaveis after insert order 1 on Variaveis
referencing new as new_ins for each row
begin 
INSERT INTO LogVariaveis (idVariavel,
                              nomeVariavel,
                              deleted,
                              utilizador,
                              operacao,
                              dataOperacao)
            VALUES           (new_ins.idVariavel,
                              new_ins.nomeVariavel,
                              new_ins.deleted,
                              user_name(),
                              'I',
                              now() );
end;


create trigger tr_after_upd_Variaveis after update of idVariavel
order 1 on Variaveis
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogVariaveis (idVariavel,
                              nomeVariavel,
                              deleted,
                              utilizador,
                              operacao,
                              dataOperacao)
            VALUES           (new_upd.idVariavel,
                              new_upd.nomeVariavel,
                              new_upd.deleted,
                              user_name(),
                              'U',
                              now() );
end;


create trigger tr_after_del_VariaveisMedidas after delete order 1 on VariaveisMedidas
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogVariaveisMedidas (idCultura,
                                     idVariavel,
                                     limiteInferior,
                                     limiteSuperior,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (old_del.idCultura,
                                     old_del.idVariavel,
                                     old_del.limiteInferior,
                                     old_del.limiteSuperior,
                                     old_del.deleted,
                                     user_name(),
                                     'D',
                                     now() );
end;


create trigger tr_after_ins_VariaveisMedidas after insert order 1 on VariaveisMedidas
referencing new as new_ins for each row
begin 
INSERT INTO LogVariaveisMedidas (idCultura,
                                     idVariavel,
                                     limiteInferior,
                                     limiteSuperior,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_ins.idCultura,
                                     new_ins.idVariavel,
                                     new_ins.limiteInferior,
                                     new_ins.limiteSuperior,
                                     new_ins.deleted,
                                     user_name(),
                                     'I',
                                     now() );
end;


create trigger tr_after_upd_VariaveisMedidas after update of idCultura,
                                         idVariavel
order 1 on VariaveisMedidas
referencing new as new_upd old as old_upd for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
        INSERT INTO LogVariaveisMedidas (idCultura,
                                     idVariavel,
                                     limiteInferior,
                                     limiteSuperior,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_upd.idCultura,
                                     new_upd.idVariavel,
                                     new_upd.limiteInferior,
                                     new_upd.limiteSuperior,
                                     new_upd.deleted,
                                     user_name(),
                                     'U',
                                     now() );
end;

