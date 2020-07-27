-- 테이블 생성
create table member(
    member_id varchar2(50),
    member_password varchar2(50),
    member_name varchar2(50),
    member_address varchar2(200),
    member_tel varchar2(50),
    member_email varchar2(50),
    member_birthday varchar2(50),
    member_flag varchar2(50),
    constraint member_pk primary key(member_id)
);
create table animal(
    animal_id number(20),
    animal_name varchar2(50),
    animal_birthday varchar2(50),
    animal_gender varchar2(50),
    animal_feature varchar2(1024),
    animal_type varchar2(50),
    constraint animal_pk PRIMARY KEY(animal_id)
);

create table raise(
    raise_id number(20),
    member_id varchar2(50),
    animal_id number(20),
    constraint raise_pk PRIMARY KEY(raise_id),
    constraint raise_fk_1 foreign key(member_id) references member(member_id) ON DELETE CASCADE,
    constraint raise_fk_2 foreign key(animal_id) references animal(animal_id) ON DELETE CASCADE
);

create table lostboard(
    lostboard_id number(20),
    lostboard_title varchar2(50),
    lostboard_content varchar2(2048),
    lostboard_location varchar2(512),
    lostboard_x varchar2(50),
    lostboard_y varchar2(50),
    lostboard_status varchar2(50), --0 못찾음, 1 찾음
    lostboard_uploadtime date,
    lostboard_findtime date,
    lostboard_readcount number(10),
    member_id varchar2(50),
    animal_id number(20),
    constraint lostboard_pk PRIMARY KEY(lostboard_id),
    constraint lostboard_fk_1 FOREIGN KEY(member_id) references member(member_id) ON DELETE CASCADE,
    constraint lostboard_fk_2 FOREIGN KEY(animal_id) references animal(animal_id) ON DELETE CASCADE
);

create table findboard(
    findboard_id number(20),
    findboard_title varchar2(50),
    findboard_content varchar2(2048),
    findboard_location varchar2(512),
    findboard_x varchar2(50),
    findboard_y varchar2(50),
    findboard_status varchar2(50), --0 목격, 1 보관, 2 유기센터 이관
    findboard_uploadtime date,
    findboard_tel varchar2(50),
    findboard_name varchar2(50),
    findboard_readcount number(10),
    member_id varchar2(50),
    animal_type varchar2(50),
    constraint findboard_pk PRIMARY KEY(findboard_id),
    constraint findboard_fk_1 FOREIGN KEY(member_id) references member(member_id) ON DELETE CASCADE
);

create table shop(
    shop_id number(20),
    shop_name varchar2(50),
    shop_category varchar2(50),
    shop_productname varchar2(50),
    shop_productprice varchar2(50),
    shop_img varchar2(500),
    shop_link varchar2(500),
    constraint shop_pk primary key(shop_id)
);

create table questionboard(
    questionboard_id number(20),
    questionboard_group_id number(20),
    questionboard_title varchar2(50),
    questionboard_content varchar2(2048),
    questionboard_uploadtime date,
    questionboard_readcount number(10),
    member_id varchar2(50),
    constraint questionboard_pk primary key(questionboard_id),
    constraint questionboard_fk_1 foreign key(member_id) references member(member_id) ON DELETE CASCADE
);

create table communityboard(
    communityboard_id number(20),
    communityboard_location varchar2(512),
    communityboard_x varchar2(50),
    communityboard_y varchar2(50),
    communityboard_title varchar2(50),
    communityboard_content varchar2(2048),
    communityboard_uploadtime date,
    communityboard_readcount number(10),
    communityboard_recommend number(10),
    member_id varchar2(20),
    constraint communityboard_pk primary key(communityboard_id),
    constraint communityboard_fk_1 foreign key(member_id) references member(member_id) ON DELETE CASCADE
);

create table boardcomment(
    boardcomment_id number(20),
    boardcomment_content varchar2(512),
    boardcomment_uploadtime date,
    member_id varchar2(20),
    communityboard_id number(20),
    constraint boardcomment_pk primary key(boardcomment_id),
    constraint boardcomment_fk_1 foreign key(member_id) references member(member_id) ON DELETE CASCADE,
    constraint boardcomment_fk_2 foreign key(communityboard_id) references communityboard(communityboard_id) ON DELETE CASCADE
);

create table findhospital(
   findhospital_id number(20),
   findhospital_name varchar2(200),
   findhospital_tel varchar2(50),
   findhospital_address varchar2(500),
   findhospital_x varchar2(500),
   findhospital_y varchar2(500)
   );

-- 상품
create table product(
    product_id number(30),
    product_name varchar2(200),
    product_price number(30),
    product_cnt number(30),
    product_feature varchar2(1024),
    product_content varchar2(1024),
    constraint product_id primary key(product_id)
);
-- 리뷰
create table productreview(
    productreview_id number(30),
    productreview_content varchar2(2048),
    productreview_score number(30),
    member_id varchar2(50),
    product_id number(30),
    productreview_uploadtime date,
    constraint productreview_pk primary key(productreview_id),
    constraint productreview_fk_1 foreign key(member_id) references member(member_id),
    constraint productreview_fk_2 foreign key(product_id) references product(product_id)
);

-- 구매리스트
CREATE TABLE BUYLIST(
    BUYLIST_ID NUMBER(30),
    BUYLIST_DATE DATE,
    buylist_totalprice number(30),
    MEMBER_ID VARCHAR2(30),
    CONSTRAINT BUYLIST_PK PRIMARY KEY(BUYLIST_ID),
    CONSTRAINT BUYLIST_FK_1 FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);

-- 구매
create table buy(
    buy_id number(30),
    buylist_id number(30),
    product_id number(30),
    buy_cnt number(30),
    buy_totalprice number(30),
    CONSTRAINT BUY_PK PRIMARY KEY(BUY_ID),
    CONSTRAINT BUY_FK_1 FOREIGN KEY(BUYLIST_ID) REFERENCES BUYLIST(BUYLIST_ID),
    CONSTRAINT BUY_FK_2 FOREIGN KEY(product_id) REFERENCES product(product_id)
);

-- 장바구니
CREATE TABLE BUYCARTLIST(
    BUYCARTLIST_ID NUMBER(30),
    BUYCARTLIST_CNT NUMBER(30),
    MEMBER_ID VARCHAR2(30),
    product_id NUMBER(30),
    CONSTRAINT BUYCARTLIST_PK PRIMARY KEY(BUYCARTLIST_ID),
    CONSTRAINT BUYCARTLIST_FK_1 FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
    CONSTRAINT BUYCARTLIST_FK_2 FOREIGN KEY(product_id) REFERENCES product(product_id)
);

create sequence findhospital_id_seq
start with 10000
maxvalue 100000
cycle;
   
create sequence animal_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence boardcomment_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence communityboard_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence findboard_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence lostboard_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence questionboard_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence questionboard_group_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence raise_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence shop_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence product_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence productreview_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence buy_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence BUYLIST_ID_seq
start with 10000
maxvalue 100000
cycle;

create sequence BUYCARTLIST_ID_seq
start with 10000
maxvalue 100000
cycle;


