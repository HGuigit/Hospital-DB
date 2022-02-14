CREATE SCHEMA trabalho2;

-- SHOW TABLES;

USE trabalho2;

CREATE TABLE Hospitais
(
	Código INT(6) UNSIGNED NOT NULL PRIMARY KEY, 
	Nome VARCHAR(30) NOT NULL UNIQUE, 
	Rua VARCHAR(10), 
	Número INT, 
	CEP INT(10) UNSIGNED, 
	Cidade VARCHAR(10), 
	Estado CHAR(2), 
	Fone1 INT(9) UNSIGNED, 
	Fone2 INT UNSIGNED, 
	Fone3 INT UNSIGNED 
); 

CREATE TABLE Enfermarias 
( 
	Código				INTEGER(6) UNSIGNED NOT NULL,
	Nome				VARCHAR(30) NOT NULL,
	Número_de_Leitos	INTEGER(3) UNSIGNED NOT NULL CHECK (Número_de_Leitos > 5),
	Hospital			INTEGER(6) UNSIGNED NOT NULL,
	PRIMARY KEY (Código),
	UNIQUE (Nome),
	FOREIGN KEY (Hospital) REFERENCES Hospitais(Código)
);

CREATE TABLE Funcionários(
	NúmeroFunc INTEGER(6) UNSIGNED NOT NULL,
    Nome VARCHAR(30),
    Função VARCHAR(30),
    Turno1 VARCHAR(10),
    Turno2 VARCHAR(10),
    Salário FLOAT,
    PRIMARY KEY(NúmeroFunc),
    UNIQUE(Nome)
);

CREATE TABLE Leitos 
(
	Código INT(6) UNSIGNED NOT NULL PRIMARY KEY, 
	Equip1 TEXT, 
	Equip2 TEXT, 
	Equip3 TEXT, 
	Equip4 TEXT, 
	Enfermaria INT(6) UNSIGNED NOT NULL,
	FOREIGN KEY (Enfermaria) REFERENCES Enfermarias(Código)
); 

CREATE TABLE Enfermeiras 
(
	NumEnf	INT (6) UNSIGNED NOT NULL,
	PRIMARY KEY (NumEnf),
	FOREIGN KEY (NumEnf) REFERENCES Funcionários(NúmeroFunc)
);


CREATE TABLE Auxiliares_de_Enfermagem
(
	NumAux INT(6) UNSIGNED NOT NULL PRIMARY KEY, 
	FOREIGN KEY (NumAux) REFERENCES Funcionários (NúmeroFunc)
); 

CREATE TABLE Agentes_Administrativos
(
	NumAg	INT (6) UNSIGNED NOT NULL PRIMARY KEY,
	FOREIGN KEY (NumAg) REFERENCES Funcionários (NúmeroFunc)
);

CREATE TABLE Médicos
(
	NumMed		INT (6) UNSIGNED NOT NULL,
	CRM			INT (10) UNSIGNED NOT NULL,
	CPF			INT (11) UNSIGNED,
	Rua 		VARCHAR(10), 
	Número 		INT (10) UNSIGNED, 
	CEP 		INT(10) UNSIGNED, 
	Cidade 		VARCHAR(10), 
	Estado 		CHAR(2),
	Gerência	INT (6) UNSIGNED,
	PRIMARY KEY (NumMed),
	UNIQUE (CRM),
	FOREIGN KEY (NumMed) REFERENCES Funcionários (NúmeroFunc),
	FOREIGN KEY (Gerência) REFERENCES Hospitais (Código)
);

CREATE TABLE Pacientes
(
	NumeroRegistro	INT (6) UNSIGNED NOT NULL,
	Nome			VARCHAR (30),
	RG				INT (10) UNSIGNED,
	Sexo			ENUM ("m","f"),
	DataNasc		DATE,
	Rua 			VARCHAR(10), 
	Número 			INT (10) UNSIGNED, 
	CEP 			INT(10) UNSIGNED, 
	Cidade 			VARCHAR(10), 
	Estado 			CHAR(2),
	PRIMARY KEY (NumeroRegistro)			
);

CREATE TABLE Pacientes_Internados
(
	Paciente		INT (6) UNSIGNED NOT NULL,
	Leito			INT (6) UNSIGNED NOT NULL,
	Data_Internação	DATE NOT NULL,
	Data_Alta		DATE NOT NULL,
	PRIMARY KEY (Paciente, Leito, Data_Internação, Data_Alta),
	FOREIGN KEY (Paciente) REFERENCES Pacientes (NumeroRegistro),
	FOREIGN KEY (Leito) REFERENCES Leitos (Código)
);

