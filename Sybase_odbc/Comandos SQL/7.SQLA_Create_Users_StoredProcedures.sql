/*
CREATE INVESTIGADOR
*/
DROP PROCEDURE IF EXISTS sp_createInvestigador;
CREATE PROCEDURE sp_createInvestigador (useremail VARCHAR(50) DEFAULT '', 
                                pass VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = useremail) THEN
  	EXECUTE IMMEDIATE 'DROP USER '  || useremail
  END IF;
  EXECUTE IMMEDIATE 'CREATE USER '  || useremail || ' IDENTIFIED BY ' ||  pass;

  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores' ) THEN
       EXECUTE IMMEDIATE 'GRANT MEMBERSHIP IN GROUP Investigadores TO ' || useremail
  END IF;
  IF NOT EXISTS (SELECT * FROM DBA.Investigador where DBA.Investigador.email = useremail) THEN
    INSERT INTO DBA.Investigador(email, nomeInvestigador, deleted) VALUES (useremail, useremail, 0);
  END IF;
END;

/* 
ALTER INVESTIGADOR
*/
DROP PROCEDURE IF EXISTS sp_alterInvestigador;
CREATE PROCEDURE sp_alterInvestigador (IN invid INTEGER, useremail VARCHAR(50) DEFAULT '', username VARCHAR(100) DEFAULT '')
BEGIN 
  DECLARE old_email varchar(50);
  SELECT (SELECT DBA.Investigador.email FROM DBA.Investigador WHERE DBA.Investigador.idInvestigador = INVID) INTO old_email;
  IF EXISTS (SELECT DBA.Investigador.email FROM DBA.Investigador WHERE DBA.Investigador.idInvestigador = INVID) THEN
    UPDATE DBA.Investigador SET DBA.Investigador.email = useremail, DBA.Investigador.nomeInvestigador = username
      WHERE DBA.Investigador.idInvestigador = invid;
    EXECUTE IMMEDIATE 'DROP USER '  || old_email;
    EXECUTE IMMEDIATE 'CREATE USER '  || useremail || ' IDENTIFIED BY password';    
  END IF;
END;

/*
DROP INVESTIGADOR
*/
DROP PROCEDURE IF EXISTS sp_dropInvestigador;
CREATE PROCEDURE sp_dropInvestigador (useremail VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = useremail) THEN
    EXECUTE IMMEDIATE 'DROP USER ' || useremail;
  END IF;

  IF EXISTS (SELECT * FROM DBA.Investigador where DBA.Investigador.email = useremail) THEN
    DELETE FROM DBA.Investigador WHERE DBA.Investigador.email = useremail;
  END IF;
END;

/*
CREATE ADMINISTRADOR
*/
DROP PROCEDURE IF EXISTS sp_createAdministrador;

CREATE PROCEDURE sp_createAdministrador(IN username VARCHAR(50) DEFAULT '', IN pass VARCHAR(50) DEFAULT '')
BEGIN
    IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = username) THEN
  	EXECUTE IMMEDIATE 'DROP USER '  || username
  END IF;
  EXECUTE IMMEDIATE 'CREATE USER '  || username || ' IDENTIFIED BY ' ||  pass;
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Administradores' ) THEN
       EXECUTE IMMEDIATE 'GRANT MEMBERSHIP IN GROUP Administradores TO ' || username
  END IF;
END;

/*
DROP ADMINISTRADOR
*/
// Falta ter a certeza que esta a eliminar um admin e nao outro user qualquer: sysaccess doesn't exist
DROP PROCEDURE IF EXISTS sp_dropAdministrador;
CREATE PROCEDURE sp_dropAdministrador (username VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = username) THEN
    EXECUTE IMMEDIATE 'DROP USER ' || username;
  END IF;
END;

