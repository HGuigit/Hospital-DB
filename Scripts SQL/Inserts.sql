
-- Testes INSERT / SELECT / DELETE / UPDATE

-- SHOW TABLES;
USE trabalho2;

-- Criando Hospitais
INSERT INTO Hospitais VALUES (1, "Santa Casa", "Navajas", 525, 08750, "São Paulo", "SP", 40028922, 40038933, 40048944);
INSERT INTO Hospitais VALUES (2, "Vasconcelos", "Varajas", 1092, 08240, "Rio", "RJ", 40022289, 40033389, 40044489);
INSERT INTO Hospitais VALUES (3, "Albert Einstein", "RuaZ", 437, 05234, "São Paulo", "SP", 190190190, 222333444, 555666777);

-- Criando Enfermarias
INSERT INTO Enfermarias VALUES (1, "Enfermaria1", 6, 1);
INSERT INTO Enfermarias VALUES (2, "Enfermaria2", 10, 1);
INSERT INTO Enfermarias VALUES (3, "Enfermaria3", 9, 1);
INSERT INTO Enfermarias VALUES (4, "Enfermaria4", 12, 3);
INSERT INTO Enfermarias VALUES (5, "Enfermaria5", 21, 3);
INSERT INTO Enfermarias VALUES (6, "Enfermaria6", 8, 3);
INSERT INTO Enfermarias VALUES (7, "Enfermaria7", 6, 2);
INSERT INTO Enfermarias VALUES (8, "Enfermaria8", 7, 2);

