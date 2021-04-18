create table users(
userid number(10) primary key,
	id varchar(20) unique,
	pw varchar(20) not null,
	name varchar(30) not null,
	nickname varchar(30),
	age number(10),
	phone number(10),
	addrid number(10));

create sequence user_seq nocycle nocache;



create table item(
	iid number(10) primary key,
	userid number(10),
	addrid number(10),
	title varchar2(100) not null,
	price number(10) not null,
	images varchar2(1000),
	description varchar2(1000),
	category NUMBER(10),
	success number(1),
	bid varchar2(20),
	reply number(10) default 0,
	hit number default 0,
	logtime date default sysdate,
	constraint fk_item foreign key(userid) references users(userid));

create sequence seq_item increment by 1 start with 1 nocycle nocache;



create table address(
	addrid number,
	roadAddrPart1 varchar(500),
	roadAddrPart2 varchar(500),
	addrDetail varchar(500),
	lat number,
	lng number
	);

create sequence addr_seq nocycle nocache;


create table commu(
    iid number(10) primary key,
    userid number(10),
    title varchar2(100) not null,
    images varchar2(1000),
    description varchar2(1000),
    reply number(10) default 0,
    hit number default 0,
    logtime date default sysdate,
    constraint fk_commu foreign key(userid) references users(userid));

create sequence seq_commu increment by 1 start with 1 nocycle nocache;


create table commureply(
	rid NUMBER PRIMARY KEY,
	iid NUMBER,
	userid number(10) NOT NULL,
	nickname VARCHAR2(30) NOT NULL,
	content VARCHAR2(1000),
	ref NUMBER NOT NULL,
	step NUMBER NOT NULL,
	logtime DATE,
	constraint fk_commureply foreign key(iid) references commu(iid) ON DELETE CASCADE);

create sequence seq_commureply increment by 1 start with 1 nocycle nocache;



create table reply(
	rid NUMBER PRIMARY KEY,
	iid NUMBER,
	userid number(10) NOT NULL,
	nickname VARCHAR2(30) NOT NULL,
	content VARCHAR2(1000),
	ref NUMBER NOT NULL,
	step NUMBER NOT NULL,
	logtime DATE,
	constraint fk_reply foreign key(iid) references item(iid) ON DELETE CASCADE);

create sequence seq_reply increment by 1 start with 1 nocycle nocache;
	
