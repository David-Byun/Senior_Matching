drop table ORDER_TB;
drop table MEMBER;
drop table ITEM;
drop table CART;
drop table ADM;
drop table REVIEW;

CREATE SEQUENCE ORDER_SEQ --시퀀스이름 WDRL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

CREATE SEQUENCE TOKEN_SEQ
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999999999
    NOCYCLE
    NOCACHE;

CREATE SEQUENCE MATE_REVIEW_SEQ
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999999999
    NOCYCLE
    NOCACHE;

CREATE SEQUENCE MEMBER_SEQ --시퀀스이름 WDRL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

CREATE SEQUENCE ITEM_SEQ --시퀀스이름 WDRL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

CREATE SEQUENCE CART_SEQ --시퀀스이름 WDRL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

CREATE SEQUENCE ADM_SEQ --시퀀스이름 WDRL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

CREATE SEQUENCE REVIEW_SEQ --시퀀스이름 WDRL_SEQ
    INCREMENT BY 1 --증감숫자 1
    START WITH 1 --시작숫자 1
    MINVALUE 1 --최소값 1
    MAXVALUE 9999999999 --최대값
    NOCYCLE --순한하지않음
    NOCACHE; --메모리에 시퀀스값 미리할당

CREATE SEQUENCE reserve_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE match_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE recommend_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE reservation_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE score_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE coupon_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE helper_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

create table reserve
(
    ID  NUMBER primary key,
    MEMBER_ID NUMBER,
    ITEM_ID   NUMBER
);

CREATE TABLE ORDER_TB (
                          id  NUMBER not null primary key,
                          member_id NUMBER,
                          price NUMBER,
                          rdate DATE,
                          name VARCHAR2(20),
                          zipcode VARCHAR2(20),
                          addr VARCHAR2(100),
                          tel VARCHAR2(25),
                          cnt NUMBER
);

create table MEMBER
(
    ID  NUMBER not null primary key,
    MEMBER_ID VARCHAR2(45),
    NAME      VARCHAR2(15),
    PASSWORD  VARCHAR2(150),
    RDATE     DATE,
    VALID     NUMBER(1),
    DISEASE   VARCHAR2(30),
    BIRTH     DATE,
    ADDR      VARCHAR2(100),
    IMG       VARCHAR2(200)
);

create table HELPER
(
    ID              NUMBER not null primary key,
    HELPER_ID       VARCHAR2(15),
    NAME            VARCHAR2(15),
    PASSWORD        VARCHAR2(150),
    RDATE           DATE,
    VALID           NUMBER,
    RATE            NUMBER,
    JOB_PERIOD      NUMBER,
    LICENSE         VARCHAR2(100),
    IMG             VARCHAR2(200)
);


create table ITEM
(
    ID  NUMBER not null primary key,
    REGISTER_ID NUMBER,
    NAME        VARCHAR2(150),
    IMG         VARCHAR2(600),
    REVIEW      VARCHAR2(1000),
    PRICE       NUMBER,
    ITEM_SIZE   VARCHAR2(10),
    COLOR       VARCHAR2(5),
    RDATE       DATE,
    UDATE       DATE,
    IS_VALID    VARCHAR2(1)
);

create table CART
(
    ID  NUMBER not null primary key,
    MEMBER_ID NUMBER,
    ITEM_ID   NUMBER,
    CNT       NUMBER,
    RDATE     TIMESTAMP(6)
);

create table ADM
(
    ID  NUMBER not null primary key,
    ADMINID VARCHAR2(30),
    PWD     VARCHAR2(60),
);

create table REVIEW
(
    ID  NUMBER not null primary key,
    USER_ID NUMBER,
    ITEM_ID NUMBER,
    TITLE   VARCHAR2(100),
    REVIEW  VARCHAR2(300),
    RATE    NUMBER,
    DIVISION CHAR(1)
--     S이면 쇼핑 H이면 간병
);

