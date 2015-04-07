INSERT INTO usuario values(1, 'admin@niggas.com', 		'Admin', 		'admin');
INSERT INTO usuario values(2, 'financeiro@niggas.com', 	'Financeiro', 	'financeiro');
INSERT INTO usuario values(3, 'operacional@niggas.com', 'Operacional', 	'operacional');
INSERT INTO usuario values(4, 'usuario@niggas.com', 	'Usuario', 		'usuario');

INSERT INTO grupo VALUES(1, 'admin');
INSERT INTO grupo VALUES(2, 'financeiro');
INSERT INTO grupo VALUES(3, 'operacional');
INSERT INTO grupo VALUES(4, 'usuario');

INSERT INTO grupo_usuario VALUES(1, 1);
INSERT INTO grupo_usuario VALUES(2, 2);
INSERT INTO grupo_usuario VALUES(3, 3);
INSERT INTO grupo_usuario VALUES(4, 4);

INSERT INTO configuracao_venda VALUES(1, now(), null, 2.6, 2.0);