CREATE TABLE Consultas
(
	NumeroMed 			INT(6) UNSIGNED NOT NULL,
    RegistroPaciente 	INT(6) UNSIGNED NOT NULL,
    Data				DATE NOT NULL,
    Hora				TIME NOT NULL,
	PRIMARY KEY 		(NumeroMed, RegistroPaciente, Data, Hora),
    FOREIGN KEY 		(NumeroMed) REFERENCES Médicos(NumMed),
    FOREIGN KEY 		(RegistroPaciente) REFERENCES Pacientes(NumeroRegistro)
);

CREATE TABLE Receitas 
(
	ref_NumeroMed	INT (6) UNSIGNED NOT NULL,
	ref_RegPaciente	INT (6) UNSIGNED NOT NULL,
	ref_Data		DATE NOT NULL,
	ref_Hora		TIME NOT NULL,
	Numero		 INT (6) UNSIGNED NOT NULL,
	PRIMARY KEY (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora, Numero),
	FOREIGN KEY (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora) REFERENCES Consultas (NumeroMed, RegistroPaciente, Data, Hora)
);

CREATE TABLE Laboratórios 
(
	Código			INT (6) UNSIGNED NOT NULL,
	Nome			VARCHAR (30) NOT NULL,
	Fone1			INT (12) UNSIGNED,
	Fone2			INT (12) UNSIGNED,
	Rua 			VARCHAR(10), 
	Número 			INT (10) UNSIGNED, 
	CEP 			INT(10) UNSIGNED, 
	Cidade 			VARCHAR(10), 
	Estado 			CHAR(2),
	PRIMARY KEY (Código),
	UNIQUE (Nome)		
);


CREATE TABLE Exames
(
	COD				INT (6) UNSIGNED NOT NULL,
	Nome			VARCHAR (30) NOT NULL,
	ref_NumeroMed	INT (6) UNSIGNED NOT NULL,
	ref_RegPaciente	INT (6) UNSIGNED NOT NULL,
	ref_Data		DATE NOT NULL,
	ref_Hora		TIME NOT NULL,
	PRIMARY KEY (COD),
	UNIQUE (Nome),
	FOREIGN KEY (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora)  REFERENCES Consultas (NumeroMed, RegistroPaciente, Data, Hora)
);

CREATE TABLE Remédios 
(
	Nome VARCHAR(30) NOT NULL, 
	Formula VARCHAR(100) NOT NULL, 
	Marca VARCHAR(15), 
	Bula LONGTEXT, 
	Lab INT(6) UNSIGNED NOT NULL, 
	PRIMARY KEY(Nome, Formula),
	FOREIGN KEY (Lab) REFERENCES Laboratórios(Código)
); 

CREATE TABLE Patologias 
(
	CID INT(6) UNSIGNED NOT NULL,
	Nome VARCHAR(30) NOT NULL UNIQUE,
	PRIMARY KEY(CID) 
); 

CREATE TABLE Diagnóstico 
(
	DiagnPat INT(6) UNSIGNED NOT NULL, 
    ref_NumeroMed	INT (6) UNSIGNED NOT NULL,
	ref_RegPaciente	INT (6) UNSIGNED NOT NULL,
	ref_Data		DATE NOT NULL,
	ref_Hora		TIME NOT NULL,
	PRIMARY KEY (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora, DiagnPat), 
	FOREIGN KEY (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora)  REFERENCES Consultas(NumeroMed, RegistroPaciente, Data, Hora), 
	FOREIGN KEY (DiagnPat) REFERENCES Patologias(CID) 
); 

CREATE TABLE Curam
(
	CID_Patologia INT(6) UNSIGNED NOT NULL, 
	Nome_Remedio VARCHAR(30) NOT NULL, 
	Formula_Remedio VARCHAR(100) NOT NULL, 
	PRIMARY KEY(CID_Patologia, Nome_Remedio, Formula_Remedio), 
	FOREIGN KEY (CID_Patologia) REFERENCES Patologias(CID), 
	FOREIGN KEY (Nome_Remedio, Formula_Remedio) REFERENCES Remédios(Nome, Formula) 
); 


