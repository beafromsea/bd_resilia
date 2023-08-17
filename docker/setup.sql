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
  `turno` ENUM ('Manhã', 'Tarde', 'Noite') NOT NULL,
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

INSERT INTO 
	bd_resilia.Enderecos(rua, numero, complemento, bairro, cidade, uf, cep)
VALUES
	('Rua Kiev', '1012', 'casa 01', 'Vila Zat', 'São Paulo', 'SP', '81010120'),
	('Rua das Flores', '123', 'Apto 101', 'Jardim Primavera', 'São Paulo', 'SP', '01000001'),
	('Avenida Central', '456', 'loja 02', 'Centro', 'Rio de Janeiro', 'RJ', '20000002'),
	('Rua da Amizade', '789', '', 'Vila Amiga', 'Belo Horizonte', 'MG', '30000003'),
	('Alameda dos Sonhos', '987', 'Casa 2', 'Bairro Feliz', 'Porto Alegre', 'RS', '40000004'),
	('Rua das Estrelas', '321', 'Sala 5', 'Céu Azul', 'Curitiba', 'PR', '50000005'),
	('Rua das Palmeiras', '234', 'Casa 3', 'Jardim Tropical', 'Salvador', 'BA', '70000007'),
	('Avenida das Montanhas', '567', 'Apto 302', 'Vila Serrana', 'Curitiba', 'PR', '50000008'),
	('Rua dos Pássaros', '890', '', 'Vila Natureza', 'Porto Alegre', 'RS', '40000009'),
	('Alameda das Fontes', '432', '', 'Bairro das Águas', 'Goiânia', 'GO', '60000010'),
	('Rua dos Sonhos', '765', 'Bloco C', 'Céu Roxo', 'Belém', 'PA', '66000011'),
	('Rua das Videiras', '123', '', 'Vinícola', 'Bento Gonçalves', 'RS', '95700013'),
	('Avenida das Árvores', '456', 'Apto 201', 'Floresta Verde', 'Manaus', 'AM', '69000014'),
	('Travessa do Sol', '789', '', 'Sol Nascente', 'Natal', 'RN', '59000015'),
	('Praça das Estrelas', '987', 'Casa 1', 'Estrelado', 'Florianópolis', 'SC', '88000016'),
	('Alameda das Flores', '654', 'Loja 10', 'Floral', 'Campo Grande', 'MS', '79000017'),
	('Rua das Ondas', '321', '', 'Oceano Azul', 'João Pessoa', 'PB', '58000018'),
	('Rua das Margaridas', '234', 'Apto 502', 'Jardim das Flores', 'Campinas', 'SP', '13000019'),
	('Avenida das Colinas', '567', '', 'Vila Vista', 'Vitória', 'ES', '29000020'),
	('Travessa do Lago', '890', 'Casa 4', 'Lagoa Azul', 'Aracaju', 'SE', '49000021'),
	('Praça das Árvores', '432', '', 'Bosque Verde', 'Cuiabá', 'MT', '78000022'),
	('Alameda das Estrelas', '765', 'Loja 3', 'Estrelândia', 'Porto Velho', 'RO', '76800023'),
	('Rua do Céu', '876', '', 'Nuvens Brancas', 'Palmas', 'TO', '77000024'),
	('Rua das Pedras', '123', 'Apto 301', 'Pedra Alta', 'Maceió', 'AL', '57000025'),
	('Avenida das Praias', '456', '', 'Beira-Mar', 'Fortaleza', 'CE', '60000026'),
	('Travessa da Lua', '789', '', 'Lua Cheia', 'São Luís', 'MA', '65000027'),
	('Praça das Rosas', '987', 'Casa 5', 'Jardim Rosado', 'João Pessoa', 'PB', '58000028'),
	('Alameda das Borboletas', '654', 'Sala 8', 'Borboleta Azul', 'Campo Grande', 'MS', '79000029'),
	('Rua das Montanhas', '321', 'Apto 202', 'Montanha Alta', 'Belo Horizonte', 'MG', '30000030'),
	('Rua do Rio', '234', 'Casa 6', 'Beira Rio', 'Porto Alegre', 'RS', '40000031'),
	('Avenida das Gaivotas', '567', 'Apto 401', 'Praia do Sol', 'Florianópolis', 'SC', '88000032'),
	('Travessa das Marés', '890', '', 'Maré Alta', 'Recife', 'PE', '50000033'),
	('Praça das Borboletas', '432', '', 'Jardim das Borboletas', 'São Paulo', 'SP', '01000034'),
	('Avenida do Mar', '654', 'Bloco B', 'Praia Bela', 'Fortaleza', 'CE', '60000006'),
	('Rua das Cores', '123', 'Apto 501', 'Bairro Colorido', 'Curitiba', 'PR', '50000035'),
	('Avenida das Palmeiras', '456', '', 'Vila Verde', 'São Paulo', 'SP', '01000036'),
	('Travessa das Estrelas', '789', 'Casa 7', 'Céu Noturno', 'Fortaleza', 'CE', '60000037'),
	('Rua das Flores', '234', 'Apto 302', 'Jardim Florido', 'Porto Alegre', 'RS', '40000039'),
	('Avenida das Montanhas', '567', '', 'Vila Serrana', 'Belo Horizonte', 'MG', '30000040'),
	('Travessa da Praia', '890', 'Casa 8', 'Praia do Mar', 'Salvador', 'BA', '70000041'),
	('Praça das Araras', '432', '', 'Bairro das Aves', 'São Paulo', 'SP', '01000042'),
	('Rua das Estrelas', '123', 'Apto 201', 'Céu Noturno', 'Curitiba', 'PR', '50000043'),
	('Avenida das Árvores', '456', '', 'Bairro Verde', 'São Paulo', 'SP', '01000044'),
	('Travessa da Lua', '789', 'Casa 9', 'Lua Crescente', 'Natal', 'RN', '59000045'),
	('Praça das Flores', '987', '', 'Jardim das Flores', 'Porto Alegre', 'RS', '40000046'),
	('Rua do Sol', '234', 'Apto 401', 'Vila Solar', 'Fortaleza', 'CE', '60000047'),
	('Avenida das Praias', '567', '', 'Praia Dourada', 'Rio de Janeiro', 'RJ', '20000048'),
	('Travessa das Estrelas', '890', 'Casa 10', 'Céu Estrelado', 'Belo Horizonte', 'MG', '30000049'),
	('Praça das Águas', '432', '', 'Bairro Aquático', 'Recife', 'PE', '50000050'),
	('Avenida das Montanhas', '456', '', 'Vila Alta', 'Porto Alegre', 'RS', '40000052'),
	('Travessa da Praia', '789', 'Casa 11', 'Praia Azul', 'Fortaleza', 'CE', '60000053'),
	('Praça das Águas', '987', '', 'Lagoa Cristalina', 'Natal', 'RN', '59000038'),
	('Rua Flores de Lima', '369', 'casa', 'Umbara', 'Curitiba', 'PR', '81010120'),
    ('Av. Resilia', '153', 'Apto 45', 'Bairro Central', 'Porto Alegre', 'RS', '12345678'),
    ('Rua da Lua', '332', 'Apto 101', 'Flamengo', 'Rio de Janeiro', 'RJ', '23475639'),
    ('Rua Perez da Luz', '33', 'casa', 'Santo Antônio', 'Vitória', 'ES', '33445608');
    
    
