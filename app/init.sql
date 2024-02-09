CREATE TABLE info
(
	username VARCHAR(200), 
	password VARCHAR(500), 
	name VARCHAR(100), 
	prof INT, 
	street VARCHAR(100), 
	city VARCHAR(50), 
	phone VARCHAR(32), 
	PRIMARY KEY(username)
);

ALTER TABLE info ADD time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE plans
(
	name VARCHAR(100),
	exercise VARCHAR(100),
	reps INT,
	sets INT,
	PRIMARY KEY(name)
);

CREATE TABLE receps
(
	username VARCHAR(200), 
	PRIMARY KEY(username), 
	FOREIGN KEY(username) references info(username)
);

CREATE TABLE trainors
(
	username VARCHAR(200), 
	PRIMARY KEY(username), 
	FOREIGN KEY(username) references info(username)
);

CREATE TABLE members
(
	username VARCHAR(200), 
	plan VARCHAR(100), 
	trainor VARCHAR(200), 
	PRIMARY KEY(username), 
	FOREIGN KEY(username) references info(username), 
	FOREIGN KEY(plan) references plans(name), 
	FOREIGN KEY(trainor) references trainors(username)
);

CREATE TABLE progress
(
	username VARCHAR(200), 
	date DATE, daily_result VARCHAR(200), 
	time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY(username, date), 
	FOREIGN KEY(username) references members(username)
);

CREATE TABLE equip
(
	name VARCHAR(100),
	count INT,
	PRIMARY KEY(name)
);

INSERT INTO info(username, password, name, prof, street, city, phone) 
VALUES('vitali14', '$5$rounds=535000$kDP/QGFMteB2qkBi$x3yBvp/n6Z7/rWDTC3A1QuuE7JXw0GmcqKE3GyTqgj3', 
'Vitali Klimantovich', 1, 'Some avenue 1', 'Chicago', 375258121178);