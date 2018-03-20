/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     05/03/2018 19:12:19                          */
/*==============================================================*/
drop trigger if exists tr_del_Cultura;

drop trigger if exists tr_ins_Cultura;

drop trigger if exists tr_upd_Cultura;

drop trigger if exists tr_del_Investigador;

drop trigger if exists tr_ins_Investigadior;

drop trigger if exists tr_upd_Investigador;

drop trigger if exists tr_del_Medicoes;

drop trigger if exists tr_ins_Medicoes;

drop trigger if exists tr_upd_Medicoes;

drop trigger if exists tr_del_Variaveis;

drop trigger if exists tr_ins_Variaveis;

drop trigger if exists tr_upd_Variaveis;

drop trigger if exists tr_del_VariaveisMedidas;

drop trigger if exists tr_ins_VariaveisMedidas;

drop trigger if exists tr_upd_VariaveisMedidas;

drop trigger if exists tr_beforeInsUpdMedicoes;

create trigger tr_del_Cultura after delete order 1 on Cultura
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

create trigger tr_ins_Cultura after insert order 1 on Cultura
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

create trigger tr_upd_Cultura after update of idCultura,
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
                            new_ins.deleted,
                            user_name(),
                            'U',
                            now() );
end;

create trigger tr_del_Investigador after delete order 1 on Investigador
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

create trigger tr_ins_Investigadior after insert order 1 on Investigador
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

create trigger tr_upd_Investigador after update of idInvestigador
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

create trigger tr_del_Medicoes after delete order 1 on Medicoes
referencing old as old_del for each row
begin
    declare user_defined_exception exception for SQLSTATE '99999';
    declare found integer;
    INSERT INTO LogMedicoes			(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataMedicao,
                                     horaMedicao,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (old_del.idCultura,
                                     old_del.idVariavel,
                                     old_del.numeroMedicao,
                                     old_del.dataMedicao,
                                     old_del.horaMedicao,
                                     old_del.deleted,
                                     user_name(),
                                     'D',
                                     now() );    
end;

create trigger tr_ins_Medicoes after insert order 1 on Medicoes
referencing new as new_ins for each row
begin 
 INSERT INTO LogMedicoes 			(idCultura,
                                     idVariavel,
                                     numeroMedicao,
                                     dataMedicao,
                                     horaMedicao,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_ins.idCultura,
                                     new_ins.idVariavel,
                                     new_ins.numeroMedicao,
                                     new_ins.dataMedicao,
                                     new_ins.horaMedicao,
                                     new_ins.deleted,
                                     user_name(),
                                     'I',
                                     now() );
end;

create trigger tr_upd_Medicoes after update of idCultura,
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
                                     dataMedicao,
                                     horaMedicao,
                                     deleted,
                                     utilizador,
                                     operacao,
                                     dataOperacao)
            VALUES                  (new_upd.idCultura,
                                     new_upd.idVariavel,
                                     new_upd.numeroMedicao,
                                     new_upd.dataMedicao,
                                     new_upd.horaMedicao,
                                     new_upd.deleted,
                                     user_name(),
                                     'U',
                                     now() );    
end;

create trigger tr_del_Variaveis after delete order 1 on Variaveis
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

create trigger tr_ins_Variaveis after insert order 1 on Variaveis
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

create trigger tr_upd_Variaveis after update of idVariavel
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

create trigger tr_del_VariaveisMedidas after delete order 1 on VariaveisMedidas
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

create trigger tr_ins_VariaveisMedidas after insert order 1 on VariaveisMedidas
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

create trigger tr_upd_VariaveisMedidas after update of idCultura,
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

create trigger tr_beforeInsUpdMedicoes before insert, update
order 1 on Medicoes
REFERENCING NEW AS new_medicao
FOR EACH ROW
BEGIN
	DECLARE nomeInvestigador VARCHAR;

    SELECT Investigador.email INTO nomeInvestigador FROM Cultura, Medicoes, Investigador
    WHERE Medicoes.idCultura = Cultura.idCultura AND Cultura.idInvestigador = Investigador.idInvestigador;

    IF nomeInvestigador <> user_name() THEN 
        RAISERROR 23000 'Não pode alterar medicoes de culturas de outros investigadores'
    END IF;
END;

