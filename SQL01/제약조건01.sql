--기본키와 not null제약조건 실습)
create table dept60(
 deptno number(38) primary key /* 부서번호 */
 ,dname varchar2(50) not null --부서명
 ,LC varchar2(20) --부서지역,null제약조건
);

insert into dept60 values(10,'영업부','서울');
insert into dept60 values(10,'영업부','부산');--무결성제약조건 에러=>
--deptno컬럼은 기본키이기 때문에 중복 부서번호는 저장못함.

insert into dept60 values(20,null,'서울');--dname은 not null제약조건이
--기 때문에 null을 저장못함.

--dept60테이블에 생성된 제약조건명,타입등 확인 쿼리문
select constraint_name, constraint_type,table_name 
from user_constraints where table_name in('DEPT60');
--DEPT60은 테이블명이다.반드시 영문대문자로 해야한다.

/* unique 제약조건 특징)
 *  1.해당 컬럼에 레코드가 중복되지 않게 한다. null이 저장되는 것은 허용한다.
 *  2. 중복자료에서 null은 체크하지 않는다. 즉 null은 중복을 허용한다. 
 */
--unique제약조건 실습)
create table emp103(
  empno number(10) unique --사원번호
  ,ename varchar2(20) not null --사원명
  ,job varchar2(30) --직종
  ,deptno number(38) --부서번호
);
insert into emp103 values(502,'홍길동','인사부',40);
insert into emp103 values(502,'이순신','영업부',30);--empno컬럼에는 중복
--사원번호를 저장할 수 없다.

insert into emp103 values(null,'강감찬','관리부',50);
insert into emp103 values(null,'신사임당','개발부',60);
/* unique제약조건으로 설정된 empno컬럼에 null을 허용하면서 중복 null도 허용한다.*/

--constraint 키워드로 사용자 정의 제약조건명을 사용한 테이블 설계
create table emp105(
  empno number(20) constraint emp105_empno_uk unique
  --테이블명_컬럼명_제약조건유형인 emp105_empno_uk가 사용자 정의 제약조건명이다.
  --uk가 unique제약조건 유형 약어이다.
  ,ename varchar2(100) constraint emp105_ename_nn not null
  --nn제약조건 유형은 not null을 의미
  ,job varchar2(20)
  ,deptno int
);
--emp105_ename_nn도 사용자정의 제약조건명이다.

--생성된 제약조건명을 확인
select table_name, constraint_name from user_constraints
where table_name in('EMP105');

/* primary key(기본키) 제약조건 특징)
 *  1. 테이블내에서 식별기능을 갖는 컬럼은 유일한 레코드값만 저장되게 하고,null은 허용
 * 하지 말아야 한다.이러한 컬럼에는 주로 기본키 제약조건을 설정한다.
 *  2.기본키 제약조건을 설정한 해당 컬럼은 중복 레코드와 null을 저장금지한다. 
 */
--사원번호를 기본키로 가진 사용자 정의 제약조건명을 명시한 테이블 설계)
create table emp106(
 empno number(38) constraint emp106_empno_pk primary key
 --사용자 정의 제약조건명이 emp106_empno_pk가 된다. pk는 primary key를 뜻함
 ,ename varchar2(100) constraint emp106_ename_nn not null
 ,job varchar2(30)
 ,deptno number(20)
);
insert into emp106 values(201,'강감찬','관리부',10);
insert into emp106 values(201,'이순신','영업부',20);
--ORA-00001: 무결성 제약 조건(WEEK.EMP106_EMPNO_PK)에 위배됩니다. empno
--컬럼에 중복사원번호를 저장할려다가 에러가 발생한 경우이다.

create table tbl_board11(
 b_no  number(38) primary key 
,b_name  varchar2(30)
,b_title varchar2(30)
,b_pwd varchar2(30)
,b_cont varchar2(30)
,b_hit varchar2(30)
,b_date varchar2(30)
);

select * from tbl_board11


create table tbl_reply11(
 r_no number(38) primary key
,r_name varchar2(30) not null
,r_cont varchar2(30) not null
,r_date varchar2(30) not null
,b_no number(38) references tbl_board11 (b_no)
);

drop table tbl_reply11

select * from tbl_board11
