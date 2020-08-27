create table scores(
stu_id int
 ,stu_name varchar(60) 
 ,kor int
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

drop table scores;


SELECT * FROM scores;