select * from tab;
select * from commu;
drop table commu;
delete commu;
--primary key : unique + not null
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

-- insert into users(id,pwd,name,point) values('admin','1111','어드민',35.34);
-- insert into users(id,pwd,name,point) values('abcd','1111','테스트',65.78);
commit
create sequence seq_commu increment by 1 start with 1 nocycle nocache;
drop sequence seq_commu;