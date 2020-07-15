-- 테이블 생성
create table member(
    member_id varchar2(50),
    member_password varchar2(50),
    member_name varchar2(50),
    member_address varchar2(200),
    member_tel varchar2(50),
    member_email varchar2(50),
    member_birthday varchar2(50),
    member_nickname varchar2(50),
    constraint member_pk primary key(member_id)
);
create table animal(
    animal_id number(20),
    animal_name varchar2(50),
    animal_birthday varchar2(50),
    animal_gender varchar2(50),
    animal_feature varchar2(1024),
    constraint animal_pk PRIMARY KEY(animal_id)
);

create table raise(
    raise_id number(20),
    member_id varchar2(50),
    animal_id number(20),
    constraint raise_pk PRIMARY KEY(raise_id),
    constraint raise_fk_1 foreign key(member_id) references member(member_id),
    constraint raise_fk_2 foreign key(animal_id) references animal(animal_id)
);

create table lostboard(
    lostboard_id number(20),
    lostboard_title varchar2(50),
    lostboard_content varchar2(2048),
    lostboard_location varchar2(512),
    lostboard_x varchar2(50),
    lostboard_y varchar2(50),
    lostboard_status varchar2(50),
    lostboard_uploadtime date,
    lostboard_time date,
    member_id varchar2(50),
    animal_id number(20),
    constraint lostboard_pk PRIMARY KEY(lostboard_id),
    constraint lostboard_fk_1 FOREIGN KEY(member_id) references member(member_id),
    constraint lostboard_fk_2 FOREIGN KEY(animal_id) references animal(animal_id)
);

create table findboard(
    findboard_id number(20),
    findboard_title varchar2(50),
    findboard_content varchar2(2048),
    findboard_location varchar2(512),
    findboard_x varchar2(50),
    findboard_y varchar2(50),
    findboard_status varchar2(50),
    findboard_uploadtime date,
    findboard_tel varchar2(50),
    findboard_name varchar2(50),
    member_id varchar2(50),
    animal_id number(20),
    constraint findboard_pk PRIMARY KEY(findboard_id),
    constraint findboard_fk_1 FOREIGN KEY(member_id) references member(member_id)
);

create table shop(
    shop_id number(20),
    shop_name varchar2(50),
    shop_category varchar2(50),
    shop_productname varchar2(50),
    shop_productprice varchar2(50),
    shop_img varchar2(50),
    shop_link varchar2(500),
    constraint shop_pk primary key(shop_id)
);

create table questionboard(
    questionboard_id number(20),
    questionboard_gruop_id number(20),
    questionboard_location varchar2(512),
    questionboard_x varchar2(50),
    questionboard_y varchar2(50),
    questionboard_title varchar2(50),
    questionboard_content varchar2(2048),
    questionboard_uploadtime date,
    member_id varchar2(50),
    constraint questionboard_pk primary key(questionboard_id),
    constraint questionboard_fk_1 foreign key(member_id) references member(member_id)
);

create table communityboard(
    communityboard_id number(20),
    commuityboard_location varchar2(512),
    communityboard_x varchar2(50),
    communityboard_y varchar2(50),
    communityboard_title varchar2(50),
    communityboard_content varchar2(2048),
    communityboard_uploadtime date,
    member_id varchar2(20),
    constraint communityboard_pk primary key(communityboard_id),
    constraint communityboard_fk_1 foreign key(member_id) references member(member_id)    
);

create table boardcomment(
    boardcomment_id number(20),
    boardcomment_content varchar2(512),
    boardcomment_uploadtime date,
    member_id varchar2(20),
    communityboard_id number(20),
    constraint boardcomment_pk primary key(boardcomment_id),
    constraint boardcomment_fk_1 foreign key(member_id) references member(member_id),
    constraint boardcomment_fk_2 foreign key(communityboard_id) references communityboard(communityboard_id)
);

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

create sequence raise_id_seq
start with 10000
maxvalue 100000
cycle;

create sequence shop_id_seq
start with 10000
maxvalue 100000
cycle;