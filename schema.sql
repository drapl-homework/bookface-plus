create database bookfaceplus;
create user 'bookfaceplus'@'localhost' IDENTIFIED BY 'bookfaceplus';
grant ALL ON bookfaceplus.* TO 'bookfaceplus'@'localhost';
use bookfaceplus;

drop table if exists message;
drop table if exists friend;
drop table if exists account;
drop view if exists friend_info; 

create table if not exists `account` (
	username char(32) primary key,
	nickname char(32) not null,
	password char(32) not null,
	sex enum("男", "女"),
	email char(50) not null,
	birthday date not null
) default charset=utf8;
insert into `account` values ('test', "甲", 'test', "男", 'test@pku.edu.cn', '1992-3-5');
insert into `account` values ('test2', "乙", 'test2', "女", 'test2@pku.edu.cn', '1992-4-5');
insert into `account` values ('test3', "丙", 'test3', "男", 'test3@pku.edu.cn', '1992-5-5');

-- create table for messages
create table if not exists `message` (
	message_id integer not null primary key auto_increment,
	username char(32),
	FOREIGN KEY(username) REFERENCES account(username), 
	time datetime not null DEFAULT CURRENT_TIMESTAMP,
	content char(255) not null
) default charset=utf8;;
insert into `message`(username, content) values ('test', '欢迎使用Bookface+.');
insert into `message`(username, content) values ('test2', '欢迎使用Bookface+2.');

-- create table for friends
create table if not exists `friend` (
	username_1 char(32) not null,
	username_2 char(32) not null,
	FOREIGN KEY(username_1) REFERENCES account(username),
	FOREIGN KEY(username_2) REFERENCES account(username),
	primary key (username_1, username_2)
) default charset=utf8;
insert into friend values('test', 'test2');
insert into friend values('test', 'test3');
insert into friend values('test3', 'test2');

create view friend_info as
	select username_1 as username, username_2 as friend, 
	nickname, sex, email, birthday 
	from friend left join account on username_2 = account.username;

-- create table for comments
create table if not exists `comment` (
	comment_id int not null auto_increment primary key,
	username char(32) not null,
	message_id int not null,
	time datetime not null DEFAULT CURRENT_TIMESTAMP,
	content char(255) not null,
	FOREIGN KEY(username) REFERENCES account(username),
	FOREIGN KEY(message_id) REFERENCES message(message_id)
);
insert into `comment`(username, message_id, content) values ('test2', '1', '回复测试。');

create table if not exists `group` (
    group_id integer not null auto_increment primary key,
    group_name char(32) not null
) default charset=utf8;;

create table if not exists `group_member` (
	group_id integer not null,
	username char(32) not null, 
	FOREIGN KEY(group_id) REFERENCES `group`(group_id),
	FOREIGN KEY(username) REFERENCES account(username),
	primary key (group_id, username)
) default charset=utf8;
insert into `group` values('1', '数据库概论');
insert into `group_member` values('1', 'test');
insert into `group_member` values('1', 'test2');
