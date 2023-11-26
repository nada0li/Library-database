CREATE schema pro ;

CREATE TABLE pro.Library
( Manager     VARCHAR(20) NOT NULL, 
Number_Of_Employees         INT ,
Number_Of_Floors            INT ,
Departments               VARCHAR(20),
CONSTRAINT Library_PK PRIMARY KEY (Manager)
);

CREATE TABLE pro.Employee
( ID INT(6)  NOT NULL, 
EName        VARCHAR(20),
Gender       VARCHAR(6),
Salary       INT ,
HouseNo      INT ,
Neighborhood VARCHAR(20), 
City         VARCHAR(20),
Street       VARCHAR(20),
PhoneNo      INT(10) ,
Date_Of_Birth  varchar(20),
Manager     VARCHAR(20),
CONSTRAINT Instructor_PK PRIMARY KEY (ID),
CONSTRAINT Employee_FK1 FOREIGN KEY(Manager) REFERENCES Library(Manager) ON update cascade
);

CREATE TABLE pro.Book
( Book_No             INT NOT NULL,
Book_Name             VARCHAR(20),
Date_Of_Publication    varchar(20),
Number_Of_Pages        INT,
Manager              VARCHAR(20),
Author_Name           VARCHAR(20),
Book_Classification   VARCHAR(20),
CONSTRAINT Book_PK PRIMARY KEY (Book_No),
CONSTRAINT Book_FK1 FOREIGN KEY(Manager) REFERENCES Library(Manager)  ON update cascade
);

CREATE TABLE pro.Customer
(ID                  INT(6)  NOT NULL,
Phone_Number          INT(10) ,   
Customer_Name         VARCHAR(20),
Date_Of_Birth          varchar(20),
Manager              VARCHAR(20),
CONSTRAINT Customer_PK PRIMARY KEY (ID),
CONSTRAINT Customer_FK1 FOREIGN KEY(Manager) REFERENCES Library(Manager)  ON update cascade
);

CREATE TABLE pro.Books
( Book_No             INT NOT NULL,
ID         INT(6)  NOT NULL,
CONSTRAINT Books_PK PRIMARY KEY (Book_No , ID),
CONSTRAINT Books_FK1 FOREIGN KEY(Book_No) REFERENCES Book(Book_No) ON update cascade  ,
CONSTRAINT Books_FK2 FOREIGN KEY(ID) REFERENCES Customer(ID)  ON update cascade
);

CREATE TABLE pro.Meeting_room
(Room_Number     INT NOT NULL,
Entry_Time       varchar(5),
Rent            INT,
Manager         VARCHAR(20),
CONSTRAINT Meeting_room_PK PRIMARY KEY (Room_Number),
CONSTRAINT Meeting_room_FK1 FOREIGN KEY(Manager) REFERENCES Library(Manager) ON update cascade
);

CREATE TABLE pro.Recorded_book 
( Book_No        INT NOT NULL,
Recording_No     INT NOT NULL,
CONSTRAINT Recorded_book_PK PRIMARY KEY (Recording_No,Book_No),
CONSTRAINT Recorded_book_FK1 FOREIGN KEY(Book_No) REFERENCES Book(Book_No) ON update cascade
);

CREATE TABLE pro.Multivalue
( Room_Number       INT NOT NULL,
 Person             INT NOT NULL,
CONSTRAINT Multivalue_PK PRIMARY KEY (Room_Number , Person),
CONSTRAINT Multivalue_FK1 FOREIGN KEY(Room_Number) REFERENCES Meeting_room(Room_Number) ON update cascade
);

CREATE TABLE pro.Gender_of_recording
(Recording_No     INT NOT NULL,
 Gender          varchar(6) ,
 Book_No      INT NOT NULL,
CONSTRAINT Gender_of_recording_PK PRIMARY KEY (Recording_No , Gender , Book_No ),
constraint Gender_of_recording_FK1 foreign key (Recording_No) references Recorded_book(Recording_No) ON update cascade,
CONSTRAINT Gender_of_recording_FK2 FOREIGN KEY(Book_No) REFERENCES Book(Book_No) ON update cascade
);

