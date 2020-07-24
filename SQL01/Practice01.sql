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

UPDATE MEMBER2222
SET name='신사임당',
email='sadf@naver.com',
WHERE id='abc123';
