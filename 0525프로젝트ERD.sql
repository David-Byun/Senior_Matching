-- 테이블 드랍시 사용
-- DROP TABLE ORDER_MALL;
-- DROP TABLE MEMBER;
-- DROP TABLE ITEM;
-- DROP TABLE CART;
-- DROP TABLE ADM;
-- DROP TABLE MATE;
-- DROP TABLE MATCH;
-- DROP TABLE ORDER_MATCH;
-- DROP TABLE COUPON;
-- DROP TABLE CART;
-- DROP TABLE ITEM;
-- DROP TABLE RESERVE;
-- DROP TABLE ITEM_REVIEW;
-- DROP TABLE MATE_REVIEW;
-- DROP TABLE NOTICE;

-- 시퀀스 쿼리
CREATE SEQUENCE MATE_REVIEW_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

CREATE SEQUENCE ORDER_MALL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE NOTICE_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE MEMBER_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE CART_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE ADM_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE REVIEW_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE MATE_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE MATCH_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE ORDER_MATCH_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE ORDER_MALL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE COUPON_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE CART_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE ITEM_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE RESERVE_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당
CREATE SEQUENCE ITEM_REVIEW_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

create table RESERVE
(
    ID  NUMBER,
    MEMBER_ID NUMBER,
    ITEM_ID   NUMBER
);

create table CART
(
    ID        NUMBER,
    MEMBER_ID NUMBER,
    ITEM_ID   NUMBER,
    CNT       NUMBER,
    RDATE     TIMESTAMP(6)
);

create table MATE_INFO
(
    ID           NUMBER,
    MATE_ID      NUMBER,
    RATE         NUMBER
);


CREATE TABLE ORDER_MATCH (
                             ID             NUMBER,
                             MEMBER_ID      NUMBER,
                             START_DATE     VARCHAR2(20),
                             END_DATE       VARCHAR2(20),
                             SERVICE        VARCHAR2(20),
                             AREA           VARCHAR2(20),
                             OBJECT_GENDER  VARCHAR2(10),
                             OBJECT_BIRTH   VARCHAR2(20),
                             RDATE          DATE
);

CREATE TABLE ORDER_MALL (
                            ID  NUMBER,
                            MEMBER_ID NUMBER,
                            PRICE NUMBER,
                            RDATE DATE,
                            NAME VARCHAR2(20),
                            ADDR VARCHAR2(100),
                            TEL VARCHAR2(25),
                            CNT NUMBER
);

create table MEMBER
(
    ID              NUMBER,
    EMAIL           VARCHAR2(45),
    NAME            VARCHAR2(15),
    PASSWORD        VARCHAR2(150),
    BIRTH           VARCHAR2(15),
    TEL             VARCHAR2(20),
    ADDR            VARCHAR2(100),
    IMG             VARCHAR2(200),
    VALID           CHAR(1)
);

create table MATE
(
    ID              NUMBER,
    EMAIL           VARCHAR2(30),
    NAME            VARCHAR2(15),
    PASSWORD        VARCHAR2(150),
    AREA            VARCHAR2(50),
    JOB_PERIOD      NUMBER,
    LICENSE         VARCHAR2(150),
    IMG             VARCHAR2(200),
    VALID           CHAR(1)
);

CREATE TABLE MATE_REVIEW
(
    ID          NUMBER,
    MATE_ID     NUMBER,
    MEMBER_ID   NUMBER,
    RATE        NUMBER,
    CONTENT     VARCHAR2(1000),
    IMG         VARCHAR2(200)
);

CREATE TABLE NOTICE
(
    ID          NUMBER,
    ADM_ID      NUMBER,
    TITLE       VARCHAR2(200),
    WRITER      VARCHAR2(15),
    IMG         VARCHAR2(600),
    HIT         NUMBER,
    RDATE       DATE
);

create table ITEM
(
    ID          NUMBER not null primary key,
    REGISTER_ID NUMBER,
    NAME        VARCHAR2(150),
    IMG         VARCHAR2(600),
    PRICE       NUMBER,
    ITEM_SIZE   VARCHAR2(10),
    COLOR       VARCHAR2(5),
    RDATE       DATE,
    UDATE       DATE,
    IS_VALID    VARCHAR2(1)
);

create table ADM
(
    ID          NUMBER not null primary key,
    ADMIN_ID    VARCHAR2(30),
    PWD         VARCHAR2(60)
);

