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
	userId int(11) PRIMARY KEY AUTO_INCREMENT,
	email varchar(30) NOT NULL,
	name varchar(20) NOT NULL,
	password varchar(20) NOT NULL,
	phone varchar(11) NOT NULL,
	type varchar(10) DEFAULT '',
	typeName varchar(20) DEFAULT '',
	typeNum varchar(100) DEFAULT '',
	typeImage varchar(1000) DEFAULT '',
	typeCer varchar(1) DEFAULT 'N',
	role varchar(10) DEFAULT '',
	createDate timestamp DEFAULT CURRENT_TIMESTAMP,
	profile varchar(1000) DEFAULT '',
	UNIQUE KEY email_UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

관리자 (최초생성해주세요)
insert INTO user(email, name, password, phone, role) VALUES ('admin@nate.com', '관리자', '1234','00000000','관리자');

```
```sql
CREATE TABLE room(
	roomId int PRIMARY KEY AUTO_INCREMENT,
	roomType varchar(20) NOT NULL,
	addr varchar(200) NOT NULL,
	detailAddr varchar(100) NOT NULL,
	dealType varchar(10) NOT NULL,
	yearRent int default 0,
	deposit int default 0,
	monthRent int default 0,
	dealRent int default 0,
	areaP double NOT NULL,
	areaM double NOT NULL,
	floor int NOT NULL,
	moveDay varchar(10) NOT NULL,
	mCost int default 0,
	parking varchar(1) NOT NULL,
	elevator varchar(1) NOT NULL,
	lof varchar(1) NOT NULL,
	title varchar(50) NOT NULL,
	content varchar(200) NOT NULL,
	createDate timestamp NOT NULL,
	hostId int NOT NULL,
	agentId int,
	lat double NOT NULL default 0,
	lng double NOT NULL default 0,
	FOREIGN KEY (hostId) REFERENCES user (userId),
	FOREIGN KEY (agentId) REFERENCES user (userId)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert INTO room VALUES (1, '투룸', '경기도 시흥시 정왕동','402호','월세',0, 500, 40, 0, 20, 64.7, 4, '즉시입주', 7,
'P','P','P','오늘준공난!평수깡패투룸!!입니댜^^','**신축! 풀옵션은 이제 기본! 이 방의 첫입주 첫주인이 되어주세욥!!', now(), 2, 1, 37.27943075229118, 127.01763998406159);
insert INTO room VALUES (2, '원룸', '부산시 남구 대연동','303호','전세',18000, 0, 0, 0, 30, 77.5, 6, '날짜협의', 10,
'P','P','P','오늘준공난!평수깡패투룸!!입니댜^^','**신축! 풀옵션은 이제 기본! 이 방의 첫입주 첫주인이 되어주세욥!!', now(), 3, 1, 37.55915668706214, 126.92536526611102);
insert INTO room VALUES (3, '원룸', '부산시 남구 대연동','303호','월세',0, 300, 50, 0, 30, 77.5, 6, '날짜협의', 10,
'P','P','P','오늘준공난!평수깡패투룸!!입니댜^^','**신축! 풀옵션은 이제 기본! 이 방의 첫입주 첫주인이 되어주세욥!!', now(), 3, 1, 37.55915668706214, 126.92536526611102);
```
```sql
CREATE TABLE room_pic (
	roomId int(11) NOT NULL,
	picId int(11) NOT NULL,
	picName varchar(200) NOT NULL,
	createDate timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(roomId, picId)   
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```
```sql
CREATE TABLE options (
	optionId varchar(5) PRIMARY KEY,
	optionName varchar(20) not null,
	optionType int not null 
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

insert INTO options VALUES ('op1', '에어컨.png', 1);
insert INTO options VALUES ('op2', '세탁기.png', 1);
insert INTO options VALUES ('op3', '침대.png', 1);
insert INTO options VALUES ('op4', '책상.png', 1);
insert INTO options VALUES ('op5', '옷장.png', 1);
insert INTO options VALUES ('op6', 'TV.png', 1);
insert INTO options VALUES ('op7', '신발장.png', 1);
insert INTO options VALUES ('op8', '냉장고.png', 1);
insert INTO options VALUES ('op9', '가스레인지.png', 1);
insert INTO options VALUES ('op10', '인덕션.png', 1);
insert INTO options VALUES ('op11', '전자레인지.png', 1);
insert INTO options VALUES ('op12', '전자도어락.png', 1);
insert INTO options VALUES ('op13', '비데.png', 1);
insert INTO options VALUES ('op14', '비디오폰.png', 2);
insert INTO options VALUES ('op15', '공동현관.png', 2);
insert INTO options VALUES ('op16', '경비원.png', 2);
insert INTO options VALUES ('op17', 'CCTV.png', 2);
insert INTO options VALUES ('op18', '방범창.png', 2);
insert INTO options VALUES ('op19', '인터폰.png', 2);
```
```sql
CREATE TABLE room_option(
	roomId int,
	optionId varchar(5),
	PRIMARY KEY(roomId, optionId)    
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

insert INTO room_option VALUES (1,'op1');
```
```sql
CREATE TABLE floor (
	floorNum int PRIMARY KEY,
	floorName varchar(10) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

insert INTO floor VALUES (1, '1층');
insert INTO floor VALUES (2, '2층');
insert INTO floor VALUES (3, '3층');
insert INTO floor VALUES (4, '4층');
insert INTO floor VALUES (5, '5층');
insert INTO floor VALUES (6, '6층');
insert INTO floor VALUES (7, '7층');
```
-- 층수 30층까지 추가함.
```sql
CREATE TABLE post_deal (
	postId int auto_increment PRIMARY KEY,
	roomId int NOT NULL,
	hostId int NOT NULL,
	agentId int,
	title varchar(40) NOT NULL default '매물 승인 요청합니다.',
	addr varchar(200),
	confirmYN varchar(1) NOT NULL default 'N',
	confirmDate datetime,
	createDate datetime DEFAULT CURRENT_TIMESTAMP,
	foreign key (roomId) references room (roomId),
	foreign key (hostId) references user (userId),
	foreign key (agentId) references user (userId) on delete set null
) engine=InnoDB default charset=utf8;
```
```sql
CREATE TABLE post_auth (
	postId int AUTO_INCREMENT PRIMARY KEY,
	title varchar(40) NOT NULL default '공인중개사 인증 요청합니다.',
	agentId int default 0,
	confirmYN varchar(1) NOT NULL default 'N',
	createDate timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	foreign key (agentId) references user (userId) on delete set null    
) engine=InnoDB default charset=utf8;
```
```sql
CREATE TABLE like_room (
	likeId int AUTO_INCREMENT PRIMARY KEY,
	userId int NOT NULL,
	roomId int NOT NULL,
	createDate timestamp DEFAULT CURRENT_TIMESTAMP,
	foreign key (userId) references user(userId) on delete cascade,
	foreign key (roomId) references room (roomId) on delete cascade 
) engine=InnoDB default charset=utf8;
```
```sql
CREATE TABLE today_recode (
	recodeId int(11) PRIMARY KEY AUTO_INCREMENT,
	roomId int(11) NOT NULL,
	userId int(11) NOT NULL,
	createDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (roomId) REFERENCES room (roomId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (userId) REFERENCES user (userId) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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