DROP PROCEDURE IF EXISTS sp_createUser;
CREATE PROCEDURE sp_createUser (USERNAME VARCHAR(50) DEFAULT '', 
                                PASS VARCHAR(50) DEFAULT '',
                                GROUPNAME VARCHAR(50) DEFAULT '' )
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = USERNAME) THEN
  	EXECUTE IMMEDIATE 'DROP USER '  || USERNAME
  END IF;
  EXECUTE IMMEDIATE 'CREATE USER '  || USERNAME || ' IDENTIFIED BY ' ||  PASS;

  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = GROUPNAME ) THEN
       EXECUTE IMMEDIATE 'GRANT MEMBERSHIP IN GROUP ' ||  GROUPNAME || ' TO ' || USERNAME
  END IF;
END;
