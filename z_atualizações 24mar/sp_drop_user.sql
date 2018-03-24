DROP PROCEDURE IF EXISTS sp_dropUser;
CREATE PROCEDURE sp_dropUser (USERNAME VARCHAR(50) DEFAULT '')
BEGIN 
  IF EXISTS (SELECT * FROM dbo.sysusers where dbo.sysusers.name = USERNAME) THEN
  	EXECUTE IMMEDIATE 'DROP USER '  || USERNAME
  END IF;
END;