create table MATCH
(
    ID          NUMBER not null primary key,
    MEMBER_ID   NUMBER,
    HELPER_ID   NUMBER,
    START_AT    TIMESTAMP,
    END_AT      TIMESTAMP,
    STATUS      VARCHAR2(5)
);

create table RESERVATION
(
    ID          NUMBER not null primary key,
    MEMBER_ID   NUMBER,
    HELPER_ID   NUMBER,
    START_AT    TIMESTAMP,
    END_AT      TIMESTAMP,
    STATUS      VARCHAR2(5)
);

create table COUPON
(
    ID       NUMBER not null primary key,
    NUM      NUMBER,
    AMOUNT   NUMBER
);

create table SCORE
(
    ID              NUMBER not null primary key,
    MEMBER_ID       NUMBER,
    HELPER_ID       NUMBER,
    REGION_SCORE    NUMBER,
    JOB_SCORE       NUMBER,
    CERT_SCORE      NUMBER
);

create table MATE_REVIEW (
    ID number not null primary key,
    RATE number,
    CONTENT varchar2(1000),
    MATE_ID number,
    MEMBER_ID number,
    RDATE SYSDATE
);

CREATE TABLE TOKEN (
                       id NUMBER,
                       token VARCHAR2(300),
                       rdate DATE DEFAULT SYSDATE
);


/*************샘플 데이터 *******************/