INSERT INTO 
	bd_resilia.Pessoas(nome, data_nasc, cpf, telefone, email, nivel_escolaridade, pcd, endereco_id)
VALUES
	('Aline Souza', '1993-05-26', '45678901212', '9900112233', 'aline.souza@example.com', 'Superior', 'Não', '1'),
	('Amanda Fernandes', '1992-04-03', '78901234567', '3344556677', 'amanda.fernandes@example.com', 'Superior', 'Não', '2'),
	('Ana Beatriz Fernandes', '1990-09-18', '12345678901', '3344556677', 'ana.beatriz.fernandes@example.com', 'Superior', 'Sim', '3'),
	('Ana Oliveira', '1983-06-29', '34567890123', '7788990011', 'ana.oliveira@example.com', 'Superior', 'Não', '4'),
	('André Pereira', '1992-04-03', '34567890123', '4455667788', 'andre.pereira@example.com', 'Médio', 'Não', '5'),
	('Bruno Pereira', '2001-04-09', '67890123456', '4455667788', 'bruno.pereira@example.com', 'Técnico', 'Não', '6'),
	('Camila Lima', '1986-09-18', '78901234567', '3344556677', 'camila.lima@example.com', 'Superior', 'Não', '7'),
	('Carla Fernandes', '1988-10-30', '56789012345', '7788990011', 'carla.fernandes@example.com', 'Superior', 'Não', '8'),
	('Carla Lima', '1987-10-30', '34567890123', '1122334455', 'carla.lima@example.com', 'Superior', 'Não', '9'),
	('Carlos Souza', '1988-09-18', '23456789034', '2233445566', 'carlos.souza@example.com', 'Médio', 'Sim', '10'),
	('Carolina Fernandes', '1989-03-22', '78901234567', '5566778899', 'carolina.fernandes@example.com', 'Superior', 'Sim', '11'),
	('Catarina Lima', '1985-07-25', '45678901212', '3344556677', 'catarina.lima@example.com', 'Superior', 'Sim', '12'),
	('Cristina Lima', '1999-10-30', '45678901212', '7788990011', 'cristina.lima@example.com', 'Superior', 'Sim', '13'),
	('Daniel Pereira', '2000-11-07', '34567890123', '6677889900', 'daniel.pereira@example.com', 'Superior', 'Não', '14'),
	('Eduardo Souza', '1982-11-07', '98765432101', '6677889900', 'eduardo.souza@example.com', 'Superior', 'Não', '15'),
	('Fernanda Lima', '1986-03-22', '78901234567', '9900112233', 'fernanda.lima@example.com', 'Superior', 'Não', '16'),
	('Fernando Santos', '1991-11-07', '89012345678', '6677889900', 'fernando.santos@example.com', 'Técnico', 'Sim', '17'),
	('Gustavo Lima', '1984-08-13', '98765432101', '8899001122', 'gustavo.lima@example.com', 'Médio', 'Sim', '18'),
	('Gustavo Pereira', '2000-03-10', '89012345678', '4455667788', 'gustavo.pereira@example.com', 'Médio', 'Não', '19'),
	('Gustavo Santos', '1997-06-30', '67890123456', '8899001122', 'gustavo.santos@example.com', 'Técnico', 'Sim', '20'),
	('Isabela Fernandes', '1989-03-22', '56789012345', '1122334455', 'isabela.fernandes@example.com', 'Superior', 'Sim', '21'),
	('Isabela Santos', '1988-09-18', '12345678901', '5566778899', 'isabela.santos@example.com', 'Superior', 'Sim', '22'),
	('João Silva', '1990-01-15', '12345678901', '1122334455', 'joao.silva@example.com', 'Superior', 'Não', '23'),
	('José Souza', '1985-06-30', '98765432101', '4455667788', 'jose.souza@example.com', 'Técnico', 'Não', '24'),
	('Juliana Fernandes', '1998-02-14', '78901234567', '5566778899', 'juliana.fernandes@example.com', 'Superior', 'Não', '25'),
	('Larissa Fernandes', '2000-03-10', '56789012345', '5566778899', 'larissa.fernandes@example.com', 'Superior', 'Não', '26'),
	('Laura Fernandes', '1991-12-05', '12345678901', '1122334455', 'laura.fernandes@example.com', 'Superior', 'Não', '27'),
	('Lucas Oliveira', '1985-07-25', '67890123456', '2233445566', 'lucas.oliveira@example.com', 'Técnico', 'Sim', '28'),
	('Lucas Santos', '1985-04-09', '67890123456', '0011223344', 'lucas.santos@example.com', 'Técnico', 'Sim', '29'),
	('Lúcia Oliveira', '1987-10-30', '12345678901', '7788990011', 'lucia.oliveira@example.com', 'Superior', 'Não', '30'),
	('Marcelo Santos', '1997-12-05', '67890123456', '2233445566', 'marcelo.santos@example.com', 'Médio', 'Não', '31'),
	('Marcelo Souza', '1999-09-18', '98765432101', '2233445566', 'marcelo.souza@example.com', 'Técnico', 'Não', '32'),
	('Maria Santos', '1985-07-25', '98765432101', '5544332211', 'maria.santos@example.com', 'Médio', 'Sim', '33'),
	('Mariana Lima', '2003-03-22', '78901234567', '1122334455', 'mariana.lima@example.com', 'Superior', 'Não', '34'),
	('Mariana Oliveira', '1995-12-22', '78901234567', '7788990011', 'mariana.oliveira@example.com', 'Superior', 'Não', '35'),
	('Mariana Souza', '1991-11-07', '56789012345', '9900112233', 'mariana.souza@example.com', 'Superior', 'Sim', '36'),
	('Patrícia Fernandes', '2002-02-15', '12345678901', '5566778899', 'patricia.fernandes@example.com', 'Médio', 'Não', '37'),
	('Paula Lima', '1994-02-15', '45678901212', '5566778899', 'paula.lima@example.com', 'Médio', 'Não', '38'),
	('Pedro Alves', '1992-04-03', '45678901212', '9988776655', 'pedro.alves@example.com', 'Técnico', 'Não', '39'),
	('Pedro Fernandes', '1998-02-14', '45678901234', '8899001122', 'pedro.fernandes@example.com', 'Médio', 'Não', '40'),
	('Rafael Lima', '1995-12-22', '23456789012', '6677889900', 'rafael.lima@example.com', 'Técnico', 'Não', '41'),
	('Rafael Oliveira', '1992-12-05', '89012345678', '2233445566', 'rafael.oliveira@example.com', 'Médio', 'Não', '42'),
	('Ricardo Oliveira', '2002-02-15', '89012345678', '0011223344', 'ricardo.oliveira@example.com', 'Médio', 'Não', '43'),
	('Ricardo Pereira', '1983-06-29', '67890123456', '4455667788', 'ricardo.pereira@example.com', 'Médio', 'Não', '44'),
	('Roberto Pereira', '1987-08-13', '34567890123', '8899001122', 'roberto.pereira@example.com', 'Médio', 'Não', '45'),
	('Roberto Santos', '1988-09-18', '67890123456', '6677889900', 'roberto.santos@example.com', 'Técnico', 'Sim', '46'),
	('Rodrigo Oliveira', '1984-08-13', '45678901234', '2233445566', 'rodrigo.oliveira@example.com', 'Médio', 'Sim', '47'),
	('Rodrigo Pereira', '2001-04-09', '34567890123', '0011223344', 'rodrigo.pereira@example.com', 'Técnico', 'Não', '48'),
	('Sandra Lima', '1995-12-22', '56789012345', '3344556677', 'sandra.lima@example.com', 'Superior', 'Sim', '49'),
	('Thiago Oliveira', '1994-06-30', '89012345678', '4455667788', 'thiago.oliveira@example.com', 'Técnico', 'Sim','50'),
	('Thiago Pereira', '1983-06-29', '89012345678', '8899001122', 'thiago.pereira@example.com', 'Técnico', 'Não', '51'),
	('Vanessa Fernandes', '1996-05-26', '56789012345', '9900112233', 'vanessa.fernandes@example.com', 'Superior', 'Não', '52'),
	('Paulo Santos', '1985-04-09', '89012345678', '2233445566', 'paulo.santos@example.com', 'Superior', 'Sim', '53'),
	('Ana Silva', '1990-01-15', '12345678901', '14912345678', 'ana.silva@email.com', 'Superior', 'Não', 54),
	('Bruno Costa', '1985-05-25', '23456789012', '11923456789', 'bruno.costa@email.com', 'Superior', 'Não', 55),
	('Carla Martins', '1995-08-05', '34567890123', '11934567890', 'carla.martins@email.com', 'Superior', 'Não', 56);

