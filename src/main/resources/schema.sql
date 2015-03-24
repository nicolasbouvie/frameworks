create table users (
	id integer not null,
	username varchar(50) not null,
	password varchar(32) not null,
	enabled BOOLEAN not null
);

create table authorities (
	id integer not null,
	username varchar(50) not null,
	authority varchar(50) not null
)
