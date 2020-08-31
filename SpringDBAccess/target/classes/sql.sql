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

--jdbc 게시판 테이블생성
create table jdbc_board(
  board_no int primary key,
  writer varchar2(100),
  title varchar2(255),
  content varchar2(1000)
);

select * from JDBC_BOARD;

drop table jdbc_baord;

