# 스프링 부트 프로젝트

## 다봥

### 1. 개발 환경
* Springboot
* MyBatis
* MySQL
* JSP
* Lombok

### 2. 요구사항(기능)
* 회원가입
* 로그인
* 공인중개사 자격증사진(업로드)
* 방등록
* 방찾기
* 방상세보기
* 방리스트 페이징
* 공인중개사 권한승인 
* 방주인 매물승인

### 3. 테이블
```sql
create user 'dabang'@'%' identified by 'bitc5600'; 
create database dabang;
grant all privileges on dabang.* to 'dabang'@'%' 
use dabang;
```
```sql
CREATE TABLE user (
	userId int(11) NOT NULL AUTO_INCREMENT,
	email varchar(30) NOT NULL,
	name varchar(20) NOT NULL,
	password varchar(20) NOT NULL,
	phone varchar(11) DEFAULT NULL,
	type varchar(10) DEFAULT NULL,
	typeName varchar(20) DEFAULT NULL,
	typeNum varchar(100) DEFAULT NULL,
	typeImage varchar(1000) DEFAULT NULL,
	role varchar(10) DEFAULT NULL,
	createDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	profile varchar(1000) DEFAULT NULL,
	PRIMARY KEY (userId),
	UNIQUE KEY email_UNIQUE (email)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

insert INTO user VALUES (1, 'ssar@nate.com', '쌀쌀', '1234','01011113333', '3', '공인자격증.jpg', 'not', now(),'내사진.jpg');
insert INTO user VALUES (2, 'cos@nate.com', '코스', '1234','01011113333', '2', null , 'not', now(),'내사진.jpg');
insert INTO user VALUES (3, 'kyj@nate.com', '세입자', '1234','01011113333', '1', null , 'not', now(),'내사진.jpg');
```
```sql
CREATE TABLE room (
	roomId int auto_increment primary key,
	roomType varchar(20) not null,
	addr varchar(200) not null,
	detailAddr varchar(100) not null,
	dealType varchar(10) not null,
	yearRent int NOT NULL default '0',
	deposit int NOT NULL default '0',
	monthRent int NOT NULL default '0',
	dealRent int not null,
	areaP double not null,
	areaM double not null,
	floor int not null,
	moveDay varchar(10) not null,
	mCost int NOT NULL default '0',
	parking varchar(2) not null,
	elevator varchar(2) not null,
	lof varchar(2) not null,
	title varchar(50) not null,
	content varchar(200) not null,
	createDate timestamp,
	hostId int default '0',
	agentId int default '0',
	lat double not null,
	lng double not null,
	foreign key (hostId) references user (userId) on delete set null,
	foreign key (agentId) references user (userId) on delete set null
) engine=InnoDB default charset=utf8;

insert INTO room VALUES (1, '투룸', '경기도 시흥시 정왕동','402호','월세',0, 500, 40, 0, 20, 64.7, 4, '즉시입주', 7,
'P','P','P','오늘준공난!평수깡패투룸!!입니댜^^','**신축! 풀옵션은 이제 기본! 이 방의 첫입주 첫주인이 되어주세욥!!', now(), 2, 1, 37.27943075229118, 127.01763998406159);
insert INTO room VALUES (2, '원룸', '부산시 남구 대연동','303호','전세',18000, 0, 0, 0, 30, 77.5, 6, '날짜협의', 10,
'P','P','P','오늘준공난!평수깡패투룸!!입니댜^^','**신축! 풀옵션은 이제 기본! 이 방의 첫입주 첫주인이 되어주세욥!!', now(), 3, 1, 37.55915668706214, 126.92536526611102);
insert INTO room VALUES (3, '원룸', '부산시 남구 대연동','303호','월세',0, 300, 50, 0, 30, 77.5, 6, '날짜협의', 10,
'P','P','P','오늘준공난!평수깡패투룸!!입니댜^^','**신축! 풀옵션은 이제 기본! 이 방의 첫입주 첫주인이 되어주세욥!!', now(), 3, 1, 37.55915668706214, 126.92536526611102);
```
```sql
CREATE TABLE room_pic (
	roomId int(11) DEFAULT NULL,
	picId int(11) DEFAULT NULL,
	picName varchar(200) NOT NULL,
	createDate datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```
```sql
CREATE TABLE options (
	optionId varchar(20) not null,
	optionName varchar(20) not null   
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

insert INTO options VALUES ('op1', '에어컨');
insert INTO options VALUES ('op2', '세탁기');
insert INTO options VALUES ('op3', '침대');
insert INTO options VALUES ('op4', '책상');
insert INTO options VALUES ('op5', '옷장');
insert INTO options VALUES ('op6', 'TV');
insert INTO options VALUES ('op7', '신발장');
insert INTO options VALUES ('op8', '냉장고');
insert INTO options VALUES ('op9', '가스레인지');
insert INTO options VALUES ('op10', '인덕션');
insert INTO options VALUES ('op11', '전자레인지');
insert INTO options VALUES ('op12', '전자도어락');
insert INTO options VALUES ('op13', '비데');
```
```sql
CREATE TABLE room_option (
	roomId int,
	optionId varchar(20) not null,
	primary key(roomId,optionId)
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

insert INTO room_option VALUES (1,'op1');
```
```sql
CREATE TABLE floor (
	floorNum int not null,
    floorName varchar(10) not null
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

insert INTO floor VALUES (1, '1층');
insert INTO floor VALUES (2, '2층');
insert INTO floor VALUES (3, '3층');
insert INTO floor VALUES (4, '4층');
insert INTO floor VALUES (5, '5층');
insert INTO floor VALUES (6, '6층');
insert INTO floor VALUES (7, '7층');
```
```sql
CREATE TABLE post_deal (
	postId int auto_increment primary key,
    roomId int default '0',
    agentId int default '0',
    title varchar(40) not null,
    hostId int default '0',
    confirmYN varchar(2) not null,
    createDate timestamp,
    foreign key (roomId) references room (roomId) on delete set null,
	foreign key (hostId) references user (userId) on delete set null,
    foreign key (agentId) references user (userId) on delete set null
) engine=InnoDB default charset=utf8;
```
```sql
CREATE TABLE post_auth (
	postId int auto_increment primary key,
    title varchar(40) not null,
    agentId int default '0',
    confirmYN varchar(2) not null,
    createDate timestamp,
    foreign key (agentId) references user (userId) on delete set null    
) engine=InnoDB default charset=utf8;
```
```sql
CREATE TABLE like_room (
	likeId int auto_increment primary key,
	userId int default '0',
    roomId int default '0',
    createDate timestamp,
    foreign key (userId) references user (userId) on delete set null,
	foreign key (roomId) references room (roomId) on delete set null  
) engine=InnoDB default charset=utf8;
```
```sql
select * from user;
select * from room;
select * from options;
select * from room_option;
select * from floor;
select * from post_deal;
select * from post_auth;
select * from like_room;-
select * from room_pic;
drop table like_room;
drop table user;
drop table room;
drop table options;
drop table room_option;
drop table room_pic;
drop table floor;
drop table post_deal;
drop table post_auth;
commit;
```












