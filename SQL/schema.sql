create database clinica_medica;

GO
use clinica_medica;
GO

CREATE TABLE cliente 
( 
 id_cliente INT PRIMARY KEY ,  
 nome VARCHAR(20) NOT NULL,  
 telefone VARCHAR(20) NOT NULL,  
 email VARCHAR(20) NOT NULL,  
 cpf VARCHAR(20) NOT NULL,  
); 

CREATE TABLE endereço 
( 
 rua VARCHAR(20) NOT NULL,  
 CEP VARCHAR(20) NOT NULL,  
 estado VARCHAR(20) NOT NULL,  
 cidade VARCHAR(20) NOT NULL,  
 país VARCHAR(20) NOT NULL,  
 id_cliente INT NOT NULL,  
); 

CREATE TABLE paciente 
( 
 id_paciente INT PRIMARY KEY ,  
 animal VARCHAR(20) NOT NULL,  
 raça VARCHAR(20) NOT NULL,  
 peso FLOAT NOT NULL,  
 idade INT NOT NULL,  
 id_cliente INT NOT NULL,  
 id_medico INT NOT NULL,  
); 

CREATE TABLE médico 
( 
 id_medico INT PRIMARY KEY,  
 nome VARCHAR(20) NOT NULL,  
 CRM VARCHAR(20) NOT NULL,  
 especialidade VARCHAR(20) NOT NULL,  
 id_paciente INT,  
); 

CREATE TABLE consulta 
( 
 id_consulta INT PRIMARY KEY,  
 data DATE NOT NULL,  
 hora VARCHAR(20) NOT NULL,  
 id_paciente INT,  
); 

CREATE TABLE exame 
( 
 id_exame INT PRIMARY KEY,  
 especialidade VARCHAR(20) NOT NULL,  
 preço FLOAT NOT NULL,  
 id_pedido INT,  
); 

CREATE TABLE clinica 
( 
 id_clinica INT PRIMARY KEY,  
 id_medico INT,  
 nome VARCHAR(20) NOT NULL,  
 CNPJ VARCHAR(20) NOT NULL,  
 endereço VARCHAR(20) NOT NULL,  
); 

CREATE TABLE pedido_exame 
( 
 id_pedido INT PRIMARY KEY,  
 resultado VARCHAR(20) NOT NULL,  
 data_exame DATE NOT NULL,  
 valor_pagar VARCHAR(20) NOT NULL,  
 id_consulta INT,  
); 

ALTER TABLE endereço ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE paciente ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE paciente ADD FOREIGN KEY(id_medico) REFERENCES médico (id_medico);
ALTER TABLE médico ADD FOREIGN KEY(id_paciente) REFERENCES paciente (id_paciente);
ALTER TABLE consulta ADD FOREIGN KEY(id_paciente) REFERENCES paciente (id_paciente);
ALTER TABLE exame ADD FOREIGN KEY(id_pedido) REFERENCES pedido_exame (id_pedido);
ALTER TABLE clinica ADD FOREIGN KEY(id_medico) REFERENCES médico (id_medico);
ALTER TABLE pedido_exame ADD FOREIGN KEY(id_consulta) REFERENCES consulta (id_consulta);

select*from cliente;
select*from endereço;
select*from paciente;
select*from médico;
select*from consulta;
select*from exame;
select*from clinica;
select*from pedido_exame;