INSERT INTO review VALUES (review_seq.NEXTVAL,101,1,'좋아요','좋은 상품이예요 모두 구매해주세요',5);
INSERT INTO review VALUES (review_seq.NEXTVAL,101,2,'좋아요','좋은 상품이에요 모두 구매해주세요',4);
INSERT INTO review VALUES (review_seq.NEXTVAL,101,3,'보통이','보통이예요',3);
INSERT INTO review VALUES (review_seq.NEXTVAL,201,4,'보통이','보통이예요',2);
INSERT INTO review VALUES (review_seq.NEXTVAL,201,5,'보통이','보통이예요',1);
INSERT INTO review VALUES (review_seq.NEXTVAL,201,6,'좋아요','좋은 상품이에요 모두 구매해주세요',5);
INSERT INTO review VALUES (review_seq.NEXTVAL,201,7,'좋아요','좋은 상품이에요 모두 구매해주세요',4);
INSERT INTO review VALUES (review_seq.NEXTVAL,201,8,'보통이','보통이예요',3);
INSERT INTO review VALUES (review_seq.NEXTVAL,201,9,'보통이','보통이예요',2);
INSERT INTO review VALUES (review_seq.NEXTVAL,201,10,'보통이','보통이예요',1);
INSERT INTO review VALUES (review_seq.NEXTVAL,301,4,'좋아요','좋은 상품이에요 모두 구매해주세요',5);
INSERT INTO review VALUES (review_seq.NEXTVAL,301,5,'좋아요','좋은 상품이에요 모두 구매해주세요',4);
INSERT INTO review VALUES (review_seq.NEXTVAL,301,1,'보통이','보통이예요',3);
INSERT INTO review VALUES (review_seq.NEXTVAL,301,2,'보통이','보통이예요',2);
INSERT INTO review VALUES (review_seq.NEXTVAL,301,3,'보통이','보통이예요',1);
INSERT INTO review VALUES (review_seq.NEXTVAL,301,11,'보통이','보통이예요',1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (1, 1, 'product2', 'product-2.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'L', 'Black', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (2, 1, 'product2', 'product-2.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'L', 'Black', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (3, 2, 'product3', 'product-3.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Blue', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (4, 2, 'product4', 'product-4.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'L', 'White', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (5, 2, 'product5', 'product-5.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (6, 2, 'product6', 'product-6.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (7, 3, 'product7', 'product-7.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'M', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (8, 3, 'product8', 'product-8.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (9, 3, 'product9', 'product-9.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (10, 4, 'product10', 'product-10.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (11, 4, 'product11', 'product-11.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (12, 4, 'product12', 'product-12.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (13, 5, 'product13', 'product-13.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (14, 5, 'product14', 'product-14.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (15, 6, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (16, 6, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (17, 7, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (18, 9, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (19, 10, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (20, 11, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (21, 9, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

INSERT INTO Item (id, register_id, name, img, review, price, ITEM_SIZE, color, rdate, is_valid)
VALUES (22, 8, 'product15', 'product-15.jpg','좋은 상품이에요 모두 구매해주세요', 3000, 'XL', 'Red', SYSDATE, 1);

-- Populate the MATCH table with sample data
INSERT INTO MATCH (ID, MEMBER_ID, HELPER_ID, START_AT, END_AT, STATUS)
SELECT 1, 1001, 2001, TIMESTAMP '2023-05-01 09:00:00', TIMESTAMP '2023-05-01 12:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 2, 1002, 2002, TIMESTAMP '2023-05-02 14:00:00', TIMESTAMP '2023-05-02 16:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 3, 1003, 2003, TIMESTAMP '2023-05-03 10:00:00', TIMESTAMP '2023-05-03 11:30:00', 'INACTIVE' FROM DUAL UNION ALL
SELECT 4, 1004, 2004, TIMESTAMP '2023-05-04 13:00:00', TIMESTAMP '2023-05-04 16:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 5, 1005, 2005, TIMESTAMP '2023-05-05 09:00:00', TIMESTAMP '2023-05-05 12:30:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 6, 1006, 2006, TIMESTAMP '2023-05-06 10:00:00', TIMESTAMP '2023-05-06 14:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 7, 1007, 2007, TIMESTAMP '2023-05-07 13:00:00', TIMESTAMP '2023-05-07 16:30:00', 'INACTIVE' FROM DUAL UNION ALL
SELECT 8, 1008, 2008, TIMESTAMP '2023-05-08 11:00:00', TIMESTAMP '2023-05-08 13:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 9, 1009, 2009, TIMESTAMP '2023-05-09 14:00:00', TIMESTAMP '2023-05-09 16:30:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 10, 1010, 2010, TIMESTAMP '2023-05-10 09:00:00', TIMESTAMP '2023-05-10 11:30:00', 'INACTIVE' FROM DUAL;

-- Populate the RESERVATION table with sample data
INSERT INTO RESERVATION (ID, MEMBER_ID, HELPER_ID, START_AT, END_AT, STATUS)
SELECT 1, 1001, 2001, TIMESTAMP '2023-05-01 09:00:00', TIMESTAMP '2023-05-01 12:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 2, 1002, 2002, TIMESTAMP '2023-05-02 14:00:00', TIMESTAMP '2023-05-02 16:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 3, 1003, 2003, TIMESTAMP '2023-05-03 10:00:00', TIMESTAMP '2023-05-03 11:30:00', 'INACTIVE' FROM DUAL UNION ALL
SELECT 4, 1004, 2004, TIMESTAMP '2023-05-04 13:00:00', TIMESTAMP '2023-05-04 16:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 5, 1005, 2005, TIMESTAMP '2023-05-05 09:00:00', TIMESTAMP '2023-05-05 12:30:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 6, 1006, 2006, TIMESTAMP '2023-05-06 10:00:00', TIMESTAMP '2023-05-06 14:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 7, 1007, 2007, TIMESTAMP '2023-05-07 13:00:00', TIMESTAMP '2023-05-07 16:30:00', 'INACTIVE' FROM DUAL UNION ALL
SELECT 8, 1008, 2008, TIMESTAMP '2023-05-08 11:00:00', TIMESTAMP '2023-05-08 13:00:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 9, 1009, 2009, TIMESTAMP '2023-05-09 14:00:00', TIMESTAMP '2023-05-09 16:30:00', 'ACTIVE' FROM DUAL UNION ALL
SELECT 10, 1010, 2010, TIMESTAMP '2023-05-10 09:00:00', TIMESTAMP '2023-05-10 11:30:00', 'INACTIVE' FROM DUAL;

-- Populate the COUPON table with sample data
INSERT INTO COUPON (ID, NUM, AMOUNT)
SELECT 1, 12345, 10 FROM DUAL UNION ALL
SELECT 2, 67890, 20 FROM DUAL UNION ALL
SELECT 3, 24680, 15 FROM DUAL UNION ALL
SELECT 4, 13579, 25 FROM DUAL UNION ALL
SELECT 5, 86420, 30 FROM DUAL UNION ALL
SELECT 6, 97531, 12 FROM DUAL UNION ALL
SELECT 7, 80246, 18 FROM DUAL UNION ALL
SELECT 8, 31976, 22 FROM DUAL UNION ALL
SELECT 9, 52468, 16 FROM DUAL UNION ALL
SELECT 10, 91753, 28 FROM DUAL;

-- Populate the SCORE table with sample data
INSERT INTO SCORE (ID, MEMBER_ID, HELPER_ID, REGION_SCORE, JOB_SCORE, CERT_SCORE)
SELECT 1, 1001, 2001, 8, 7, 9 FROM DUAL UNION ALL
SELECT 2, 1002, 2002, 7, 9, 6 FROM DUAL UNION ALL
SELECT 3, 1003, 2003, 9, 8, 7 FROM DUAL UNION ALL
SELECT 4, 1004, 2004, 6, 7, 8 FROM DUAL UNION ALL
SELECT 5, 1005, 2005, 8, 9, 7 FROM DUAL UNION ALL
SELECT 6, 1006, 2006, 7, 8, 9 FROM DUAL UNION ALL
SELECT 7, 1007, 2007, 9, 7, 8 FROM DUAL UNION ALL
SELECT 8, 1008, 2008, 8, 9, 7 FROM DUAL UNION ALL
SELECT 9, 1009, 2009, 7, 8, 9 FROM DUAL UNION ALL
SELECT 10, 1010, 2010, 9, 7, 8 FROM DUAL;

-- Populate the MEMBER table with sample data
INSERT INTO MEMBER (ID, MEMBER_ID, NAME, PASSWORD, RDATE, VALID, DISEASE, BIRTH, ADDR, IMG)
SELECT 1, 'member001', 'John Doe', 'password123', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 1, 'None', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '123 Main St', 'member001.jpg' FROM DUAL UNION ALL
SELECT 2, 'member002', 'Jane Smith', 'qwerty456', TO_DATE('2023-05-02', 'YYYY-MM-DD'), 1, 'Asthma', TO_DATE('1985-06-15', 'YYYY-MM-DD'), '456 Elm St', 'member002.jpg' FROM DUAL UNION ALL
SELECT 3, 'member003', 'David Johnson', 'pass123word', TO_DATE('2023-05-03', 'YYYY-MM-DD'), 1, 'Diabetes', TO_DATE('1992-09-30', 'YYYY-MM-DD'), '789 Oak St', 'member003.jpg' FROM DUAL UNION ALL
SELECT 4, 'member004', 'Sarah Williams', 'p@ssw0rd', TO_DATE('2023-05-04', 'YYYY-MM-DD'), 1, 'None', TO_DATE('1988-12-10', 'YYYY-MM-DD'), '234 Pine St', 'member004.jpg' FROM DUAL UNION ALL
SELECT 5, 'member005', 'Michael Brown', 'password123', TO_DATE('2023-05-05', 'YYYY-MM-DD'), 1, 'None', TO_DATE('1995-03-20', 'YYYY-MM-DD'), '567 Cedar St', 'member005.jpg' FROM DUAL UNION ALL
SELECT 6, 'member006', 'Emily Davis', 'qwerty456', TO_DATE('2023-05-06', 'YYYY-MM-DD'), 1, 'Allergies', TO_DATE('1991-07-05', 'YYYY-MM-DD'), '890 Walnut St', 'member006.jpg' FROM DUAL UNION ALL
SELECT 7, 'member007', 'Daniel Wilson', 'pass123word', TO_DATE('2023-05-07', 'YYYY-MM-DD'), 1, 'None', TO_DATE('1993-04-18', 'YYYY-MM-DD'), '123 Oak St', 'member007.jpg' FROM DUAL UNION ALL
SELECT 8, 'member008', 'Olivia Martinez', 'p@ssw0rd', TO_DATE('2023-05-08', 'YYYY-MM-DD'), 1, 'High Blood Pressure', TO_DATE('1987-11-25', 'YYYY-MM-DD'), '456 Maple St', 'member008.jpg' FROM DUAL UNION ALL
SELECT 9, 'member009', 'James Anderson', 'password123', TO_DATE('2023-05-09', 'YYYY-MM-DD'), 1, 'None', TO_DATE('1994-02-14', 'YYYY-MM-DD'), '789 Birch St', 'member009.jpg' FROM DUAL UNION ALL
SELECT 10, 'member010', 'Sophia Taylor', 'qwerty456', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 1, 'None', TO_DATE('1998-08-07', 'YYYY-MM-DD'), '234 Oak St', 'member010.jpg' FROM DUAL;

-- Populate the HELPER table with sample data
INSERT INTO HELPER (ID, HELPER_ID, NAME, PASSWORD, RDATE, VALID, RATE, JOB_PERIOD, LICENSE, IMG)
SELECT 1, 'helper001', 'Robert Johnson', 'password123', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 1, 4.5, 2, 'Certified Caregiver', 'helper001.jpg' FROM DUAL UNION ALL
SELECT 2, 'helper002', 'Jennifer Davis', 'qwerty456', TO_DATE('2023-05-02', 'YYYY-MM-DD'), 1, 4.8, 3, 'CPR Certification', 'helper002.jpg' FROM DUAL UNION ALL
SELECT 3, 'helper003', 'Michael Smith', 'pass123word', TO_DATE('2023-05-03', 'YYYY-MM-DD'), 1, 4.2, 5, 'Licensed Practical Nurse', 'helper003.jpg' FROM DUAL UNION ALL
SELECT 4, 'helper004', 'Jessica Wilson', 'p@ssw0rd', TO_DATE('2023-05-04', 'YYYY-MM-DD'), 1, 4.6, 4, 'Certified Nursing Assistant', 'helper004.jpg' FROM DUAL UNION ALL
SELECT 5, 'helper005', 'Christopher Taylor', 'password123', TO_DATE('2023-05-05', 'YYYY-MM-DD'), 1, 4.3, 2, 'First Aid Certification', 'helper005.jpg' FROM DUAL UNION ALL
SELECT 6, 'helper006', 'Emily Brown', 'qwerty456', TO_DATE('2023-05-06', 'YYYY-MM-DD'), 1, 4.7, 3, 'Certified Home Health Aide', 'helper006.jpg' FROM DUAL UNION ALL
SELECT 7, 'helper007', 'William Martinez', 'pass123word', TO_DATE('2023-05-07', 'YYYY-MM-DD'), 1, 4.4, 5, 'Registered Nurse', 'helper007.jpg' FROM DUAL UNION ALL
SELECT 8, 'helper008', 'Ava Anderson', 'p@ssw0rd', TO_DATE('2023-05-08', 'YYYY-MM-DD'), 1, 4.9, 4, 'Certified Personal Care Aide', 'helper008.jpg' FROM DUAL UNION ALL
SELECT 9, 'helper009', 'David Williams', 'password123', TO_DATE('2023-05-09', 'YYYY-MM-DD'), 1, 4.5, 3, 'Emergency Medical Technician', 'helper009.jpg' FROM DUAL UNION ALL
SELECT 10, 'helper010', 'Olivia Smith', 'qwerty456', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 1, 4.6, 2, 