INSERT INTO usuario VALUES(1, 'admin@niggas.com', 		'Admin', 		'admin');
INSERT INTO usuario VALUES(2, 'financeiro@niggas.com', 	'Financeiro', 	'financeiro');
INSERT INTO usuario VALUES(3, 'operacional@niggas.com', 'Operacional', 	'operacional');
INSERT INTO usuario VALUES(4, 'usuario@niggas.com', 	'Usuario', 		'usuario');

INSERT INTO grupo VALUES(1, 'admin');
INSERT INTO grupo VALUES(2, 'financeiro');
INSERT INTO grupo VALUES(3, 'operacional');
INSERT INTO grupo VALUES(4, 'usuario');

INSERT INTO grupo_usuario VALUES(1, 1);
INSERT INTO grupo_usuario VALUES(2, 2);
INSERT INTO grupo_usuario VALUES(3, 3);
INSERT INTO grupo_usuario VALUES(4, 4);

INSERT INTO configuracao_venda VALUES(1, now(), null, 2.6, 2.0);
INSERT INTO configuracao_venda VALUES(2, now(), null, 2.6, 2.2);

INSERT INTO venda VALUES(1, 4, 80, null, 1, now(), null, null);
INSERT INTO venda VALUES(2, 3, 100, null, 2, now(), null, null);
