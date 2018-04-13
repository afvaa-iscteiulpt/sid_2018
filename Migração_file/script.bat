@ECHO OFF

rem // 1.� parametro alterado - path para o mysql: "C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe"
rem // 2.� parametro alterado - path dos ficheiros, originalmente 'C:/Users/PC_USER/Desktop/': Z:/VM_SHAREDFOLDER/
rem // 3.� parametro alterado - nome das tabelas n�o tem "_".

rem // � preciso garantir que o utilizador root@localhost tem privil�gios para isto, por exemplo, da seguinte forma: grant all privileges on *.* to root@localhost identified by '' with grant option;  
rem // � preciso desabilitar no ficheiro my.ini a linha de configura��o seguinte: 
rem //      1. secure-file-priv="C:/ProgramData/MySQL/MySQL Server 5.7/Uploads", comentando-a e substituindo-a por secure-file-priv=""
rem //      2. ir aos servi�os do windows e reiniciar o servi�o MySQL Server 5.7.

@ECHO ON

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA INFILE 'Z:/VM_SHAREDFOLDER/LogCultura.txt' IGNORE INTO TABLE LogCultura fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA INFILE 'Z:/VM_SHAREDFOLDER/LogHumidadeTemperatura.txt' IGNORE INTO TABLE LogHumidadeTemperatura fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA INFILE 'Z:/VM_SHAREDFOLDER/LogInvestigadores.txt' IGNORE INTO TABLE LogInvestigadores fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA INFILE 'Z:/VM_SHAREDFOLDER/Desktop/LogMedicoes.txt' IGNORE INTO TABLE LogMedicoes fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA INFILE 'Z:/VM_SHAREDFOLDER/LogVariaveis.txt' IGNORE INTO TABLE LogVariaveis fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA INFILE 'Z:/VM_SHAREDFOLDER/Desktop/LogVariaveisMedidas.txt' IGNORE INTO TABLE LogVariaveisMedidas fields terminated by ','"

"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -h localhost basedados_auditor -e "LOAD DATA INFILE 'Z:/VM_SHAREDFOLDER/LogConsultas.txt' IGNORE INTO TABLE LogConsultas fields terminated by ','"

@ECHO OFF
rem // Allow a key-press to abort the wait; `/T` can be omitted:
timeout /T 5
rem // timeout /T 5 /NOBREAK > nul