INSERT INTO 
	bd_resilia.Estudantes(senha, pessoa_id)
VALUES
	('0AB&12345','1'),
	('2A#345678','2'),
	('2S#345678','3'),
	('2V#345678','4'),
	('3B&567890','5'),
	('3DE#45678','6'),
	('3FGH#4567','7'),
	('3IJ#45678','8'),
	('3LMN#456','9'),
	('3TU@45678','10'),
	('3WX@45678','11'),
	('4Z#567890','12'),
	('56789A1@','13'),
	('56789I&JK','14'),
	('56789KL&M','15'),
	('56789MN#O','16'),
	('56789YZ#A','17'),
	('5678G#HI','18'),
	('5678U&VW','19'),
	('567VW#890','20'),
	('5YZ#67890','21'),
	('67890D#E','22'),
	('6789A1@BC','23'),
	('6789EF1@','24'),
	('6789MN#OP','25'),
	('6789PQ#RS','26'),
	('6789XY#Z','27'),
	('7CD#67890','28'),
	('890X&1234','29'),
	('B01&23456','30'),
	('BC2&34567','31'),
	('C@4567890','32'),
	('C6#678901','33'),
	('DE2&34567','34'),
	('D7#890123','35'),
	('F1@234567','36'),
	('FGH4@5678','37'),
	('IJ8@567890','38'),
	('J@5678901','39'),
	('K2&345678','40'),
	('KL8@56789','41'),
	('L5@678901','42'),
	('NO4@56789','43'),
	('OPQ4@5678','44'),
	('P@ssw0rd1','45'),
	('PQ6&78901','46'),
	('QR6&78901','47'),
	('R5678#ST','48'),
	('TU6&78901','49'),
	('VW9@56789','50');
    
