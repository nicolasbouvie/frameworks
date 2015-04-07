CREATE TABLE usuario (
	id           integer not null primary key,
	email        varchar(60) not null,
	nome         varchar(60) not null,
	senha        varchar(32) not null
);

CREATE TABLE grupo (
	id            integer not null primary key,
	nome          varchar(20) not null
);

CREATE TABLE grupo_usuario (
	grupo_id       integer not null,
	usuario_id     integer not null
);


CREATE TABLE banco (
	id              integer not null primary key,
	nome            varchar(40) not null
);

CREATE TABLE conta (
	id              integer not null primary key,
	usuario_id      integer not null,
	banco_id        integer not null,
	agencia         varchar(5) not null,
	conta           varchar(10) not null
);

CREATE TABLE configuracao_venda (
	id				integer not null primary key,
	data_inicio		date not null,
	data_fim		date,
	valor			double not null,
	valor_venda		double not null
);

CREATE TABLE venda (
	id				integer not null primary key,
	usuario_id		integer not null,
	quantidade		integer not null,
	conta_id		integer,
	configuracao_id	integer not null,
	data_proposta	date not null,
	data_venda		date,
	data_pagamento	date
);
