tutoriais mongodb:

ambos os tutoriais foram executados nas vms

https://pplware.sapo.pt/tutoriais/mongodb-instalar-e-configurar-a-bd-nosql-no-windows-10/
https://pplware.sapo.pt/tutoriais/mongodb-manipular-base-dados-nosql-no-windows-10-p2/

-----

para simular o que � suposto: 
atrav�s do https://eclipse.org/paho/clients/js/utility/ envia-se dados (publish) para o topico (adicionado na barra de favoritos no chrome na VM)
atrav�s do eclipse recebe-se dados do topico (class exemplo disponivel no eclipse que esta no ambiente de trabalho da VM)


depois quando tivermos na execu��o final o que acontece �:
o sensor envia para o topico automaticamente e o java recebe os dados (porque o broker � responsavel por enviar os dados a todos os clientes automaticamente). 


----
dentro do eclipse existem dois projetos:
project_test -> para testes rapidos (nao vai estar no github, cada um de n�s tem um projeto de teste para testar tudo antes de submeter ao github - j� inclui duas classes, uma com os imports referido na pagina da cadeira, e outra com um exemplo retirado do site oficial)
project_final -> este project esta no github e � onde todos vamos trabalhar (ja enviei convite para voces, deve estar no email), o github Desktop tambem ja tem o projeto, apenas tem de fazer login com o vosso user
https://github.com/afvaa-iscteiulpt/project_final

----
os tr�s jars (libraries) ja estao adicionados a ambos os projetos (test e final)
- jackson-all-1.9.0.jar
- org.eclipse.paho.client.mqttv3-1.1.0.jar
- sajdbc4.jar
-----