create table ITEM_REVIEW
(
    ID      NUMBER not null primary key,
    MEMBER_ID NUMBER,
    ITEM_ID NUMBER,
    TITLE   VARCHAR2(100),
    REVIEW  VARCHAR2(300),
    RATE    NUMBER
);

create table MATCH
(
    ID              NUMBER,
    MEMBER_ID       NUMBER,
    MATE_ID         NUMBER,
    START_DATE      VARCHAR2(20),
    END_DATE        VARCHAR2(20),
    SERVICE         VARCHAR2(20),
    AREA            VARCHAR2(20),
    OBJECT_GENDER   VARCHAR2(20),
    OBJECT_BIRTH    VARCHAR2(20),
    STATUS          VARCHAR2(20),
    PRICE           NUMBER,
    PAYMENT         VARCHAR2(10),
    PAY_DATE        DATE 
);

create table RESERVATION
(
    ID          NUMBER,
    MEMBER_ID   NUMBER,
    HELPER_ID   NUMBER,
    START_AT    TIMESTAMP,
    END_AT      TIMESTAMP,
    STATUS      VARCHAR2(5)
);

create table COUPON
(
    ID          NUMBER,
    MEMBER_ID   NUMBER,
    NUM         NUMBER,
    AMOUNT      NUMBER
);