INSERT INTO 
	bd_resilia.Facilitadores(formacao, frente, pessoa_id)
VALUES
	('engenharia de software', 'hard', '51'),
	('psicologia', 'soft','52'),
	('ciencia da computação', 'monitoria','53'),
    ('engenharia de software', 'hard', '54'),
    ('psicologia', 'soft', '55'),
    ('engenharia de software', 'hard', '56');

INSERT INTO 
	bd_resilia.Cursos(nome, duracao)
VALUES
	('Formação WebDev Full Stack JavaScript','312'),
	('Formação em Data Analytics','156'),
	('Formação Análise de Sistemas','156'),
	('Formação WebDev Full Stack Java','312');
    
INSERT INTO 
	bd_resilia.Modulos(nome, qtd_aulas, carga_horaria)   
VALUES
	('Introdução', '04','12'),
	('Introdução ao front-end e criação de hábitos', '20', '60'),
	('Orientação a objetos e Inteligência emocional', '20', '60'),
	('Armazenamento e Relacionamento Interpessoal', '20', '60'),
	('Frameworks e Metodologias Ágeis', '20', '60'),
	('Bibliotecas e Postura profissional e Inovação', '20', '60'),
    ('Introdução à Análise de Dados', '16', '48'),
	('Estatísticas e Modelagem', '16', '48'),
    ('Ferramentas e Tecnologias de Análise de Dados', '16', '48'),
	('Fundamentos de Sistemas de Informação', '16', '48'),
	('Análise e Design de Sistemas', '16', '48'),
	('Banco de Dados e Gerenciamento de Dados', '16', '48'),
	('Desenvolvimento Back-End com Java', '20', '60'),
	('Banco de Dados e Acesso a Dados', '20', '60'),
	('Desenvolvimento Full Stack e Projetos Práticos', '20', '60'),
	('APIs e Integrações', '20', '60'),
	('Desenvolvimento de Aplicativos Móveis', '20', '60');
    
