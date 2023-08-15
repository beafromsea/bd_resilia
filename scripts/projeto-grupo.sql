CREATE DATABASE bd_resilia;

USE bd_resilia;

CREATE TABLE `Enderecos` (
  `endereco_id` INT PRIMARY KEY AUTO_INCREMENT,
  `rua` VARCHAR(100) NOT NULL,
  `numero` VARCHAR(7) NOT NULL,
  `complemento` VARCHAR(50),
  `bairro` VARCHAR(25) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(8) NOT NULL
);

CREATE TABLE `Pessoas` (
  `pessoa_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `nivel_escolaridade` VARCHAR(60) NOT NULL,
  `pcd` VARCHAR(5),
  `endereco_id` INT NOT NULL
);

CREATE TABLE `Estudantes` (
  `estudante_id` INT PRIMARY KEY AUTO_INCREMENT,
  `senha` VARCHAR(32) NOT NULL,
  `pessoa_id` INT NOT NULL
);

CREATE TABLE `Facilitadores` (
  `facilitador_id` INT PRIMARY KEY AUTO_INCREMENT,
  `formacao` VARCHAR(50) NOT NULL,
  `frente` ENUM ('hard', 'soft', 'monitoria') NOT NULL,
  `pessoa_id` INT NOT NULL
);

CREATE TABLE `Cursos` (
  `curso_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `duracao` INT NOT NULL
);

CREATE TABLE `Modulos` (
  `modulo_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `qtd_aulas` INT NOT NULL,
  `carga_horaria` INT NOT NULL
);

CREATE TABLE `Turmas` (
  `turma_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `organizacao` VARCHAR(50),
  `data_inicio` DATE,
  `turno` ENUM ('manha', 'tarde', 'noite') NOT NULL,
  `curso_id` INT NOT NULL
);

CREATE TABLE `Desempenhos` (
  `desempenho_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nota_indiv` INT NOT NULL,
  `nota_grupo` INT NOT NULL,
  `frequencia` INT NOT NULL
);

CREATE TABLE `Desempenhos_estudante` (
  `desempenho_estudante_id` INT PRIMARY KEY AUTO_INCREMENT,
  `modulo_id` INT NOT NULL,
  `desempenho_id` INT NOT NULL,
  `estudante_id` INT NOT NULL
);

CREATE TABLE `Curso_modulo` (
  `curso_id` INT NOT NULL,
  `modulo_id` INT NOT NULL
);

CREATE TABLE `Estudante_turma` (
  `matricula` VARCHAR(8) NOT NULL,
  `status` ENUM ('ativo','inativo') NOT NULL,
  `estudante_id` INT NOT NULL,
  `turma_id` INT NOT NULL,
  `desempenho_estudante_id` INT NOT NULL
);

CREATE TABLE `Facilitador_turma` (
  `facilitador_id` INT NOT NULL,
  `turma_id` INT NOT NULL
);

ALTER TABLE `Pessoas` ADD FOREIGN KEY (`endereco_id`) REFERENCES `Enderecos` (`endereco_id`);

ALTER TABLE `Estudantes` ADD FOREIGN KEY (`pessoa_id`) REFERENCES `Pessoas` (`pessoa_id`);

ALTER TABLE `Facilitadores` ADD FOREIGN KEY (`pessoa_id`) REFERENCES `Pessoas` (`pessoa_id`);

ALTER TABLE `Turmas` ADD FOREIGN KEY (`curso_id`) REFERENCES `Cursos` (`curso_id`);

ALTER TABLE `Desempenhos_estudante` ADD FOREIGN KEY (`modulo_id`) REFERENCES `Modulos` (`modulo_id`);

ALTER TABLE `Desempenhos_estudante` ADD FOREIGN KEY (`desempenho_id`) REFERENCES `Desempenhos` (`desempenho_id`);

ALTER TABLE `Desempenhos_estudante` ADD FOREIGN KEY (`estudante_id`) REFERENCES `Estudantes` (`estudante_id`);

ALTER TABLE `Curso_modulo` ADD FOREIGN KEY (`curso_id`) REFERENCES `Cursos` (`curso_id`);

ALTER TABLE `Curso_modulo` ADD FOREIGN KEY (`modulo_id`) REFERENCES `Modulos` (`modulo_id`);

ALTER TABLE `Estudante_turma` ADD FOREIGN KEY (`estudante_id`) REFERENCES `Estudantes` (`estudante_id`);

ALTER TABLE `Estudante_turma` ADD FOREIGN KEY (`turma_id`) REFERENCES `Turmas` (`turma_id`);

ALTER TABLE `Estudante_turma` ADD FOREIGN KEY (`desempenho_estudante_id`) REFERENCES `Desempenhos_estudante` (`desempenho_estudante_id`);

ALTER TABLE `Facilitador_turma` ADD FOREIGN KEY (`facilitador_id`) REFERENCES `Facilitadores` (`facilitador_id`);

ALTER TABLE `Facilitador_turma` ADD FOREIGN KEY (`turma_id`) REFERENCES `Turmas` (`turma_id`);
