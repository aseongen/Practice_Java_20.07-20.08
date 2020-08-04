create table member22(
 id varchar2(20) primary key
 , pw varchar2(20) not null
 , name varchar2(30) not null
 , email varchar2(80)
 );

 select * from member22;
 
insert into MEMBER22 values('jsp22','jsp22','하하','dd@na')
insert into MEMBER22 values('jsp33','jsp33','보라','gg@na')
insert into MEMBER22 values('jsp44','jsp44','노랑','aa@na')
insert into MEMBER22 values('jsp55','jsp55','핑큐','cc@na')
 
create table users(
 name varchar2(30) not null
 , id varchar2(20) primary key
 , pw varchar2(20) not null
 , phone1 varchar2(80)
 , phone2 varchar2(80)
 , phone3 varchar2(80)
 , gender varchar2(10)
 );

drop table users;
 
select * from users;

select * from member22;


DELETE FROM users WHERE id=dd

delete from users where id='11'