create table scores(
 stu_id int primary key
 ,stu_name varchar(60) not null
 ,kor number(38)
 ,eng int
 ,math int
 ,total int
 ,average float
);

select * from scores;

create sequence scores_seq
start with 1 
increment by 1 
nocache; 

