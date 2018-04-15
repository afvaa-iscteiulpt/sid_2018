@ECHO OFF

rem // 1.º parametro alterado - path para o mysql: "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe"
rem // 2.º parametro alterado - path dos ficheiros, originalmente 'C:/Users/PC_USER/Desktop/': Z:/VM_SHAREDFOLDER/

rem // É preciso garantir que o utilizador root@localhost tem privilégios para isto, por exemplo, da seguinte forma: grant all privileges on *.* to root@localhost identified by '' with grant option;  
rem // É preciso desabilitar no ficheiro my.ini a linha de configuração seguinte: 
rem //      1. secure-file-priv="C:/ProgramData/MySQL/MySQL Server 5.7/Uploads", comentando-a e substituindo-a por secure-file-priv=""
rem //      2. ir aos serviços do windows e reiniciar o serviço MySQL Server 5.7.

@ECHO ON

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/Log_Cultura.txt' IGNORE INTO TABLE Log_Cultura fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/Log_HumidadeTemperatura.txt' IGNORE INTO TABLE Log_HumidadeTemperatura fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/Log_Investigadores.txt' IGNORE INTO TABLE Log_Investigadores fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/Log_Medicoes.txt' IGNORE INTO TABLE Log_Medicoes fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/Log_Variaveis.txt' IGNORE INTO TABLE Log_Variaveis fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/Log_VariaveisMedidas.txt' IGNORE INTO TABLE Log_VariaveisMedidas fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA LOCAL INFILE 'Z:/VM_SHAREDFOLDER/Log_Consultas.txt' IGNORE INTO TABLE Log_Consultas fields terminated by ','"

@ECHO OFF
rem // Allow a key-press to abort the wait; `/T` can be omitted:
timeout /T 5
rem // timeout /T 5 /NOBREAK > nul
