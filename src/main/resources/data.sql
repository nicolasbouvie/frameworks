INSERT INTO usuario VALUES(1, 'admin@niggas.com', 		'Admin', 		'admin');
INSERT INTO usuario VALUES(2, 'financeiro@niggas.com', 	'Financeiro', 	'financeiro');
INSERT INTO usuario VALUES(3, 'operacional@niggas.com', 'Operacional', 	'operacional');
INSERT INTO usuario VALUES(4, 'usuario1@niggas.com', 	'Usuario 1', 	'usuario1');
INSERT INTO usuario VALUES(5, 'usuario2@niggas.com', 	'Usuario 2', 	'usuario2');
INSERT INTO usuario VALUES(6, 'usuario3@niggas.com', 	'Usuario 3', 	'usuario3');

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

INSERT INTO venda VALUES(1, 4, 44,   null, 1, now(), null, null);
INSERT INTO venda VALUES(2, 4, 50,   null, 1, now(), null, null);
INSERT INTO venda VALUES(3, 4, 100,  null, 2, now(), null, null);
INSERT INTO venda VALUES(4, 4, 10,   null, 2, now(), null, null);
INSERT INTO venda VALUES(5, 5, 200,  null, 1, now(), null, null);
INSERT INTO venda VALUES(6, 5, 250,  null, 2, now(), null, null);
INSERT INTO venda VALUES(7, 6, 44,   null, 1, now(), null, null);
INSERT INTO venda VALUES(8, 6, 44,   null, 2, now(), null, null);
INSERT INTO venda VALUES(9, 5, 150,  null, 1, now(), null, null);
INSERT INTO venda VALUES(10, 6, 100, null, 2, now(), null, null);