INSERT INTO 
	bd_resilia.Turmas(nome, organizacao, data_inicio, turno, curso_id)
VALUES
	('Códigos do Amanhã', 'EBANX', '2023-05-01', 'Manhã', '1' ),
	('Turma FuturoDigital', 'TechSolutions', '2023-06-01', 'Tarde', '2' ),
	('Turma TransformaTI', 'Infinitech', '2023-04-03', 'Noite', '3' ),
	('Turma Código em Ação', 'MetaEdge', '2023-07-01', 'Manhã', '4' );
    
INSERT INTO 
	bd_resilia.Desempenhos(nota_indiv, nota_grupo, frequencia)   
VALUES
	('75', '92', '100'),
	('80', '75', '98'),
	('66', '80', '92'),
	('100', '96', '90'),
	('93', '82', '91'),
	('75', '76', '100'),
	('69', '99', '89'),
	('72', '75', '96'),
	('69', '76', '80'),
	('90', '77', '99'),
	('99', '78', '88'),
	('75', '80', '89'),
	('68', '81', '87'),
	('74', '82', '91'),
	('81', '79', '94'),
	('76', '72', '92'),
	('82', '83', '96'),
	('77', '84', '99'),
	('83', '85', '94'),
	('78', '90', '91'),
	('84', '91', '98'),
	('79', '92', '89'),
	('85', '93', '93'),
	('80', '86', '100'),
	('86', '87', '90'),
	('91', '88', '80'),
	('87', '94', '81'),
	('92', '95', '78'),
	('89', '96', '75'),
	('93', '89', '100'),
	('90', '90', '85'),
	('94', '97', '83'),
	('91', '98', '90'),
	('95', '99', '100'),
	('92', '100', '77'),
	('96', '100', '84'),
	('93', '75', '86'),
	('97', '69', '94'),
	('94', '78', '96'),
	('98', '87', '100'),
	('95', '86', '89'),
	('99', '82', '90'),
	('96', '83', '71'),
	('100', '77', '100'),
	('97', '78', '100'),
	('100', '84', '98'),
	('98', '85', '99'),
	('66', '90', '89'),
	('67', '91', '91'),
    ('69', '74', '93'),
    ('70', '80', '88'),
    ('71', '88', '89'),
    ('72', '68', '85'),
    ('73', '72', '84'),
    ('74', '70', '95'),
    ('75', '65', '95'),
    ('76', '78', '99'),
    ('77', '77', '88'),
    ('78', '76', '97'),
    ('79', '81', '90'),
    ('80', '83', '92');