/*************샘플 데이터 *******************/

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (1, 1, 'product2', 'product-2.jpg', 3000, 'L', 'Black', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (2, 1, 'product2', 'product-2.jpg', 3000, 'L', 'Black', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (3, 2, 'product3', 'product-3.jpg', 3000, 'XL', 'Blue', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (4, 2, 'product4', 'product-4.jpg', 3000, 'L', 'White', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (5, 2, 'product5', 'product-5.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (6, 2, 'product6', 'product-6.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (7, 3, 'product7', 'product-7.jpg', 3000, 'M', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (8, 3, 'product8', 'product-8.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (9, 3, 'product9', 'product-9.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (10, 4, 'product10', 'product-10.jpg',3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (11, 4, 'product11', 'product-11.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (12, 4, 'product12', 'product-12.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (13, 5, 'product13', 'product-13.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (14, 5, 'product14', 'product-14.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (15, 6, 'product15', 'product-15.jpg', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (16, 6, 'product15', 'product-15.jpg',3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (17, 7, 'product15', 'product-15.jpg',3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (18, 9, 'product15', 'product-15.jpg',3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (19, 10, 'product15', 'product-15.jpg',3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (20, 11, 'product15', 'product-15.jpg',3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (21, 9, 'product15', 'product-15.jpg',3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (22, 8, 'product15', 'product-15.jpg',3000, 'XL', 'Red', SYSDATE, 1);


/*************샘플 데이터 (( Mate )) *******************/

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID)
VALUES (2000,'a@naver.com','김우기','1234','관악구',3,'요양보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2001,'a@naver.com','전소연','1234','관악구',3,'요양보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2002,'a@naver.com','김미연','1234','관악구',3,'요양보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2003,'a@naver.com','뱀뱀','1234','관악구',3,'요양보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2004,'a@naver.com','백종원','1234','관악구',3,'요양보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2005,'a@naver.com','이시언','1234','관악구',3,'요양보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2006,'a@naver.com','안보현','1234','관악구',3,'장애인보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2007,'a@naver.com','곽튜브','1234','강남구',3,'장애인보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2008,'a@naver.com','빠니보틀','1234','강남구',3,'장애인보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2009,'a@naver.com','원지','1234','강남구',3,'장애인보호사','a.jpg','1');

INSERT INTO MATE (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2010,'a@naver.com','다나카','1234','강남구',3,'장애인보호사','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2011,'a@naver.com','주현영','1234','강남구',3,'사회복지사2급','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2012,'a@naver.com','닝닝','1234','영등포구',3,'사회복지사2급','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2013,'a@naver.com','미미','1234','영등포구',3,'사회복지사2급','a.jpg','1');

INSERT INTO Mate (ID,EMAIL,NAME,PASSWORD,AREA,JOB_PERIOD,LICENSE,IMG,VALID) VALUES
    (2014,'a@naver.com','카리나','1234','영등포구',3,'사회복지사2급','a.jpg','1');

/*************샘플 데이터 (( ORDER_MATCH )) *******************/

INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9000,1000,'2023-05-25','2023-05-26','care','관악구','f','1942-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9001,1001,'2023-05-25','2023-05-26','disease','관악구','m','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9002,1002,'2023-05-25','2023-05-26','disabled','관악구','f','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9003,1003,'2023-05-25','2023-05-27','care','관악구','m','1945-01-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9004,1004,'2023-05-25','2023-05-27','disease','관악구','f','1945-01-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9005,1005,'2023-05-25','2023-05-27','disabled','관악구','m','1945-01-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9006,1006,'2023-05-26','2023-05-27','care','성동구','f','1945-01-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9007,1007,'2023-05-26','2023-05-27','disease','성동구','m','1945-01-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9008,1008,'2023-05-26','2023-05-29','disabled','성동구','f','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9009,1009,'2023-05-26','2023-05-29','care','성동구','m','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9010,1010,'2023-05-27','2023-05-28','disease','성동구','f','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9011,1011,'2023-05-27','2023-05-28','disabled','영등포구','m','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9012,1012,'2023-05-27','2023-05-28','care','영등포구','f','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (9013,1012,'2023-05-27','2023-05-29','care','영등포구','f','1943-05-01','23/05/26');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (235,1000,'2023-06-01','2023-06-02','요양','강남구','F','1945-01-01','23/06/02');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (236,1000,'2023-06-01','2023-06-02','요양','강남구','F','1945-01-01','23/06/02');
INSERT INTO ORDER_MATCH (ID,MEMBER_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,RDATE) VALUES
    (237,1000,'2023-05-25','2023-05-26','요양','강남구','F','1945-01-01','23/06/02');


/*************샘플 데이터 (( MATCH )) *******************/

INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (40,1000,2000,'2023-05-24','2023-05-26','요양','요양','F','1945-01-01','결제완료',NULL,NULL,NULL);
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (41,1000,2000,'2023-06-01','2023-06-02','요양','요양','F','1945-01-01','매칭대기',NULL,NULL,NULL);
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (37,1000,2000,'2023-06-01','2023-06-02','요양','요양','F','1945-01-01','결제완료',NULL,NULL,NULL);
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (500,1000,2000,'2023-05-25','2023-05-26','요양','관악구','f','1942-05-01','매칭대기',100000,'card','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (501,1001,2001,'2023-05-25','2023-05-26','질병','관악구','m','1943-05-01','매칭대기',100000,'card','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (502,1002,2002,'2023-05-25','2023-05-26','장애','관악구','f','1944-05-01','매칭대기',100000,'card','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (503,1003,2003,'2023-05-25','2023-05-27','요양','관악구','m','1945-05-01','결제대기',100000,'card','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (504,1004,2004,'2023-05-25','2023-05-27','질병','관악구','f','1942-06-01','결제대기',100000,'card','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (505,1005,2005,'2023-05-25','2023-05-27','장애','관악구','m','1942-06-02','결제대기',100000,'card','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (506,1006,2006,'2023-05-26','2023-05-27','요양','성동구','f','1942-06-03','결제대기',100000,'card','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (507,1007,2007,'2023-05-26','2023-05-27','질병','성동구','m','1942-06-04','결제대기',100000,'apppay','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (508,1008,2008,'2023-05-26','2023-05-29','장애','성동구','f','1943-05-01','결제완료',100000,'apppay','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (509,1009,2009,'2023-05-26','2023-05-29','요양','성동구','m','1943-05-02','결제완료',100000,'apppay','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (510,1010,2010,'2023-05-27','2023-05-28','질병','성동구','f','1943-05-03','결제완료',100000,'apppay','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (511,1011,2011,'2023-05-27','2023-05-28','장애','영등포구','m','1943-05-04','결제완료',100000,'apppay','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (512,1012,2012,'2023-05-27','2023-05-28','요양','영등포구','f','1944-05-01','결제완료',100000,'apppay','20230526');
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (38,1000,2000,'2023-06-01','2023-06-02','요양','요양','F','1945-01-01','매칭대기',NULL,NULL,NULL);
INSERT INTO MATCH (ID,MEMBER_ID,MATE_ID,START_DATE,END_DATE,SERVICE,AREA,OBJECT_GENDER,OBJECT_BIRTH,STATUS,PRICE,PAYMENT,PAY_DATE) VALUES
    (39,1000,2000,'2023-05-25','2023-05-26','요양','요양','F','1945-01-01','매칭대기',NULL,NULL,NULL);
