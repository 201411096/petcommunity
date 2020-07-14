-- 테이블 생성
create table user(
    user_id varchar2(50),
    user_password varchar2(50),
    user_name varchar2(50),
    user_address varchar2(200),
    user_tel varchar2(50),
    user_email varchar2(50),
    user_birthday varchar2(50),
    user_nickname varchar2(50),
    constraint user_pk primary key(user_id)
);
create table animal(
    animal_id number(20),
    animal_name varchar2(50),
    animal_birthday varchar2(50),
    animal_gender varchar2(50),
    animal_feature varchar2(1024),
    constraint dog_pk PRIMARY KEY(dog_id)
);
create table lostboard(
    lostboard_id number(20),
    lostboard_title varchar2(50),
    lostboard_contents varchar2(2048),
    lostboard_location varchar2(1024),
    lostboard_x varchar2(50),
    lostboard_y varchar2(50),
    lostboard_uploadtime date,
    user_id varchar2(50),
    animal_id varchar2(50),
    
);
-- 테이블 삭제
drop table member;
drop table animal;
drop table lostboard;