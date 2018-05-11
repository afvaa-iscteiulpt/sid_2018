
@ECHO ON

set startTime=%time%

"C:/Program Files/MySQL/MySQLServer/bin/mysql.exe" -u DBA -psqll -h 127.0.0.1 mysqlfile -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/FILEStoEXPORTandIMPORT3/Log_Cultura.txt' IGNORE INTO TABLE Log_Cultura fields terminated by ','"

"C:/Program Files/MySQL/MySQLServer/bin/mysql.exe" -u DBA -psqll -h 127.0.0.1 mysqlfile -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/FILEStoEXPORTandIMPORT3/Log_HumidadeTemperatura.txt' IGNORE INTO TABLE Log_HumidadeTemperatura fields terminated by ','"

"C:/Program Files/MySQL/MySQLServer/bin/mysql.exe" -u DBA -psqll -h 127.0.0.1 mysqlfile -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/FILEStoEXPORTandIMPORT3/Log_Investigadores.txt' IGNORE INTO TABLE Log_Investigadores fields terminated by ','"

"C:/Program Files/MySQL/MySQLServer/bin/mysql.exe" -u DBA -psqll -h 127.0.0.1 mysqlfile -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/FILEStoEXPORTandIMPORT3/Log_Medicoes.txt' IGNORE INTO TABLE Log_Medicoes fields terminated by ','"

"C:/Program Files/MySQL/MySQLServer/bin/mysql.exe" -u DBA -psqll -h 127.0.0.1 mysqlfile -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/FILEStoEXPORTandIMPORT3/Log_Variaveis.txt' IGNORE INTO TABLE Log_Variaveis fields terminated by ','"

"C:/Program Files/MySQL/MySQLServer/bin/mysql.exe" -u DBA -psqll -h 127.0.0.1 mysqlfile -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/FILEStoEXPORTandIMPORT3/Log_VariaveisMedidas.txt' IGNORE INTO TABLE Log_VariaveisMedidas fields terminated by ','"

"C:/Program Files/MySQL/MySQLServer/bin/mysql.exe" -u DBA -psqll -h 127.0.0.1 mysqlfile -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/FILEStoEXPORTandIMPORT3/Log_Consultas.txt' IGNORE INTO TABLE Log_Consultas fields terminated by ','"

echo Start Time: %startTime%
echo Finish Time: %time%

@ECHO OFF