-- Criando Leitos
INSERT INTO Leitos VALUES (1, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (2, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (3, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (4, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (5, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (6, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (7, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (8, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 2);
INSERT INTO Leitos VALUES (9, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (10, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 4);
INSERT INTO Leitos VALUES (11, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 5);
INSERT INTO Leitos VALUES (12, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 6);
INSERT INTO Leitos VALUES (13, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (14, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 2);
INSERT INTO Leitos VALUES (15, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (16, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 4);
INSERT INTO Leitos VALUES (17, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 5);
INSERT INTO Leitos VALUES (18, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 6);
INSERT INTO Leitos VALUES (19, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (20, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 2);
INSERT INTO Leitos VALUES (21, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (22, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 4);
INSERT INTO Leitos VALUES (23, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 5);
INSERT INTO Leitos VALUES (24, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 6);
INSERT INTO Leitos VALUES (25, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (26, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 2);
INSERT INTO Leitos VALUES (27, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (28, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 4);
INSERT INTO Leitos VALUES (29, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 5);
INSERT INTO Leitos VALUES (30, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 6);
INSERT INTO Leitos VALUES (31, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (32, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 2);
INSERT INTO Leitos VALUES (33, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (34, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 4);
INSERT INTO Leitos VALUES (35, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 5);
INSERT INTO Leitos VALUES (36, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 6);
INSERT INTO Leitos VALUES (37, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 1);
INSERT INTO Leitos VALUES (38, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 2);
INSERT INTO Leitos VALUES (39, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 3);
INSERT INTO Leitos VALUES (40, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 4);
INSERT INTO Leitos VALUES (41, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 5);
INSERT INTO Leitos VALUES (42, "Equipamento1", "Equipamento2", "Equipamento3", "Equipamento4", 6);

-- Criando Funcionários
INSERT INTO Funcionários VALUES (1, "Funcionário1", "Segurança" , "Manhã", "Noite", 1494.52);
INSERT INTO Funcionários VALUES (2, "Médico1", "Médico" , "Noite", "Tarde", 15000.99);
INSERT INTO Funcionários VALUES (3, "Médico2", "Médico" , "Noite", "Noite", 10245.42);
INSERT INTO Funcionários VALUES (4, "Enfermeira1", "Enfermagem" , "Manhã", "Tarde", 3000.00);
INSERT INTO Funcionários VALUES (5, "Enfermeira2", "Enfermagem" , "Manhã", "Noite", 2500.00);
INSERT INTO Funcionários VALUES (6, "AgAdminstrativo1", "Administração" , "Manhã", "Tarde", 2734.00);
INSERT INTO Funcionários VALUES (7, "AuxiliarEnf1", "Enfermagem" , "Noite", "Noite", 1780.54);
INSERT INTO Funcionários VALUES (8, "AuxiliarEnf2", "Enfermagem" , "Tarde", "Noite", 100000.43);
INSERT INTO Funcionários VALUES (9, "Médico3", "Médico" , "Noite", "Tarde", 14234.23);
INSERT INTO Funcionários VALUES (10, "Médico4", "Médico" , "Noite", "Tarde", 99000.45);

-- Criando Tem 
INSERT INTO Tem VALUES (1, 1);
INSERT INTO Tem VALUES (1, 2);
INSERT INTO Tem VALUES (2, 2);
INSERT INTO Tem VALUES (2, 3);
INSERT INTO Tem VALUES (3, 3);
INSERT INTO Tem VALUES (4, 3);
INSERT INTO Tem VALUES (5, 1);
INSERT INTO Tem VALUES (6, 2);
INSERT INTO Tem VALUES (7, 2);
INSERT INTO Tem VALUES (8, 2);

-- Criando Enfermeiras
INSERT INTO Enfermeiras VALUES (4);
INSERT INTO Enfermeiras VALUES (5);

-- Criando Auxiliares de Enfermagem
INSERT INTO Auxiliares_de_Enfermagem VALUES (7);
INSERT INTO Auxiliares_de_Enfermagem VALUES (8);

-- Criando Agentes Administrativos
INSERT INTO Agentes_Administrativos VALUES (6);

-- Criando Médicos
INSERT INTO Médicos VALUES (2,1001,499531,"Josemar",15,430,"São Paulo","SP",NULL);
INSERT INTO Médicos VALUES (3,1002,488420,"Tiradentes",16,213,"Rio Claro","SP",3);
INSERT INTO Médicos VALUES (9,1003,423420,"RuaY",12,214,"Rio Claro","SP",1);
INSERT INTO Médicos VALUES (10,1004,43420,"RuaZ",11,215,"Rio Claro","SP",2);


-- Criando Pacientes
INSERT INTO Pacientes VALUES (1, "João das dores", 123456321, "m", "1999-01-23", "Varnice", 1254, 5423541, "São Paulo", "SP");
INSERT INTO Pacientes VALUES (2, "Maria das dores", 1245344, "f", "1943-01-23", "Rua seila", 1263, 5423641, "Brasília", "DF");
INSERT INTO Pacientes VALUES (3, "Henrique das dores", 1234121, "m", "1994-02-26", "Nsarnice", 1212, 542641, "Goiânia", "GO");
INSERT INTO Pacientes VALUES (4, "Pedro das dores", 123456321, "m", "1992-01-23", "Rua nsei", 1233, 5213541, "BH", "MG");
INSERT INTO Pacientes VALUES (5, "Luiz das dores", 1666, "m", "1992-01-23", "carnice", 1251, 5421, "Muriaé", "MG");
INSERT INTO Pacientes VALUES (6, "José das dores", 12435, "m", "1991-01-23", "darnice", 1250, 542441, "Uberlânida","MG");
INSERT INTO Pacientes VALUES (7, "Abraão das dores", 145321, "m", "1990-01-23", "larnice", 1243, 63541, "Mogi", "SP");

-- Criando Pacientes Internados
INSERT INTO Pacientes_Internados VALUES (1, 1, "2008-10-23", "2008-11-30");
INSERT INTO Pacientes_Internados VALUES (6, 3, "2008-10-27", "2008-11-22");
INSERT INTO Pacientes_Internados VALUES (7, 5, "2008-10-10", "2008-11-10");

-- Criando Auxiliam
INSERT INTO Auxiliam VALUES (4, 5);

-- Criando Ajudadas
INSERT INTO Ajudadas VALUES (4, 7);
INSERT INTO Ajudadas VALUES (5, 8);

-- Criando Administram
INSERT INTO Administram VALUES  (6,3);
INSERT INTO Administram VALUES  (6,2);

-- Criando Cuidam
INSERT INTO Cuidam Values (4, 1, 1, "2008-10-23", "2008-11-30");
INSERT INTO Cuidam Values (5, 6, 3, "2008-10-27", "2008-11-22");
INSERT INTO Cuidam Values (4, 7, 5, "2008-10-10", "2008-11-10");

-- Criando Tratam
INSERT INTO Tratam Values (7, 1, 1, "2008-10-23", "2008-11-30");
INSERT INTO Tratam Values (8, 6, 3, "2008-10-27", "2008-11-22");
INSERT INTO Tratam Values (7, 7, 5, "2008-10-10", "2008-11-10");

-- Criando Responsáveis
INSERT INTO Responsáveis VALUES (2 , 1);
INSERT INTO Responsáveis VALUES (2 , 3);
INSERT INTO Responsáveis VALUES (2 , 4);
INSERT INTO Responsáveis VALUES (3 , 5);
INSERT INTO Responsáveis VALUES (3 , 6);
INSERT INTO Responsáveis VALUES (3 , 7);
INSERT INTO Responsáveis VALUES (3 , 2);

-- Consultas 
INSERT INTO Consultas VALUES (2, 1, "1877-08-23", "12:30");
INSERT INTO Consultas VALUES (3, 2, "2012-09-30", "16:00");
INSERT INTO Consultas VALUES (2, 1, "2021-05-02", "16:30");
INSERT INTO Consultas VALUES (2, 2, "2020-04-02", "14:40");
INSERT INTO Consultas VALUES (2, 3, "2022-11-14", "12:45");
INSERT INTO Consultas VALUES (2, 4, "2020-01-24", "13:50");
INSERT INTO Consultas VALUES (2, 5, "2013-11-02", "17:00");
INSERT INTO Consultas VALUES (2, 6, "2004-01-14", "18:30");
INSERT INTO Consultas VALUES (2, 5, "2002-03-12", "19:00");
INSERT INTO Consultas VALUES (2, 3, "2021-05-26", "20:00");
INSERT INTO Consultas VALUES (2, 7, "2020-06-23", "07:30");
INSERT INTO Consultas VALUES (3, 1, "1999-07-08", "11:35");
INSERT INTO Consultas VALUES (3, 2, "2020-06-13", "09:15");
INSERT INTO Consultas VALUES (3, 3, "2022-12-14", "10:10");
INSERT INTO Consultas VALUES (3, 4, "2020-11-30", "06:00");
INSERT INTO Consultas VALUES (3, 5, "2013-10-02", "07:10");
INSERT INTO Consultas VALUES (3, 6, "2004-01-23", "08:40");
INSERT INTO Consultas VALUES (3, 5, "2002-03-25", "14:20");
INSERT INTO Consultas VALUES (3, 3, "2021-05-11", "19:00");
INSERT INTO Consultas VALUES (3, 7, "2020-06-03", "10:30");

-- Criando Receitas
INSERT INTO Receitas VALUES (2, 2, "2020-04-02", "14:40", 1);
INSERT INTO Receitas VALUES (3, 4, "2020-11-30", "06:00", 2);
INSERT INTO Receitas VALUES (3, 5, "2002-03-25", "14:20", 3);
INSERT INTO Receitas VALUES (3, 7, "2020-06-03", "10:30", 4);


-- Criando Exames
INSERT INTO Exames VALUES (1, "Radiografia", 2, 1, "1877-08-23", "12:30" );
INSERT INTO Exames VALUES (2, "Sangue", 3, 2, "2012-09-30", "16:00");
INSERT INTO Exames VALUES (3, "Biópsia", 3, 5, "2002-03-25", "14:20");

-- Criando Patologias
INSERT INTO Patologias VALUES (112001, "Bronquite");
INSERT INTO Patologias VALUES (112002, "Pneumonia");
INSERT INTO Patologias VALUES (112003, "Caxumba");
INSERT INTO Patologias VALUES (112004, "Virose");
INSERT INTO Patologias VALUES (112005, "Cirrose");
INSERT INTO Patologias VALUES (112006, "Infecção");
INSERT INTO Patologias VALUES (112007, "Poliomelite");
INSERT INTO Patologias VALUES (112008, "Varíola");

-- Criando Identificam
INSERT INTO Identificam VALUES (2, 112005);
INSERT INTO Identificam VALUES (3, 112003);

-- Criando Laboratórios
INSERT INTO Laboratórios VALUES (1081, "LaPoção", 1478912, 1204578912, "Mística", 2500, 13800160, "Campinas", "SP");
INSERT INTO Laboratórios VALUES (1082, "RockRocha", 00045478912, 1234678912, "Guatás", 666, 13890160, "Fortaleza", "CE");
INSERT INTO Laboratórios VALUES (1083, "Jujuba Remédios", 01045478912, 00000010000, "Castanha", 013, 1881160, "Birigui", "SP");
INSERT INTO Laboratórios VALUES (1084, "Felizes", 80000234, 123000, "Cleiton", 455, 130160, "Curitiba", "PA");

-- Criando Remédios
INSERT INTO Remédios VALUES ("Remedio1", "Cloreto de Sódio", "MarcaMorte", "Este remédio cura doenças", 1081);
INSERT INTO Remédios VALUES ("Remedio2", "Cloreto de Amônia", "MarcaVida", "1% de chance de morte súbita", 1081);
INSERT INTO Remédios VALUES ("Remedio3", "Sulfato de Sódio", "TudoDoenças", "Este remédio não é recomendado para ninguém", 1082);
INSERT INTO Remédios VALUES ("Remedio4", "Sulfato de Amônia", "TudoDoenças", "1% de chance de se curar da doença", 1082);
INSERT INTO Remédios VALUES ("Remedio5", "Amoníaco", "MarcaMorte", "Este remédio cura doenças", 1083);
INSERT INTO Remédios VALUES ("Remedio6", "Ácido Sulfúrico", "Maldivas", "Beba-me", 1083);
INSERT INTO Remédios VALUES ("Remedio7", "Antibiótico", "Maldivas", "Coma-me", 1082);
INSERT INTO Remédios VALUES ("Remedio8", "Beladona", "TudoDoenças", "1% de chance de a pessoa encolher", 1083);

-- Criando Prescrevem
INSERT INTO Prescrevem VALUES (2, 2, "2020-04-02", "14:40", 1, "Remedio1", "Cloreto de Sódio");
INSERT INTO Prescrevem VALUES (3, 5, "2002-03-25", "14:20", 3, "Remedio4", "Sulfato de Amônia");
INSERT INTO Prescrevem VALUES (3, 7, "2020-06-03", "10:30", 4, "Remedio4", "Sulfato de Amônia");

-- Criando Diagnóstico
INSERT INTO Diagnóstico VALUES (112001, 2, 5, "2013-11-02", "17:00");
INSERT INTO Diagnóstico VALUES (112008, 3, 5, "2013-10-02", "07:10");
INSERT INTO Diagnóstico VALUES (112004, 3, 7, "2020-06-03", "10:30");
INSERT INTO Diagnóstico VALUES (112001, 3, 4, "2020-11-30", "06:00");

-- Criando Curam
INSERT INTO Curam VALUES(112001, "Remedio1", "Cloreto de Sódio");
INSERT INTO Curam VALUES(112002, "Remedio2", "Cloreto de Amônia");
INSERT INTO Curam VALUES(112003, "Remedio3", "Sulfato de Sódio");
INSERT INTO Curam VALUES(112004, "Remedio4", "Sulfato de Amônia");
INSERT INTO Curam VALUES(112005, "Remedio6", "Ácido Sulfúrico");
INSERT INTO Curam VALUES(112006, "Remedio5", "Amoníaco");
INSERT INTO Curam VALUES(112007, "Remedio7", "Antibiótico");
INSERT INTO Curam VALUES(112008, "Remedio8", "Beladona");





