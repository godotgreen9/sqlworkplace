create table Book(
bookid integer primary key,
bookname varchar(40),
publisher varchar(40),
price integer
);

create table Customer(
custid integer primary key,
name varchar(40),
address varchar(50),
phone varchar(20)
);

create table Orders(
	orderid integer primary key,
	custid integer,
	bookid integer,
	saleprice integer,
	orderdate date,
	foreign key(custid) references Customer(custid),
	foreign key(bookid) references Book(bookid)
);



INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

INSERT INTO Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d')); 
INSERT INTO Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, STR_TO_DATE( '2014-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));

select * from Book;
select * from Customer;
select * from Orders;

-- 데이터의 정의어 (DDL) : create, alter, drop
-- 데이터 조작어 (DML) : select, insert, delete, update
-- 데이터 제어어 (DCL) : grant, revoke
-- CRUD
-- 연산자  =, <>,<, >= 관계연산자
-- 범위 between
-- in, not in
-- like
-- is null, is not null
-- and, or, not
-- 와일드 문자alter
-- + : 문자열을 연결
-- % : 0개 이상의 문자열과 일치
-- [] : 1개의 문자와 일치 : '[0-5]%' : 0-5사이으 숫자로 시작하는 문자열
-- [^] : 1개의 문자와 불일치 : '[^0-5]%' : 0-5사이의 숫자로 시작하지 않는 문자열
-- _: 특정 위치의 1개의 문자와 일치
-- count(*) : 테이블의 모든 행수를 센다 단 not null

-- 1. 김연아 고객의 전화번호 조회
select phone from customer where name='김연아';

-- 2. 모든 도서의 이름과 가격 조회
select bookname, price from Book;

-- 3. 모든 도서의 도서번호,도서이름,출판사,가격을  조회
select bookid,bookname,publisher,price from Book;
select * from Book;



-- 4. 도서 테이블에 있는 모든 출판사를 조회
select publisher from Book; 

-- 4-1. 중복제외
select distinct publisher from Book; 

-- 5. 가격이 20,000원 미만인 도서 조회
select * from Book where price < 20000;

-- 5-1. 가격이 10,000원 이상 20,000이하인  도서 조회
select * from Book where price between 10000 and 20000 ;
select * from book where price >=10000 and price <=20000;

-- 6. 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 조회
select * from Book where publisher in('굿스포츠','대한미디어');
select * from Book where publisher ="굿스포츠"or publisher ="대한미디어";

-- 6-1. 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 조회
select * from Book where publisher not in('굿스포츠','대한미디어');
select * from Book where publisher <>"굿스포츠"and publisher <>"대한미디어";

-- 6-3. '축구의 역사'를 출간한 출판사 조회
select bookname, publisher from Book where bookname like '축구의 역사';

-- 6-4. 도서이름에 '축구'가 포함된 출판사 조회
select bookname, publisher from Book where bookname like '%축구%';

-- 6-5 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 조회
select bookname, publisher from Book where bookname like '_구%';

-- 7. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 조회
select * from Book where bookname like '%축구%' and price >= 20000;

-- 7-1. 출판가 '굿스포츠'혹은'대한 미디어'인 도서를 조회
select * from Book where publisher='굿스포츠' or '대한미디어'; 

-- 7-3. 도서를 이름순으로 조회
select * from Book order by bookname;

-- 7-4 도서를 가격순으로 조회하고 가격이 같으면 이름순으로 조회
select * from Book order by price,bookname;

-- 7-5 도서를 가격의 내림차순으로 조회 만약 가격이 같다면 출판사의 오름차순으로 조회
select * from Book order by price desc,publisher asc;

-- 8. 고객이 주문한 도서의 총 판매액을 조회
select sum(saleprice) as 총매출 from Orders;

-- 8-1. 김연아 고객이 주문한 도서의 총 판매액을 조회
select sum(saleprice) as 총매출 from Orders where custid=2;

-- 8-3. 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 조회
select sum(saleprice) as total, avg(saleprice) as Average, min(saleprice) as Mininum, max(saleprice) as Maxium
from Orders;

-- 8-4. 마당 서점의 도서 판매 건수를 조회
select count(*) as'도서판매 건수' from Orders;

-- 9. 고객별로 주문한 도서의 총 수량과 총 판매액을 조회
select  custid, count(*) as 도서수량,sum(saleprice) as 총판매액 
from Orders group by custid;

-- 9-1. 이름으로
select c.name as '이름',count(*) as'총수량',sum(o.saleprice) as'총판매액'
from Orders o join Customer c on o.custid= c.custid group by c.custid;

-- 9-2. 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총수량 조회 
-- 단 두권 이상 구매한 고객만 조회
-- count(*) : 테이블의 모든 행수를 센다 단 not null
select custid, count(*) as 총수량 from Orders
where saleprice >= 8000 group by custid having count(*)>=2;

-- 9-3. group by로 해당컬럼으로 묶은 후 select에는 group by에서 사용한 컬럼과 집계함수만
-- 올림수 있다
select custid,sum(saleprice) from Orders
group by custid;

-- haveing <검색 조건>뒤에는 sum,avg,max,min,count 집계함수가 와야한다
select custid, count(*) as 총수량 from Orders
where saleprice >= 8000 group by custid having count(*)>=2;

select * from Customer join Orders;

select * from customer,orders;

select * from customer,orders where Customer.custid= Orders.custid;
select * from customer,orders where Orders.custid= Customer.custid;

-- 고객과 고객의 주문에 대한 데이터를 고객번호 순으로 정렬조회
select * from Customer,orders
where Customer.custid=Orders.custid order by Customer.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 조회
select name,saleprice from Customer,orders
where Customer.custid=Orders.custid;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객별로 정렬 조회
select name, sum(saleprice) from orders, customer
where orders.custid= customer.custid
group by customer.custid order by customer.name;


select o.orderdate, sum(o.saleprice)
from orders o, customer c
where c.custid = o.custid 
group by o.custid;
-- order by o.custid;
use madang;

select * from customer;
select * from orders;

-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회
select c.name, b.bookname, o.saleprice
from orders o
left join customer c
on c.custid = o.custid
left join book b
on o.bookid = b.bookid
where b.price = 20000;

-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 주문한 도서의 판매가격조회
select c.name, b.bookname, o.saleprice
from customer c
left join  orders o
on c.custid = o.custid
left join book b
on o.bookid = b.bookid;


select c.name, o.saleprice
from customer c
left join  orders o
on c.custid = o.custid;

-- 가장 비싼 도서의 이름조회
select * 
from book
where price = (select max(price) from book);

-- 도서를 구매한 적이 있는 고객의 이름을 조회
select distinct c.name
from customer c
right join  orders o
on c.custid = o.custid;

use madang;
-- 대한미디어에서 출판한 도서를 구매한 고객의 이름
select c.name, b.bookname, b.publisher, o.saleprice
from customer c left join  orders o on c.custid = o.custid
left join book b on o.bookid = b.bookid where b.publisher = '대한미디어';


select name from customer
where custid in ( select custid from orders where bookid 
in (select bookid from book where publisher = '대한미디어'	));


-- 출판사별로 출판사의 평균도서 가격보다 비싼도서
select a.bookname, a.price, b.price avg_price
from ( select * from book) a
inner join
	(select publisher, round(avg(price)) price from book
	group by publisher ) b on a.publisher = b.publisher
where a.price > b.price;

-- 대한민국에서 거주하고 도서를 주문한 고객의 이름 조회

select distinct c.name from customer c 
left join orders o on c.custid = o.custid
where address like '대한민국%' and saleprice is not null;

-- 대한민국에서 거주하는 고객의 이름과 도서를 주문한 고객의 이름을 빼고 조회
select distinct c.name from customer c where address like '대한민국%'
union
select distinct c.name from orders o, customer c where o.custid = c.custid;

-- 대한민국에서 거주하는 고객의 이름에서 도서를 주문한 고객의 이름을 빼고 조회
select * from customer 
where address like '대한민국%'
and name not in (select distinct c.name	from customer c 
inner join orders o	on o.custid = c.custid);

-- 대한민국에서 거주하는 고객 중 도서를 주문한 고객의 이름을 조회
select * from customer where address like '대한민국%'
and name in (select distinct c.name from customer c	
inner join orders o	on o.custid = c.custid);
                                
-- 주문이 있는 고객의 이름과 주소를 조회 exists
select name, address from customer c where exists ( select *	from orders o
where o.custid = c.custid);
                
-- 주문이 하지 않은 고객의 이름과 주소를 조회 not exists
select name, address from customer c
where not exists (select * from orders o where o.custid = c.custid );

/*
create table newbook(
bookid int,
bookname varchar(20),
publisher varchar(20),
price integer,
    
primary key(bookname,publisher)
);    

create table newbook(
bookname varchar(20),
publisher varchar(20),
price integer default 10000 check(price>1000),
primary key(bookname, publisher)
);   

create table  NewOrder(
orderid integer,
custid integer not null,
booid integer not null,
saleprice integer,
primary key(orderid),
    
foreign key(userid) references NewCustomer(custid : primary key) 
on delete cascade
);
alter : 생성된 테이블의 속성과 속성에 관한 제약을 변경하며 기본키 및 외래키를 변경함     
add,drop : 속성을 추가하거나 제거
modify : 속성의 기본값을 설정하거나 삭제

1)NewBook 테이블에 varchar(13)의 자료형을 가진 isbn속성을 추가
  alter table NewBook add isbn varchar(13);
2) NewBook테이블의 isbn속성의 데이터 타입을 interger형으로 바꿈
  alter table NewBook modify isbn integer;
3) NewBook 테이블 isbn속성 삭제
  alter table NewBook drop column isban ;
4) NewBook 테이블의 bookid 속성에  not null 제약조건을 적용
  alter table NewBook modify bookid integer not null;
5) NewBook 테이블의 bookid 속성을 기본키로 변경
  alter table NewBook add primary key(bookid);

	alter table 테이블 이름 
       add 속성이름 데이터 타입
       drop column 속성이름
       modify 속성이름 데이터타입
       modify 속성이름 null | not null
       add primary key 속성이름
       add | drop 제약이름

6) NewBook 테이블 삭제
   drop tale NewBook;  
                 
*/
-- Book 테이블에 추가 
insert into book(bookid,bookname,publisher,price)
		values(11,'스포츠 의학','한솔의학서적',90000);

select * from Book;

create table Imported_Book(bookid integer, bookname varchar(40),publisher varchar(40),
price integer);

insert into Imported_Book values (21,'Zen Golf','Pearson',12000);
insert into Imported_Book values (22,'Soccer Skills','Human Kinetics',15000);

select * from Imported_Book;

commit;

-- imported_Book를 Book테이블에 모두 삽입
insert into Book(bookid,bookname,price,publisher)
	select bookid,bookname,price,publisher
    from Imported_Book;
    
select * from Book;

update Customer
set address='대한민국 부산'
where custid =5;

select * from customer;

-- 11번 '스포츠 의학'의 출판사를 imported_book테이블의 21번 출판사와 동일하게 변경
update Book
set publisher=(select publisher from imported_book where bookid='21')
where bookid='11';

select * from book;

-- Book 테이블에서 도서번호가 11인 도서를 삭제
delete from Book where bookid='11';

rollback;

commit;

-- 3월 28일
-- 절대값 가상테이블 dual
select abs(-78),abs(+78)
from dual;

-- 반올림 
select round(4.875,2)
from dual;

-- 함수 연산 
-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값
select custid '고객번호',round(sum(saleprice)/count(*),-2)'평균금액'
from orders
group by custid;

select round(14335645.4555,-2)
from dual;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경
select bookid,replace(bookname,'야구','농구')bookname,publisher,price
from Book; 

select *from Book;

commit;

select bookname'제목',char_length(bookname)'문자수',
length(bookname)'바이트수'
from Book where publisher='굿스포츠';

-- 마당 서점 고객 중에서 같은 성을 가진 사람이 몇명이나 되는 지 성별 인원수를 조회
select substr(name,1,1)'성',count(*)'인원' from Customer
group by substr(name,1,1);

select substr('abcdedg',3,4)
from dual;

-- 마당서점은 주문일로부터 10일 후 매출을 확정한다 각 주문의 확정날짜 조회
select orderid'주문번호',orderdate'주문일',
	adddate(orderdate,interval 10 day)'확정'
from Orders;

-- 마당 서점이 2014년 7월 7일 주문받은 도서의 주문번호,주문일,고객번호,도서번호를 조회
-- 단,주문일은 '%y%m%d'형태로 표시
--
select orderid'주문번호',orderdate'주문일',
	   custid'고객번호',bookid'도서번호'
from Orders
where orderdate = '2014-07-07';

select orderid'주문번호',str_to_date(orderdate,'%y-%m-%d')'주문일',
	   custid'고객번호',bookid'도서번호'
from Orders
where orderdate = date_format('2014-07-07','%y%m%d');

-- DBMS 시스템상의 오늘 날짜를 반환 sysdate

select sysdate() from dual;
select sysdate(),
		date_format(sysdate(),'%y/%m/%d %m %h:%s')'sysdate_1';
        
create table Mybook(
bookid int,
price int);

insert into Mybook values(1,10000);
insert into Mybook values(2,20000);
insert into Mybook values(3,null);

select * from Mybook;

-- null 값에 대한 연산 ==> null
select price +100 from Mybook where bookid=3;

select sum(price),avg(price),count(*),count(price) from Mybook
where bookid >=4;

select sum(price),avg(price),count(*)  from Mybook where bookid >=4;
	
select * from Mybook  where price is null;

select * from Mybook  where price ='';

select * from Mybook where price is not null;

-- 이름,전화번호가 포함된 고객목록 조회, 단 전화번호가 없는 고객은 '연락처없음'으로 표시
select name'이름',ifnull(phone,'연락처없음')'전화번호'
from customer;

-- @변수
set @seq:=0;
select(@seq:=@seq+1) '순번',custid,name,phone
from customer
where @seq<2;

-- practice
select * from Book;


set @rnum:=0;
select *,@rnum:=@rnum+1 as rownum
from Book; 

-- set@rnum=0;
set @rnum:=0;
select *,@rnum:=@rnum+1 as rownum
from Book,(select @rum:=0 from dual) r
where @rnum<5; 

select *,@rnum:=@rnum+1 as rownum
from Book,(select @rnum:=1 ) r
where @rnum <=5 
order by price;

select *,@rnum:=@rnum+1 as rownum
from (select *from Book order by price) b,
	 (select @rnum:=0) r
where @rnum<5;

-- subquery
-- 마당서점의 고객별 판매액을 조회(고객이름과 고객별 판매액을 출력)
select (select name from customer cs where cs.custid=od.custid)'name',
       sum(saleprice)'total'
from orders od group by od.custid;

-- orders 테이블에 각 주문에 맞는 도서 이름 조회
alter table Orders add bname varchar(40);
update Orders
set bname =(select bookname from Book where book.bookid=orders.bookid );

select * from Orders;

-- 고객번호가 2이하인 고객의 판매액 조회(고객이름과 고객별 판매액 출력)
select cs.name, sum(od.saleprice)'total'
from (select custid,name from customer where custid <=2) cs,Orders od
where cs.custid=od.custid
group by cs.custid; -- group by cs.name

-- 평균 주문금액 이하의 주문에 대하여 주문번호와 금액을  조회
select orderid,custid,saleprice
from Orders od
where saleprice> (select avg(saleprice) 
                  from orders so
                  where od.custid=so.custid);
                  
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액 조회
select sum(saleprice)'total' 
from orders
where custid in (select custid
				from customer
                where address like '%대한민국%');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액
select orderid,saleprice
from Orders
where saleprice >all(select saleprice from Orders where custid='3');

-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액 조회
-- exists : 존재 유무 확인
select sum(saleprice)'total' 
from orders od
where exists (select * from customer cs where address like '%대한민국%'
              and cs.custid=od.custid);
              
-- view (하나 이상의 테이블을 합하여 만든 가상의 테이블)
-- 자주 사용되는 복잡한 질의를 뷰로 미리 정의해 놓을 수 있음
-- 사용자별 필요한 데이터만 선별하여 보여 줄수 있고 질의의 경우 내용을 암호화
-- 미리 정의 된 뷰를 일반 테이블처럼 사용할수 있기 때문에 편리하고 사용자가 필요한 정보만 
-- 요구에 맞게 가공하여 뷰로 만들어 쓸 수있음
-- 원본 데이타 값에 따라 값이 변함  독립적인 인텍생성이 어려움 삽입,삭제,갱신 연산에 많은 제약

select *
from book
where bookname like '%축구%';

create view vw_Book 
as select * from Book where bookname like'%축구%';
select * from vw_book;

-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회
-- 뷰의 이름은 vw_customer로 설정
create view vw_Customer 
as select * from Customer where address like'%대한민국%';

select * from vw_Customer;

-- Orders테이블에 고객이름과 도서이름을 바로 확인 할 수 있는 뷰를 생성한 후  
-- '김연아'고객이 구입한 도서의 주문번호,도서이름,주문액을 조회
create view vw_Orders(orderid,custid,name,bookid,bookname,saleprice,orderdate)
as select od.orderid,od.custid,cs.name,od.bookid,bk.bookname,od.saleprice,od.orderdate
from Orders od, Customer cs, Book bk 
where od.custid = cs.custid and od.bookid=bk.bookid;

select orderid, bookname, saleprice 
from vw_orders where name='김연아';

-- 뷰 vw_Customer는 주소가 대한민국인 고객을 보여준다
-- 이 뷰를 영국을 주소로 가진 고객으로 변경  
-- phone 속성은 필요 없으므로 포함시키지 않는다  

create or replace view vw_Customer(custid,name,address)
as select custid,name,address
from customer
where address like '%영국%';

select * from vw_customer;

-- 뷰를 삭제
drop view vw_customer;

-- 다음에 해당하는 뷰를 작성하세요 
-- 데이터베이스는 마당서적 데이터베이스를 이용한다

-- 판매가격이 20000원 이상인 도서의 도서번호,도서이름,고객이름,출판사  
-- 판매가격을 보여주는 highorders뷰를 생성하세요
-- 생성된 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 sql문을 작성
-- highorderes 뷰를 변경하고자 한다 판매가격 속성을 삭제하는 명령을 실행 삭제후 확인하는커리작젓
create view highorders
as select od.bookid, b.bookname, cu.name, b.publisher, od.saleprice
from Orders od, Book b, Customer cu
where od.saleprice >= 20000 and b.bookid=od.bookid and cu.custid =od.custid;

select bookname, name from highorders;



