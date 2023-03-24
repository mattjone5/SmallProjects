CREATE DATABASE IF NOT EXISTS librarySystem;
USE librarySystem;

CREATE TABLE IF NOT EXISTS users(
userID INT NOT NULL AUTO_INCREMENT,
username TEXT NOT NULL,
password TEXT NOT NULL,
birthday DATE NOT NULL,
email TEXT NOT NULL,
phoneNum TEXT NOT NULL,
CONSTRAINT PK_users_userID PRIMARY KEY (userID));

CREATE TABLE IF NOT EXISTS Customer(
customerID INT NOT NULL AUTO_INCREMENT,
userID INT NOT NULL,
CONSTRAINT PK_Customer_customerID PRIMARY KEY (customerID),
CONSTRAINT FK_Customer_userID FOREIGN KEY (userID) REFERENCES users (userID));

CREATE TABLE IF NOT EXISTS Admin(
adminID INT NOT NULL AUTO_INCREMENT,
userID INT NOT NULL,
CONSTRAINT PK_Admin_adminID PRIMARY KEY (adminID),
CONSTRAINT FK_Admin_userID FOREIGN KEY (userID) REFERENCES users (userID));

CREATE TABLE IF NOT EXISTS Fees(
feeID INT NOT NULL AUTO_INCREMENT,
userID INT NOT NULL,
amount INT NOT NULL,
CONSTRAINT PK_Fees_feeID PRIMARY KEY (feeID),
CONSTRAINT FK_Fees_userID FOREIGN KEY (userID) REFERENCES users (userID));

CREATE TABLE IF NOT EXISTS Book(
bookID INT NOT NULL AUTO_INCREMENT,
ISBN TEXT NOT NULL,
title TEXT NOT NULL,
CONSTRAINT PK_Book_bookID PRIMARY KEY (bookID));

CREATE TABLE IF NOT EXISTS CheckInCheckOut(
transID INT NOT NULL,
bookID INT NOT NULL,
userID INT NOT NULL,
eventType TEXT NOT NULL,
dueDate DATE NOT NULL,
CONSTRAINT PK_CheckInCheckOut_transID PRIMARY KEY (transID),
CONSTRAINT FK_CheckInCheckOut_bookID FOREIGN KEY (bookID) REFERENCES Book (bookID),
CONSTRAINT FK_CheckInCheckOut_userID FOREIGN KEY (userID) REFERENCES users (userID));

CREATE TABLE IF NOT EXISTS Log(
entryID INT NOT NULL,
userID INT,
transID INT,
bookID INT,
feeID INT,
entryType TEXT NOT NULL,
descp TEXT NOT NULL,
CONSTRAINT PK_Log_entryID PRIMARY KEY (entryID),
CONSTRAINT FK_Log_userID FOREIGN KEY (userID) REFERENCES users (userID),
CONSTRAINT FK_Log_transID FOREIGN KEY (transID) REFERENCES CheckInCheckOut (transID),
CONSTRAINT FK_Log_bookID FOREIGN KEY (bookID) REFERENCES Book (bookID),
CONSTRAINT FK_Log_feeID FOREIGN KEY (feeID) REFERENCES Fees (feeID));