select * from tab;
select * from commureply;
drop table commureply;

--primary key : unique + not null
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
drop sequence seq_commureply;