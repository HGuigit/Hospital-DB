USE trabalho2;

-- 1. Quem são os diretores de um determinado hospital?

SELECT Funcionários.Nome as Diretores, Médicos.CRM as CRM, Hospitais.Nome as Hospital 
FROM Hospitais JOIN Médicos JOIN Funcionários 
WHERE (Hospitais.Código = Médicos.Gerência AND Médicos.NumMed = Funcionários.NúmeroFunc AND Hospitais.Código = 3);

-- Resultado Obtido:
# Diretores, CRM, Hospital
# 'Médico2', '1002', 'Albert Einstein'

-- 2. Quantas enfermarias tem um hospital, e quais são?
SELECT Hospitais.Nome as Hospital, Enfermarias.Nome as Enf
FROM Hospitais JOIN Enfermarias 
WHERE (Hospitais.Código = Enfermarias.Hospital)
GROUP BY Hospitais.Nome, Enf;

SELECT COUNT(*) as Número_enfermarias, Hospitais.Nome as Hospital
FROM Hospitais JOIN Enfermarias
WHERE (Hospitais.Código = Enfermarias.Hospital)
GROUP BY Hospitais.Nome;

-- Resultado obtido:
#  HOSPITAL          Nome_Enfermaria
# 'Albert Einstein', 'Enfermaria4'
# 'Albert Einstein', 'Enfermaria5'
# 'Albert Einstein', 'Enfermaria6'
# 'Santa Casa', 'Enfermaria1'
# 'Santa Casa', 'Enfermaria2'
# 'Santa Casa', 'Enfermaria3'
# 'Vasconcelos', 'Enfermaria7'
# 'Vasconcelos', 'Enfermaria8'

# Numero_Enfermarias   HOSPITAL
# '3', 'Albert Einstein'
# '3', 'Santa Casa'
# '2', 'Vasconcelos'

-- 3. Quantos leitos tem um determinado hospital?

SELECT Hospitais.Nome as Hospital, COUNT(*) as Num_Leitos 
FROM Hospitais JOIN Enfermarias JOIN Leitos 
WHERE (Hospitais.Código = Enfermarias.Hospital AND Enfermarias.Código = Leitos.Enfermaria AND Hospitais.Código = 1);

-- Resultado Obtido:
# Hospital	Num_Leitos
# Santa Casa	24


-- 4. Quantos médicos e/ou enfermeiros trabalham num hospital?

SELECT Hospitais.Nome as Hospital, COUNT(DISTINCT Funcionários.Nome)  as QTD_Med_Enf
FROM Hospitais JOIN Funcionários JOIN Médicos JOIN Enfermeiras JOIN Tem
WHERE (Médicos.NumMed = Funcionários.NúmeroFunc OR Enfermeiras.NumEnf = Funcionários.NúmeroFunc) AND
(Hospitais.Código = 3 AND Tem.Funcionario = Funcionários.NúmeroFunc AND Tem.Hospital = Hospitais.Código 
);

-- Resultado Obtido:
# Hospital	QTD_Med_Enf
# Albert Einstein	3

-- 5. Quantos pacientes estão internados em cada enfermaria de um determinado hospital?

SELECT COUNT(*) as Num_pacientes, Enfermarias.Nome as Enfermarias, Hospitais.Nome as Hospital
FROM Enfermarias JOIN Hospitais JOIN Leitos JOIN Pacientes_Internados 
WHERE (Hospitais.Código = Enfermarias.Hospital AND 
	   Enfermarias.Código = Leitos.Enfermaria AND
       Pacientes_Internados.Leito = Leitos.Código AND
       Hospitais.Código = 1
	)
GROUP BY Enfermarias.Código;

-- Resultado Obtido:
# Num_pacientes, Enfermarias, Hospital
# '2', 'Enfermaria1', 'Santa Casa'
# '1', 'Enfermaria3', 'Santa Casa'
    
-- 6. Qual é a demanda de um hospital (número de consultas) em um determinado período?

