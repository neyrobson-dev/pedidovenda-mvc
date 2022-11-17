CREATE TABLE clientes (
	id int(11) NOT NULL AUTO_INCREMENT,
	nome varchar(100) NOT NULL,
	cidade varchar(100) NOT NULL,
	uf char(2) NOT NULL,
	CONSTRAINT clientes_pk PRIMARY KEY (id)
);

CREATE TABLE produtos (
	id int(11) NOT NULL AUTO_INCREMENT,
	descricao varchar(100) NOT NULL,
	precoVenda float(10,2) NOT NULL,	
	CONSTRAINT produtos_pk PRIMARY KEY (id)
);

CREATE TABLE pedidos (
	id int(11) NOT NULL AUTO_INCREMENT,
	dataEmissao date NOT NULL,
	idCliente int(11) NOT NULL,
	valorTotal float(10,2) NOT NULL,
	CONSTRAINT pedidos_pk PRIMARY KEY (id),
	CONSTRAINT pedidos_fk_clientes FOREIGN KEY (idCliente) REFERENCES clientes(id) ON DELETE NO ACTION
);

CREATE TABLE pedidosItens (
	id int(11) NOT NULL AUTO_INCREMENT,
	idPedido int(11) NOT NULL,
	idProduto int(11) NOT NULL,
	quantidade int(11) NOT NULL,
	valorUnitario float(10,2) NOT NULL,
	valorTotal float(10,2) NOT NULL,
	CONSTRAINT pedidositens_pk PRIMARY KEY (id),
	CONSTRAINT pedidositens_fk_pedidos FOREIGN KEY (idPedido) REFERENCES pedidos(id) ON DELETE NO ACTION,
	CONSTRAINT pedidositens_fk_produtos FOREIGN KEY (idProduto) REFERENCES produtos(id) ON DELETE NO ACTION
);

INSERT INTO `clientes` (`nome`,`cidade`,`uf`)
VALUES
  ("Bianca da Conceiçao","Balsas","RS"),
  ("Amal Ribeiro","Rio Verde","PA"),
  ("Bradley de Matos","Olinda","SP"),
  ("Scarlet Chaves","Marabá","PR"),
  ("Mohammad Bento","Itabuna","SP"),
  ("Ruby Sántos","Cajazeiras","PA"),
  ("Jade Bezerra","Blumenau","MA"),
  ("Inga da Cunha","Londrina","MA"),
  ("Buffy Cavalcante","Joinville","BA"),
  ("Yoshio Coutinho","Santarém","PE"),
  ("Vernon Inacio","Petrolina","MA"),  
  ("Brett Candido","Santa Luzia","PB"),
  ("Lance Felix","Rio Grande","SP"),
  ("Jaime Galdino","Blumenau","PE"),
  ("Marcia Custodio","Castanhal","RJ"),
  ("TaShya Barboza","Gravataí","BA"),
  ("Ingrid Bastos","Ipatinga","PA"),
  ("Renee Tavares","Santa Inês","RJ"),
  ("Kirby Borges","Aparecida de Goiânia","RS"),
  ("Stacey de Morais","Belo Horizonte","GO");
  
INSERT INTO `produtos` (`descricao`,`precoVenda`)
VALUES
  ("Fringilla Ornare PC","28.23"),
  ("Sem Molestie Foundation","66.33"),
  ("Sed Facilisis Company","83.45"),
  ("Nisi Foundation","11.21"),
  ("Sit Amet Consulting","61.49"),
  ("Duis Ac Corp.","96.84"),
  ("Gravida Sagittis Ltd","80.87"),
  ("Purus Corp.","94.48"),
  ("Imperdiet Ltd","81.07"),
  ("Non Feugiat Nec Consulting","64.31"),
  ("Dui In Institute","85.03"),
  ("Phasellus Dolor PC","93.96"),
  ("Integer Eu Lacus LLC","72.78"),
  ("Ipsum Curabitur Limited","53.12"),
  ("Gravida Molestie Corporation","47.32"),
  ("Mauris Ipsum LLC","90.45"),
  ("Tempus Mauris Erat Industries","51.53"),
  ("Amet Consectetuer Adipiscing Ltd","27.86"),
  ("A Felis Incorporated","39.14"),
  ("Tortor At Corporation","98.78");