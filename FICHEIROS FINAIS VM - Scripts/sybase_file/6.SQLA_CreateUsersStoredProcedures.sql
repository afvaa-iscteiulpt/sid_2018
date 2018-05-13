/*
CREATE INVESTIGADOR
*/
DROP PROCEDURE IF EXISTS createInvestigador;
CREATE PROCEDURE createInvestigador (USERNAME VARCHAR(50) DEFAULT '', 
                                PASS VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = USERNAME) THEN
  	EXECUTE IMMEDIATE 'DROP USER '  || USERNAME
  END IF;
  EXECUTE IMMEDIATE 'CREATE USER '  || USERNAME || ' IDENTIFIED BY ' ||  PASS;

  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Investigadores' ) THEN
       EXECUTE IMMEDIATE 'GRANT MEMBERSHIP IN GROUP Investigadores TO ' || USERNAME
  END IF;
END;

/*
CREATE ADMINISTRADOR
*/
DROP PROCEDURE IF EXISTS createAdministrador;
CREATE PROCEDURE createAdministrador (USERNAME VARCHAR(50) DEFAULT '', 
                                PASS VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = USERNAME) THEN
  	EXECUTE IMMEDIATE 'DROP USER '  || USERNAME
  END IF;
  EXECUTE IMMEDIATE 'CREATE USER '  || USERNAME || ' IDENTIFIED BY ' ||  PASS;

  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = 'Administradores' ) THEN
       EXECUTE IMMEDIATE 'GRANT MEMBERSHIP IN GROUP Administradores TO ' || USERNAME
  END IF;
END;

/*
DELETE INVESTIGADOR
*/
DROP PROCEDURE IF EXISTS deleteInvestigador;
CREATE PROCEDURE deleteInvestigador (USERNAME VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = USERNAME) THEN
  	EXECUTE IMMEDIATE 'DROP USER '  || USERNAME
  END IF;
END;