CREATE TABLE pro.Recording_speed 
( Recording_No      INT NOT NULL,
 Speed              INT NOT NULL,
 Book_No       INT NOT NULL,
CONSTRAINT Recording_speed_PK PRIMARY KEY (Recording_No , Speed , Book_No ),
CONSTRAINT Recording_speed_FK1 FOREIGN KEY(Recording_No) REFERENCES Recorded_book(Recording_No) ON update cascade,
CONSTRAINT Recording_speed_FK2 FOREIGN KEY(Book_No) REFERENCES Book(Book_No) ON update cascade
);

CREATE TABLE pro.Recording_language  
( Recording_No      INT NOT NULL,
RLanguage       varchar(20),
Book_No        INT NOT NULL,
CONSTRAINT Recording_language_PK PRIMARY KEY (Recording_No , RLanguage , Book_No ),
CONSTRAINT Recording_language_FK1 FOREIGN KEY(Recording_No) REFERENCES Recorded_book(Recording_No) ON update cascade,
CONSTRAINT Recording_language_FK2 FOREIGN KEY(Book_No) REFERENCES Book(Book_No) ON update cascade
);

insert INTO pro.library 
values ( 'Ahmed' , 4 , 6 , 'Books' );

insert INTO pro.library 
values ( 'shahad' , 8 , 6 , 'Meeting room' );

insert INTO pro.library 
values ( 'Elaf' , 7 , 9 , 'Meeting room' );

insert INTO pro.library 
values ( 'Rana' , 4 , 8 , 'Books' );

insert INTO pro.library 
values ( 'afnan' , 8 , 6 , 'Meeting room' );

insert INTO pro.Employee 
values ( 102938 , 'Maha' , 'female' , 5000 , 1 , 'Alolaya' , 'Riyadh' , 'Alsalaten' , 0503525355 , '05-07-1422' , 'afnan' );

insert INTO pro.Employee 
values ( 938475 , 'Sara' , 'female' , 7000 , 7 , 'Al-Malqa' , 'Riyadh' , 'Takhassusi road' , 055557634 , '11-07-1415' , 'Rana');

insert INTO pro.Employee 
values ( 198765 , 'Ali' , 'male' , 3500 , 3 , 'jasmine' , 'Riyadh' , 'Khurais' , 0507294677 , '12-01-1416' , 'Elaf' );

insert INTO pro.Employee 
values ( 234567 , 'Rakan' , 'male' , 5000 , 9 , 'Aladl' , 'Makkah' , 'fourth' , 0523934347 , '03-10-1422' , 'shahad' );

insert INTO pro.Employee 
values ( 837466 , 'norah' , 'female' , 8000 , 2 , 'Ghulail' , 'Makkah' , 'Alsalaten' , 0503947002 , '21-12-1454' , 'Ahmed' );

insert INTO pro.Customer
values ( 336454 , 0509898798 , 'Youssef' , '07-09-1421' , 'Ahmed' );

insert INTO pro.Customer
values ( 867994 , 0502236463 , 'Shahad' , '03-04-1415' , 'Rana' );

insert INTO pro.Customer
values ( 948588 , 0532455658 , 'Bayan' , '6-6-1416' , 'Elaf' );

insert INTO pro.Customer
values ( 949904 , 0584578990 , 'Samer' , '1-09-1410' , 'shahad' );

insert INTO pro.Customer
values ( 109092 , 0599598744, 'loly' , '50-12-1422' , 'afnan' );

insert INTO pro.Book 
values ( 8374 , 'Leaving Time' , ' April 3-2018' , 85557 ,'afnan' , 'Richard Powers' , 'developing skills' );

insert INTO pro.Book 
values ( 9586 , 'Three' , 'November 10, 2020' , 98883 , 'Ahmed', 'Joanne Rowling' , 'developing skills' );

insert INTO pro.Book 
values ( 29477 , 'One for the Money' , 'June 1969' , 99254 ,'Rana' , 'Joyce Carol Oates' , 'developing skills' );

