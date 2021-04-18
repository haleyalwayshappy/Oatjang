
-- address
create table address(
addrid number,
roadAddrPart1 varchar(500),
roadAddrPart2 varchar(500),
addrDetail varchar(500),
lat number,
lng number
)



create sequence addr_seq nocycle nocache;

drop table address;
drop sequence addr_seq;

select * from address;
