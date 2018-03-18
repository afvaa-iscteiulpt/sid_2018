DELETE FROM Medicoes;
DELETE FROM VariaveisMedidas;
DELETE FROM Variaveis;
DELETE FROM Cultura;
DELETE FROM Investigador;

/* Os inserts na tabela INVESTIGADOR, neste procedimento batch, devem ser feitos com id explicito, apesar de se manter o autoincremento,
   de modo a aseegurar a consistencia da chave estrangeira na tabela Cultura O SQL Anywhere retoma o autoincremento se nada for especificado no id */
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (1, 'user1@sid.pt', 'Investigador 1', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (2, 'user2@sid.pt', 'Investigador 2', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (3, 'user3@sid.pt', 'Investigador 3', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (4, 'user4@sid.pt', 'Investigador 4', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (5, 'user5@sid.pt', 'Investigador 5', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (6, 'user6@sid.pt', 'Investigador 6', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (7, 'user7@sid.pt', 'Investigador 7', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (8, 'user8@sid.pt', 'Investigador 8', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (9, 'user9@sid.pt', 'Investigador 9', 0);
INSERT INTO Investigador (idInvestigador, email, nomeInvestigador, deleted) VALUES (10, 'user10@sid.pt', 'Investigador 10', 0);

INSERT INTO Cultura (idCultura, idInvestigador, nomeCultura, limiteInferiorTemperatura, limiteSuperiorTemperatura, limiteInferiorHumidade, limiteSuperiorHumidade, deleted) VALUES (1, 1, 'Cult1', 10, 17, 70, 80, 0);
INSERT INTO Cultura (idCultura, idInvestigador, nomeCultura, limiteInferiorTemperatura, limiteSuperiorTemperatura, limiteInferiorHumidade, limiteSuperiorHumidade, deleted) VALUES (2, 1, 'Cult2', 11, 15, 65, 75, 0);
INSERT INTO Cultura (idCultura, idInvestigador, nomeCultura, limiteInferiorTemperatura, limiteSuperiorTemperatura, limiteInferiorHumidade, limiteSuperiorHumidade, deleted) VALUES (3, 1, 'Cult3', 8, 12, 75, 85, 0);
INSERT INTO Cultura (idCultura, idInvestigador, nomeCultura, limiteInferiorTemperatura, limiteSuperiorTemperatura, limiteInferiorHumidade, limiteSuperiorHumidade, deleted) VALUES (4, 2, 'Cult4', 13, 16, 60, 75, 0);
INSERT INTO Cultura (idCultura, idInvestigador, nomeCultura, limiteInferiorTemperatura, limiteSuperiorTemperatura, limiteInferiorHumidade, limiteSuperiorHumidade, deleted) VALUES (5, 3, 'Cult5', 15, 19, 70, 80, 0);

INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Temp1', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Temp2', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Temp3', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Temp4', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Temp5', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Humid1', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Humid2', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Humid3', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Humid4', 0);
INSERT INTO Variaveis (nomeVariavel, deleted) VALUES ('Humid5', 0);

INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (1, 1, 15, 16, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (2, 2, 16, 17, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (1, 6, 72, 75, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (3, 3, 14, 15, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (4, 5, 13, 14, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (2, 7, 70, 72, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (5, 4, 15, 16, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (3, 8, 76, 78, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (4, 9, 74, 76, 0);
INSERT INTO VariaveisMedidas (idCultura, idVariavel, limiteInferior, limiteSuperior, deleted) VALUES (5, 10, 72, 74, 0);

INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (1, 1, '2018-03-01 10:31', 10, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (2, 2, '2018-03-01 10:32', 12, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (1, 6, '2018-03-01 10:33', 14, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (3, 3, '2018-03-01 10:34', 15, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (4, 5, '2018-03-01 10:35', 16, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (2, 7, '2018-03-01 10:36', 15, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (5, 4, '2018-03-01 10:37', 14, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (3, 8, '2018-03-01 10:38', 12, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (4, 9, '2018-03-01 10:39', 10, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (5, 10, '2018-03-01 10:40', 10, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (1, 1, '2018-03-02 13:12', 12, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (2, 2, '2018-03-02 13:13', 14, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (1, 6, '2018-03-02 13:14', 15, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (3, 3, '2018-03-02 13:15', 16, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (4, 5, '2018-03-02 13:16', 15, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (2, 7, '2018-03-02 13:17', 14, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (5, 4, '2018-03-02 13:18', 13, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (3, 8, '2018-03-02 13:19', 12, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (4, 9, '2018-03-02 13:20', 11, 0);
INSERT INTO Medicoes (idCultura, idVariavel, dataHoraMedicao, valorMedicao, deleted) VALUES (5, 10, '2018-03-02 13:21', 10, 0);

INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:31', 5, 10);
INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:32', 6, 11);
INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:33', 7, 10);
INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:34', 8, 11);
INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:35', 5, 10);
INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:36', 6, 11);
INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:37', 7, 10);
INSERT INTO HumidadeTemperatura (dataHoraMedicao, valorMedicaoTemperatura, valorMedicaoHumidade) VALUES ('2018-03-01 10:38', 8, 11);