INSERT INTO 
	bd_resilia.Curso_modulo (curso_id, modulo_id)
VALUES 
	('1','1'),
	('1','2'),
	('1','3'),
	('1','4'),
	('1','5'),
	('1','6'),
	('2','1'),
	('2','7'),
	('2','8'),
	('2','9'),
	('3','1'),
	('3','10'),
	('3','11'),
	('3','12'),
	('4','1'),
	('4','13'),
	('4','14'),
	('4','15'),
	('4','16'),
	('4','17');
    
    
INSERT INTO 
	bd_resilia.Desempenhos_estudante (modulo_id, desempenho_id, estudante_id)
VALUES 
	('1','1','1'),
	('2','2','1'),
    ('1','3','2'),
    ('2','4','2'),
    ('1','5','3'),
    ('2','6','3'),
    ('1','7','4'),
    ('2','8','4'),
    ('1','9','5'),
    ('1','10','6'),
    ('2','11','6'),
    ('1','12','7'),
    ('2','13','7'),
    ('1','14','8'),
    ('2','15','8'),
	('1','16','9'),
	('1','17','10'),
	('2','18','10'),
	('1','19','11'),
	('2','20','11'),
	('1','21','12'),
	('2','22','12'),
	('1','23','13'),
	('2','24','13'),
	('1','25','14'),
	('1','26','15'),
	('1','27','16'),
    ('1','28','17'),
    ('1','29','18'),
    ('1','30','19'),
    ('1','31','20'),
    ('1','32','21'),
    ('1','33','22'),
    ('1','34','23'),
    ('1','35','24'),
    ('1','36','25'),
    ('1','37','26'),
    ('1','38','27'),
    ('1','39','28'),
    ('1','40','29'),
    ('1','41','30'),
    ('1','42','31'),
    ('1','43','32'),
    ('1','44','33'),
    ('1','45','34'),
    ('1','46','35'),
    ('1','47','36'),
    ('1','48','37'),
    ('1','49','38'),
    ('1','50','39'),
    ('1','51','40'),
    ('1','52','41'),
    ('1','53','42'),
    ('1','54','43'),
    ('1','55','44'),
    ('1','56','45'),
    ('1','57','46'),
    ('1','58','47'),
    ('1','59','48'),
    ('1','60','49'),
	('1','61','50');
    
    
