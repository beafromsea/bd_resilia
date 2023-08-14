CREATE DATABASE bd_resilia;

USE bd_resilia;
    
CREATE TABLE `Pessoas` (
  `id` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60),
  `data_nasc` DATE,
  `cpf` BIGINT,
  `rg` VARCHAR(10),
  `endereco` VARCHAR(100),
  `telefone` BIGINT,
  `email` VARCHAR(60),
  `pcd` VARCHAR(3)
);

CREATE TABLE `Desempenhos` (
  `id` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nota_indiv` INT,
  `nota_grupo` INT,
  `frequencia` VARCHAR(60)
);

CREATE TABLE `Modulos` (
  `id` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100),
  `descricao` VARCHAR(100),
  `qtd_aulas` INT,
  `carga_horaria` INT,
  `intensidade` INT
);

CREATE TABLE `Estudantes` (
  `id` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nivel_escolaridade` VARCHAR(60),
  `nivel_aprov` VARCHAR(100),
  `id_desempenho_fk` INT,
  `id_pessoas_fk` INT,
   FOREIGN KEY (`id_desempenho_fk`) REFERENCES `Desempenhos` (`id`),
   FOREIGN KEY (`id_pessoas_fk`) REFERENCES `Pessoas` (`id`)
);

CREATE TABLE `Facilitadores` (
  `id` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `formacao` VARCHAR(100),
  `especialidade` VARCHAR(100),
  `id_pessoas_fk` INT,
  FOREIGN KEY (`id_pessoas_fk`) REFERENCES `Pessoas` (`id`)
);

CREATE TABLE `Cursos` (
  `id` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `duracao` INT,
  `id_modulos_fk` INT,
  FOREIGN KEY (`id_modulos_fk`) REFERENCES `Modulos` (`id`)
);

CREATE TABLE `Turmas` (
  `id` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `organizacao` VARCHAR(100),
  `nome` VARCHAR(100),
  `qtd_alunos` INT,
  `facilitador` INT,
  `qtd_modulos` INT,
  `turno` ENUM('manha', 'tarde', 'noite')
);

ALTER TABLE `Estudantes` ADD FOREIGN KEY (`id_desempenho_fk`) REFERENCES `Desempenhos` (`id`);

ALTER TABLE `Estudantes` ADD FOREIGN KEY (`id_pessoas_fk`) REFERENCES `Pessoas` (`id`);

ALTER TABLE `Facilitadores` ADD FOREIGN KEY (`id_pessoas_fk`) REFERENCES `Pessoas` (`id`);