SELECT COUNT(DISTINCT Consultas.Data) as Num_consultas, Hospitais.Nome as Hospital
FROM Hospitais JOIN Tem JOIN Funcionários JOIN Médicos JOIN Consultas
WHERE (Hospitais.Código = Tem.Hospital AND
		Tem.Funcionario = Funcionários.NúmeroFunc AND
        Funcionários.NúmeroFunc = Médicos.NumMed AND
        Médicos.NumMed = Consultas.NumeroMed AND
        Hospitais.Código = 3 AND
        Consultas.Data BETWEEN "2019-01-20" AND "2023-12-10"
        );

-- Resultado Obtido:
# Num_consultas, Hospital
# '11', 'Albert Einstein'


-- 7. Quais são os hospitais mais procurados e qual é a enfermaria mais requisitada de cada hospital?

SELECT Hospitais.Nome as Hospital, COUNT(Pacientes_Internados.Paciente) AS EnfermariaMaisRequisitada, (COUNT(*))AS NumPacientesDoHospital 
FROM Hospitais JOIN Enfermarias JOIN Leitos JOIN Pacientes_Internados 
WHERE 
    Enfermarias.Hospital = Hospitais.Código AND 
    Leitos.Enfermaria = Enfermarias.Código AND 
    Pacientes_Internados.Leito = Leitos.Código 

GROUP BY Hospitais.Código 
ORDER BY NumPacientesDoHospital;

-- Resultado Obtido:
# Hospital, EnfermariaMaisRequisitada, NumPacientesDoHospital
# 'Santa Casa', '3', '3'

-- 8. Qual é o período característico de aparecimento de cada doença?

SELECT AVG(Consultas.Data) AS Média_Aparecimento, Patologias.Nome 
FROM (Consultas JOIN Diagnóstico ON (Diagnóstico.ref_NumeroMed = Consultas.NumeroMed 
		AND Diagnóstico.ref_RegPaciente = Consultas.RegistroPaciente
		AND Diagnóstico.ref_Data = Consultas.Data 
		AND Diagnóstico.ref_Hora = Consultas.Hora )) JOIN Patologias ON (Patologias.CID = Diagnóstico.DiagnPat) 
GROUP BY Patologias.CID;
    
-- Resultado Obtido:
# Média_Aparecimento, Nome
# '20166116.0000', 'Bronquite'
# '20200603.0000', 'Virose'
# '20131002.0000', 'Varíola'


-- 9. Quais são as doenças mais frequentes e quantos casos de cada uma aparece em um determinado período?

SELECT Patologias.CID, Patologias.Nome, COUNT(Consultas.Data) AS Num_De_Casos
FROM (Consultas JOIN Diagnóstico ON (Diagnóstico.ref_NumeroMed = Consultas.NumeroMed
		AND Diagnóstico.ref_RegPaciente = Consultas.RegistroPaciente
		AND Diagnóstico.ref_Data = Consultas.Data
		AND Diagnóstico.ref_Hora = Consultas.Hora
                            )) JOIN Patologias ON (Diagnóstico.DiagnPat = Patologias.CID)
WHERE Diagnóstico.ref_Data BETWEEN "2013-10-15" AND "2021-10-04"
GROUP BY Patologias.CID
ORDER BY Num_De_Casos DESC;

-- Resultado Obtido:
# CID, Nome, Num_De_Casos
#'112001', 'Bronquite', '2'
#'112004', 'Virose, '1'

-- 10. Quais são os remédios mais usados e quais são seus forncedores?

SELECT COUNT(Prescrevem.Nome_Remedio) AS Quantidade, Prescrevem.Nome_Remedio AS Nome_Remédio , Laboratórios.Nome AS Nome_Lab
FROM Prescrevem JOIN Remédios JOIN Laboratórios 
WHERE Prescrevem.Nome_Remedio = Remédios.Nome AND 
		Prescrevem.Formula_Remedio = Remédios.Formula AND 
		Remédios.Lab = Laboratórios.Código 
GROUP BY Nome_Remédio, Nome_Lab
ORDER BY Quantidade DESC;

-- Resultado Obtido:
# Quantidade, Nome_Remédio, Nome_Lab
# '2', 'Remedio4', 'RockRocha'
# '1', 'Remedio1', 'LaPoção'
