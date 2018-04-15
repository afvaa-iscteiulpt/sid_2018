/*
CREATE INVESTIGADOR
*/
// Falta retirar as ' ' entre o email. Precisa-se de descobrir como ler a variavel em vez do nome da variavel.
// Neste momento ele nao intrepreta as variaveis, apenas reconhece email.
DROP PROCEDURE IF EXISTS sp_createInvestigador;

CREATE PROCEDURE sp_createInvestigador(IN email VARCHAR(50) DEFAULT '', IN pass VARCHAR(50) DEFAULT '')
BEGIN
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'email') THEN //
  	DROP USER email
  END IF;
  CREATE USER email IDENTIFIED BY pass;
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores') THEN
     GRANT MEMBERSHIP IN GROUP "Investigadores" TO email
  END IF;
  IF NOT EXISTS (SELECT * FROM DBA.Investigador where DBA.Investigador.email = 'email') THEN
    INSERT INTO DBA.Investigador (email, nomeInvestigador, deleted) VALUES ('email', 'email', 0)
  END IF;
END;

/* 
ALTER INVESTIGADOR
*/
// @old_email nao funciona pois ele lê o nome da variavel em vez do conteudo da mesma...
DROP PROCEDURE IF EXISTS sp_alterInvestigador;
CREATE PROCEDURE sp_alterInvestigador (IN INVID INTEGER, EMAIL VARCHAR(50) DEFAULT '', USERNAME VARCHAR(100) DEFAULT '')
BEGIN 
DECLARE @old_email varchar(15);
SELECT (SELECT DBA.Investigador.email FROM DBA.Investigador WHERE DBA.Investigador.idInvestigador = INVID) INTO @old_email;
  IF EXISTS (SELECT DBA.Investigador.email FROM DBA.Investigador WHERE DBA.Investigador.idInvestigador = INVID) THEN
      UPDATE DBA.Investigador SET DBA.Investigador.email = EMAIL, DBA.Investigador.nomeInvestigador = USERNAME
        WHERE DBA.Investigador.idInvestigador = INVID;
      DROP USER @old_email;
      CREATE USER EMAIL IDENTIFIED BY 'password';
  END IF;
END;

/*
DROP INVESTIGADOR
*/
DROP PROCEDURE IF EXISTS sp_dropInvestigador;
CREATE PROCEDURE sp_dropInvestigador (EMAIL VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = EMAIL) THEN
    EXECUTE IMMEDIATE 'DROP USER ' || EMAIL;
  END IF;

  IF EXISTS (SELECT * FROM DBA.Investigador where DBA.Investigador.email = EMAIL) THEN
    EXECUTE IMMEDIATE 'DELETE FROM DBA.Investigador WHERE DBA.Investigador.email = ' || EMAIL;
  END IF;
END;

