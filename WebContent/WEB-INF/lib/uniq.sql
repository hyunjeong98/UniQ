CREATE TABLE if NOT EXISTS quser(
	id VARCHAR(128), 
	password VARCHAR(32),
	name VARCHAR(32),
	sex VARCHAR(32),
	univ VARCHAR(128),
	depart VARCHAR(128),
	point int,
	ticket int,
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	constraint quser_id_pk PRIMARY KEY (id)
	-- jsonstr varchar(1024)
);

CREATE TABLE if NOT EXISTS joinquest(
	uid VARCHAR(128),
	jno int unsigned,
	jointime date,
	constraint joinquest_uid_fk foreign key (uid) references quser (id),
	constraint joinquest_jno_fk foreign key (jno) references quest (qno)
	-- jsonstr varchar(1024)
);

CREATE TABLE if NOT EXISTS quest(
	qno int unsigned NOT NULL AUTO_INCREMENT,
	qid VARCHAR(128),
	title varchar(512) not null,
	qexplain varchar(4096),
	formlink varchar(4096),
	mchoice int unsigned not null,
	sanswer int unsigned not null,
	deadline date,
	target varchar(128),
	regist date,
	closingStatus int,
	leadTime varchar(128),
	constraint quest_qid_fk foreign key (qid) references quser (id),
	constraint quest_no_pk PRIMARY KEY (qno)
	-- jsonstr varchar(1024)
);

create table if not exists pointshop(
	pno int unsigned,
	item varchar(64),
	ea int not null,
	price int not null,
	constraint pointshop_id_pk primary key (pno)
	-- jsonstr varchar(1024)
);

create table if not exists notice(
	ano int unsigned auto_increment,
	atitle varchar(128),
	content varchar(4096),
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	constraint notice_ano_pk primary key (ano)
	-- jsonstr varchar(1024)
);