insert INTO pro.Book 
values ( 20477 , '1st to Die' , ' April-9-2020' , 849 ,'Shahad' , 'Agatha Christie' , 'developing skills' );

insert INTO pro.Book 
values ( 99833 , 'The Ickabog' , 'June 1966' , 86994 ,'Elaf' , 'Lord Byron' , 'developing skills' );

insert INTO pro.Books
values ( 20477 , 949904);

insert INTO pro.Books
values (99833 ,948588 );

insert INTO pro.Books
values ( 29477 ,867994 );

insert INTO pro.Books
values ( 8374 ,336454 );

insert INTO pro.Books
values ( 9586  , 109092 );

insert into pro.Meeting_room 
values ( 5 , '04:40' , 500 , 'Rana' );

insert into pro.Meeting_room 
values ( 4 , '05:50' , 500 , 'Elaf' );

insert into pro.Meeting_room 
values ( 2 , '11:40' , 500 , 'Afnan' );

insert into pro.Meeting_room 
values ( 3 , '12:00' , 500 , 'Shahad' );

insert into pro.Meeting_room 
values ( 1 , '01:30' , 350 , 'Ahmed' );

insert into pro.recorded_book 
values ( 99833, 5);

insert into pro.recorded_book 
values ( 29477 , 4 );

insert into pro.recorded_book 
values (20477 , 3 );

insert into pro.recorded_book 
values ( 9586 , 1 );

insert into pro.recorded_book 
values (8374 , 2 );

insert into pro.multivalue
values ( 1 , 7 );

insert into pro.multivalue
values ( 2 , 3 );

insert into pro.multivalue
values ( 3 , 5 );

insert into pro.multivalue
values ( 4 , 6 );

insert into pro.multivalue
values ( 5 , 6 );

insert into pro.gender_of_recording
values (  5 ,'female' , 99833 );

insert into pro.gender_of_recording
values (  4 , 'male', 29477 );

insert into pro.gender_of_recording
values (  3 , 'female' , 20477 );

insert into pro.gender_of_recording
values (  1 , 'male', 9586 );

insert into pro.gender_of_recording
values (  2 , 'female' , 8374  );

insert into pro.recording_speed
values (  5 , 1.5 , 99833 );

insert into pro.recording_speed
values (  4 , 2.0 , 29477 );

insert into pro.recording_speed
values (  3 ,1.0 , 20477 );

insert into pro.recording_speed
values (  1 ,1.5 , 9586 );

insert into pro.recording_speed
values (  2 ,1.0 , 8374  );

insert into pro.recording_language
values (  5 , 'Russian' , 99833 );

insert into pro.recording_language
values (  4 ,  'Spanish' , 29477 );

insert into pro.recording_language
values (  3 , 'Turkish' , 20477 );

insert into pro.recording_language
values (  1 , 'Korean' , 9586 );

insert into pro.recording_language
values (  2 , 'Arabic' , 8374  );

UPDATE employee
SET Salary = Salary * 1.1;

DELETE FROM Gender_of_recording
WHERE Gender = 'male';

SELECT *
FROM Library
WHERE Manager = (SELECT Manager
				 FROM Employee
                 WHERE ID = 938475);
	
SELECT l.Manager, Departments, ID, EName, Gender
FROM Library l, Employee e 
WHERE l.Manager = e.Manager
ORDER BY ID ASC;

SELECT*
FROM library
ORDER BY Number_Of_Employees  desc ; 

SELECT Gender, COUNT(ID) AS count, SUM(salary) AS sum
FROM employee
GROUP BY Gender 
ORDER BY Gender;

SELECT Room_Number , Entry_Time , Rent   
FROM meeting_room
WHERE rent> (SELECT AVG(rent) FROM meeting_room);

SELECT *
FROM book
GROUP BY Number_Of_Pages 
HAVING Number_Of_Pages>90000;

SELECT *
FROM book
WHERE Book_No IN(SELECT Book_No
	  FROM recording_language
      WHERE RLanguage='Arabic');
      
SELECT r.Book_No, s.Speed 
FROM recorded_book r, recording_speed s
WHERE r.Book_No=s.Book_No;