INSERT INTO 
	bd_resilia.Estudante_turma(matricula, status, estudante_id, turma_id, desempenho_estudante_id)
VALUES 
	('ABDF1234', 'ativo', 1, 1, 1),
	('ASDA8901', 'ativo', 2, 2, 2),
	('BNMK2109', 'ativo', 3, 3, 3),
	('BVCX3456', 'ativo', 4, 4, 4),
	('EDCA4321', 'inativo', 5, 1, 5),
	('FGHJ6543', 'ativo', 6, 2, 6),
	('GFEW7654', 'ativo', 7, 3, 7),
	('HGFY1098', 'ativo', 8, 4, 8),
	('HNSR4321', 'inativo', 9, 1, 9),
	('IYRE7654', 'ativo', 10, 2, 10),
	('JHGF9876', 'ativo', 11, 3, 11),
	('JKLP9876', 'ativo', 12, 4, 12),
	('LFJG7654', 'ativo', 13, 1, 13),
	('LKIJ2345', 'ativo', 14, 2, 14),
	('LKUY5678', 'ativo', 15, 3, 15),
	('LPLM4321', 'ativo', 16, 4, 16),
	('MNBP0987', 'ativo', 17, 1, 17),
	('MNBV0987', 'inativo', 18, 2, 18),
	('MTCB9876', 'ativo', 19, 3, 19),
	('NBVN4321', 'ativo', 20, 4, 20),
	('NHVD4321', 'ativo', 21, 1, 21),
	('NMPO5432', 'ativo', 22, 2, 22),
	('OINM4321', 'ativo', 23, 3, 23),
	('PLSM1098', 'ativo', 24, 4, 24),
	('POIU1098', 'ativo', 25, 1, 25),
	('POKJ6543', 'ativo', 26, 2, 26),
	('POUY4321', 'inativo', 27, 3, 27),
	('PQOR8901', 'ativo', 28, 4, 28),
	('QWEA7654', 'ativo', 29, 1, 29),
	('QWER5678', 'ativo', 30, 2, 30),
	('RQWE7654', 'ativo', 31, 3, 31),
	('TREA6780', 'inativo', 32, 4, 32),
	('TUVZ6780', 'ativo', 33, 1, 33),
	('UYIR2109', 'ativo', 34, 2, 34),
	('VBNM6789', 'ativo', 35, 3, 35),
	('VKLK5678', 'ativo', 36, 4, 36),
	('VMXC6789', 'ativo', 37, 1, 37),
	('VRTY8765', 'ativo', 38, 2, 38),
	('WERT3456', 'ativo', 39, 3, 39),
	('WRTY2109', 'ativo', 40, 4, 40),
	('WVUT6789', 'ativo', 41, 1, 41),
	('XKDC5432', 'ativo', 42, 2, 42),
	('XVBN8901', 'inativo', 43, 3, 43),
	('XYSV5678', 'ativo', 44, 4, 44),
	('YTRA8765', 'ativo', 45, 1, 45),
	('ZKXB8765', 'ativo', 46, 2, 46),
	('ZMQW5678', 'ativo', 47, 3, 47),
	('ZQWE4321', 'ativo', 48, 4, 48),
	('ZXCV4321', 'ativo', 49, 1, 49),
	('ZXCV5432', 'ativo', 50, 2, 50);

    
INSERT INTO 
	bd_resilia.Facilitador_turma (facilitador_id, turma_id)
VALUES 
	('1','1'),        
	('1','2'),              
	('2','1'),        
	('2','2'),               
	('3','1'),        
	('3','2'),        
	('3','3'),        
	('3','4'),
    ('4','3'),
    ('5','3'),
    ('5','4'),
    ('6','1'),
    ('6','4');      