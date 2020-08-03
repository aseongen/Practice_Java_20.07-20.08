CREATE TABLE member2222(
 id varchar2(20) primary key
 ,pw varchar2(20) not null
 ,name varchar2(30) not null
 ,email varchar2(80)
);

INSERT INTO member2222(id,pw,name)
VALUES('abc123','1234','홍길동');

select*from member2222;

INSERT INTO member2222
VALUES('abc456','1234','나나','dfsd@naver.com');

INSERT INTO member2222
VALUES('bbb456','1234','뽀','gggg@naver.com');

/*데이터 수정 테이블  */
UPDATE MEMBER2222
SET name='신사임당',
email='sadf@naver.com',
WHERE id='abc123';

UPDATE MEMBER2222
set pw='7777'
where id='bbb456';

update member2222
set email='aaa@naver.com'
where id = 'abc123';

/*데이터 조회 */
select*from member2222;
select id from member2222; --member2222 테이블의 id 만 조회
select name,mail from member2222;

select email from MEMBER2222 where id='abc123';

select pw from MEMBER2222 where id='bbb456'; --아이디가 bbb456인 사람의 비밀번호 조회

select * from member2222
where name like '나%';

--데이터 정렬 
select * from MEMBER2222 order by name asc;
select * from MEMBER2222 order by id desc;
select * from MEMBER2222 order by name asc, id desc; --이름을 일차적으로 정렬하고 id를 내림차순 정렬

select * from MEMBER2222
where name like '%나'
order by id asc;

--트랜잭션

insert into MEMBER2222 values ('가가가','1234','나나나', '나나나');
insert into MEMBER2222 values ('나나나','1234','나나나', '나나나');
insert into MEMBER2222 values ('다다다','1234','다다다', '다다다');
insert into MEMBER2222 values ('라라라','1234','라라라', '라라라');

select*from member2222;

--테이블 객체 삭제 
drop table member2222;

alter table member2222 add address varchar2(100);
select * from member2222;