CREATE TABLE Prescrevem 
(
	ref_NumeroMed	INT (6) UNSIGNED NOT NULL,
	ref_RegPaciente	INT (6) UNSIGNED NOT NULL,
	ref_Data		DATE NOT NULL,
	ref_Hora		TIME NOT NULL,
    numReceita 		INT (6) UNSIGNED NOT NULL,
	Nome_Remedio VARCHAR(30) NOT NULL, 
	Formula_Remedio VARCHAR(100) NOT NULL, 
	PRIMARY KEY (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora, Nome_Remedio, Formula_Remedio),
	FOREIGN KEY (Nome_Remedio, Formula_Remedio) REFERENCES Remédios(Nome, Formula) ,
	FOREIGN KEY (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora, numReceita)  REFERENCES Receitas (ref_NumeroMed, ref_RegPaciente, ref_Data, ref_Hora, Numero)
); 

CREATE TABLE Auxiliam 
(
	Enf INT(6) UNSIGNED NOT NULL, 
	EnAux INT(6) UNSIGNED NOT NULL, 
	PRIMARY KEY (Enf, EnAux), 
	FOREIGN KEY (Enf) REFERENCES Enfermeiras(NumEnf), 
	FOREIGN KEY (EnAux) REFERENCES Enfermeiras(NumEnf)
); 

CREATE TABLE Ajudadas
(
	Enf INT(6) UNSIGNED NOT NULL, 
	AuxEnf INT(6) UNSIGNED NOT NULL, 
	PRIMARY KEY (Enf, AuxEnf), 
	FOREIGN KEY (Enf) REFERENCES Enfermeiras(NumEnf), 
	FOREIGN KEY (AuxEnf) REFERENCES Auxiliares_de_Enfermagem(NumAux)
); 

CREATE TABLE Administram
(
	Numero_Func  INT(6) UNSIGNED NOT NULL, 
	COD_Hospital INT(6) UNSIGNED NOT NULL, 
	PRIMARY KEY (Numero_Func, COD_Hospital), 
	FOREIGN KEY (COD_Hospital) REFERENCES  Hospitais(Código), 
	FOREIGN KEY (Numero_Func) REFERENCES Agentes_Administrativos(NumAg)
); 

CREATE TABLE Cuidam 
(
	Enfermeira 			INT(6) UNSIGNED NOT NULL, 
	ref_Paciente		INT (6) UNSIGNED NOT NULL,
	ref_Leito			INT (6) UNSIGNED NOT NULL,
	ref_Data_Internação	DATE NOT NULL,
	ref_Data_Alta		DATE NOT NULL,
	PRIMARY KEY (Enfermeira, ref_Paciente, ref_Leito, ref_Data_Internação, ref_Data_Alta), 
	FOREIGN KEY (Enfermeira) REFERENCES Enfermeiras(NumEnf), 
	FOREIGN KEY (ref_Paciente, ref_Leito, ref_Data_Internação, ref_Data_Alta) REFERENCES Pacientes_Internados (Paciente,  Leito, Data_Internação, Data_Alta) 
); 

CREATE TABLE Tratam 
(
	Numero_Func  		INT(6) UNSIGNED NOT NULL, 
	ref_Paciente		INT (6) UNSIGNED NOT NULL,
	ref_Leito			INT (6) UNSIGNED NOT NULL,
	ref_Data_Internação	DATE NOT NULL,
	ref_Data_Alta		DATE NOT NULL,
	FOREIGN KEY (Numero_Func) REFERENCES Auxiliares_de_Enfermagem(NumAux), 
	FOREIGN KEY (ref_Paciente, ref_Leito, ref_Data_Internação, ref_Data_Alta) REFERENCES Pacientes_Internados(Paciente, Leito, Data_Internação, Data_Alta) 
); 

CREATE TABLE Responsáveis 
(
	Médico INT(6) UNSIGNED NOT NULL, 
	Paciente INT(6) UNSIGNED NOT NULL, 
	PRIMARY KEY(Médico, Paciente),
	FOREIGN KEY (Médico) REFERENCES Médicos(NumMed),
	FOREIGN KEY (Paciente) REFERENCES Pacientes (NumeroRegistro)	
); 

CREATE TABLE Identificam
(
	Exame INT(6) UNSIGNED NOT NULL, 
	Patologia INT(6) UNSIGNED NOT NULL, 
	PRIMARY KEY(Exame, Patologia), 
	FOREIGN KEY (Exame) REFERENCES Exames(Cod), 
	FOREIGN KEY (Patologia) REFERENCES Patologias(CID)
); 


CREATE TABLE Tem
(
	Funcionario INT(6) UNSIGNED NOT NULL, 
	Hospital INT(6) UNSIGNED NOT NULL, 
	PRIMARY KEY(Funcionario, Hospital), 
	FOREIGN KEY (Funcionario) REFERENCES Funcionários(NúmeroFunc), 
	FOREIGN KEY (Hospital) REFERENCES Hospitais(Código)
); 





















