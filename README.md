<h1>Banco de Dados Resilia - Squad 3</h1>
Este banco de dados tem como objetivo modernizar o processo de armazenamento de dados da Resilia, empresa que oferece cursos da área tecnologica. O esquema traz  informações sobre  os endereços, pessoas (incluindo estudantes e facilitadores), cursos, módulos, turmas e desempenhos. 

<h2>Objetivo</h2>
Centralizar as informações relacionadas à área de ensino da Resilia. Ele proporciona um acesso mais rápido e eficaz aos dados, além de facilitar a análise e extração de informações estratégicas.

<h2>Consultas com Gráficos:</h2>
Total de estudantes cadastrados no banco;
Quantidade de estudantes por turma;
Estudantes ativos e inativos;
Quantidade de turmas por facilitador;
Frequência dos estudantes;

<h2>Construído com:</h2>
MySql Workbench |
DbDiagram.io |
Power BI |
Docker |

<h2>Links de acesso:</h2>
Models: https://github.com/beafromsea/bd_resilia/tree/main/Model <br>
Docker: https://github.com/beafromsea/bd_resilia/tree/main/docker <br>
Scripts: https://github.com/beafromsea/bd_resilia/tree/main/scripts <br>

## Utilizando com docker

Para fazer a utilização via docker existem duas possibilidades:

### Primeira utilização

```
1.Inicie seu docker
2.Abra o terminal na pasta raiz do projeto
3.Digite o comando "cd docker"
4.Faça a construção da imagem com o comando "docker build -t setup-compose ./"
5.Em seguida suba aplicação com o comando "docker-compose up"
6.Faça a conexao com MySQL Workbench na porta "3309" através do "localhost" com user root e senha:1234

OBS.: Caso tenha suporte a makefile instalado em seu SO basta executar o comando "make setup-compose" ao invéns dos passos quatro e cinco.
```

### Demais utilizações

```
1.Inicie seu docker
2.Abra o terminal na pasta raiz do projeto
3.Digite o comando "cd docker"
4.Em seguida suba aplicação com o comando "docker-compose up"
5.Faça a conexao com MySQL Workbench na porta "3309" através do "localhost" com user root e senha:1234

OBS.: Caso tenha suporte a makefile instalado em seu SO basta executar o comando "make start-compose" ao invéns dos passos quatro.
```

<h2>Desenvolvedores:</h2>
<p>Beatriz Silva dos Santos</p>
<p>Charlie Gonçalves Pencal</p>
<p>Daniela Sodeiro Silva </p>
<p>Yohan Barboza</p>
<p>Thaise Araujo</p>
