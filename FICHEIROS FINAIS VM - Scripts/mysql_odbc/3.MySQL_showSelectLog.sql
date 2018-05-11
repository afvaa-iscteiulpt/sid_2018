DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_showSelectLog`(IN _arg_command varchar(1024))
BEGIN
	SET @command=_arg_command;

	PREPARE stmt FROM @command;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;