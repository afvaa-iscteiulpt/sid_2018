CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showSelectLog`(IN arg_command VARCHAR(1024))
BEGIN
	SET @command=arg_command;

	PREPARE stmt FROM @command;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END