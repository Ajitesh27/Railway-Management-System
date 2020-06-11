create database Project;
use Project;
CREATE TABLE `Account` (
  `Username` varchar(15) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Email_Id` varchar(35) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Username`)
);
INSERT INTO `Account` VALUES ('ajitesh','eba094d4d15bc478cdc9','ajitesh@pes.edu','Old airport road,bangalore'),('anantdadu','proxyman','dadu@cmu.ac.in','New York'),('atishay','qwerty','Atishay.jain.cse14@gnail.com','Rangmahal Mall, Panna'),('divyam310','goyal1002','divyam.goyal@gmail.com','Kota, Rajasthan'),('goku446','dejavu','goku@gmail.com','Kota, Rajasthan'),('prateek1996','ronaldoisgreat','prateek@gmail.com','New Delhi'),('user101','eba094d4d15bc478cdc9','atishay.jain.cse14@iitbhu.ac.in','Madhya Pradesh');
CREATE TABLE `Contact` (
  `Username` varchar(15) NOT NULL DEFAULT '',
  `Phone_No` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Username`,`Phone_No`),
  CONSTRAINT `Contact_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE
);
INSERT INTO `Contact` VALUES ('anantdadu','8899887766'),('anantdadu','9876543210'),('atishay','7071475390'),('atishay','8009224040'),('ajitesh','7411452250'),('ajitesh','9650367698'),('ajitesh','9968254144'),('divyam310','8989786765'),('goku446','9232453425'),('goku446','9989786756'),('prateek1996','9898342565'),('user101','7071475390');
SELECT * FROM Contact;
DROP TABLE Passenger;
CREATE TABLE `Passenger` (
  `Passenger_Id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Phone_No` char(10) DEFAULT NULL,
  `Ticket_No` int(10) NOT NULL,
  `Age` int(11) NOT NULL,
  `Class` varchar(20) NOT NULL,
  PRIMARY KEY (`Passenger_Id`),
  KEY `Ticket_No` (`Ticket_No`),
  CONSTRAINT `Passenger_ibfk_1` FOREIGN KEY (`Ticket_No`) REFERENCES `Ticket` (`Ticket_No`) ON DELETE CASCADE
);
CREATE TABLE `Station` (
  `Station_Code` char(5) NOT NULL DEFAULT '',
  `Station_Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Station_Code`)
);
INSERT INTO `Station` VALUES ('ALD','ALLAHABAD JUNCTION'),('CNB','KANPUR CENTRAL'),('GYN','GYANPUR ROAD'),('GZB','GHAZIABAD JUNCTION'),('BLR','BANGALORE'),('NDLS','NEW DELHI');
CREATE TABLE `Train` (
  `Train_No` int(6) NOT NULL DEFAULT '0',
  `Name` varchar(25) NOT NULL,
  `Seat_Sleeper` int(4) NOT NULL,
  `Seat_First_Class_AC` int(4) NOT NULL,
  `Seat_Second_Class_AC` int(4) NOT NULL,
  `Seat_Third_Class_AC` int(4) NOT NULL,
  `Wifi` char(1) NOT NULL,
  `Food` char(1) NOT NULL,
  `Run_On_Sunday` char(1) NOT NULL,
  `Run_On_Monday` char(1) NOT NULL,
  `Run_On_Tuesday` char(1) NOT NULL,
  `Run_On_Wednesday` char(1) NOT NULL,
  `Run_On_Thursday` char(1) NOT NULL,
  `Run_On_Friday` char(1) NOT NULL,
  `Run_On_Saturday` char(1) NOT NULL,
  PRIMARY KEY (`Train_No`)
);
INSERT INTO `Train` VALUES (12559,'SHIV GANGA EXP',479,47,96,192,'N','Y','Y','Y','Y','Y','Y','Y','Y'),(12560,'SHIV GANGA EXP',480,43,96,192,'N','Y','Y','Y','Y','Y','Y','Y','Y'),(12581,'BLR NDLS S F EX',432,48,80,144,'N','N','Y','Y','Y','Y','Y','Y','Y'),(12582,'BLR NDLS S F EX',432,48,80,144,'N','N','Y','Y','Y','Y','Y','Y','Y');
CREATE TABLE `Ticket` (
  `Ticket_No` int(10) NOT NULL AUTO_INCREMENT,
  `Train_No` int(6) NOT NULL,
  `Date_of_Journey` date NOT NULL,
  `Username` varchar(15) NOT NULL,
  PRIMARY KEY (`Ticket_No`),
  KEY `Username` (`Username`),
  KEY `Train_No` (`Train_No`),
  CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`) ON DELETE CASCADE,
  CONSTRAINT `Ticket_ibfk_2` FOREIGN KEY (`Train_No`) REFERENCES `Train` (`Train_No`) ON UPDATE CASCADE
);


CREATE TABLE `Stoppage` (
  `Train_No` int(6) NOT NULL DEFAULT '0',
  `Station_Code` char(5) NOT NULL DEFAULT '',
  `Arrival_Time` time DEFAULT NULL,
  `Departure_Time` time DEFAULT NULL,
  PRIMARY KEY (`Train_No`,`Station_Code`),
  KEY `Station_Code` (`Station_Code`),
  CONSTRAINT `Stoppage_ibfk_1` FOREIGN KEY (`Train_No`) REFERENCES `Train` (`Train_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Stoppage_ibfk_2` FOREIGN KEY (`Station_Code`) REFERENCES `Station` (`Station_Code`) ON DELETE CASCADE ON UPDATE CASCADE
);

 alter table Stoppage ADD CHECK (EXTRACT(HOUR FROM Arrival_Time) <24 AND EXTRACT(HOUR FROM Departure_Time) <24);
INSERT INTO `Stoppage` VALUES (12559,'ALD','22:05:00','22:30:00'),(12559,'CNB','01:30:00','01:38:00'),(12559,'BLR','19:20:00','19:30:00'),(12559,'NDLS','08:10:00',NULL),(12560,'ALD','03:45:00','04:10:00'),(12560,'CNB','01:00:00','01:05:00'),(12560,'BLR','07:00:00',NULL),(12560,'NDLS','18:35:00','18:55:00'),(12581,'ALD','01:20:00','01:45:00'),(12581,'CNB','04:15:00','04:20:00'),(12581,'GYN','23:31:00','23:33:00'),(12581,'GZB','11:30:00','11:32:00'),(12581,'BLR','22:20:00','22:30:00'),(12581,'NDLS','12:20:00',NULL),(12582,'ALD','07:45:00','08:15:00'),(12582,'CNB','04:55:00','05:00:00'),(12582,'GYN','09:21:00','09:23:00'),(12582,'GZB','23:03:00','23:05:00'),(12582,'BLR','11:20:00',NULL),(12582,'NDLS','22:15:00','22:25:00');
SELECT * FROM Stoppage;

INSERT INTO `Account` VALUES ('admin','admin@1234','ajitesh@pes.edu','Old airport road,bangalore');

select a.Train_No from Stoppage as a join Stoppage as b on a.Train_No = b.Train_No 
where a.Station_Code = "BLR" and b.Station_Code = "NDLS";
drop trigger cancellation;
INSERT INTO Passenger values ('1','admin','','F','233','1','20','first class ac');

delimiter //
create trigger cancellation 
 before delete on ticket 
 for each row  
BEGIN   
  set @trainno=old.train_no;    
  set @ticketno=old.ticket_no;       
  SET @class = (SELECT p.class 
               FROM PASSENGER p 
               WHERE p.ticket_no = @ticketno);
  if @class='first class ac' then    
    UPDATE Train set Seat_First_Class_AC = Seat_First_Class_AC+1 WHERE Train_No = @trainno ;   
  elseif @class='sleeper' then        
    UPDATE Train set Seat_Sleeper = Seat_Sleeper+1 WHERE Train_No = @trainno ;   
  elseif @class='second class ac' then       
    UPDATE Train set Seat_Second_Class_AC = Seat_Second_Class_AC+1 WHERE Train_No = @trainno ;    
  elseif @class='third class ac' then        
    UPDATE Train set Third_Class_AC = Seat_Third_Class_AC+1 WHERE Train_No = @trainno ;      
  end if; 
END//
delimiter ;

delete from ticket where ticket_no=1;

/* Find total number of first class seats available on any train that reaches bangalore before 7pm on Monday .*/
create view a(Station_code,Train_no,Arrival_Time)as
SELECT Stoppage.Station_code,Train_no,Arrival_Time
from Station inner join Stoppage on station.Station_code=Stoppage.Station_code where station.Station_name='BANGALORE';

select * from a;

create view b(Station_code,Train_no,Arrival_Time)as
SELECT Station_code,Train_no,Arrival_Time
from a where EXTRACT(HOUR FROM Arrival_Time)<19;

select * from b;

create view c(Station_code,Train_no,Arrival_Time,First_Class_seats,Run_on_monday)as
SELECT Station_code,train.Train_no,Arrival_Time,Seat_First_Class_AC,Run_on_monday
from train inner join b on train.Train_No=b.Train_No where train.Run_On_Monday='Y' AND train.Seat_First_Class_AC >0;

select *from c;

SELECT SUM(First_class_seats)
FROM c;

/* Find the time at which last train  leaves New delhi station */

create view f(Departure_time)as
 SELECT Departure_time 
   FROM Stoppage 
   WHERE Station_Code IN (SELECT Station_code 
         FROM station 
         WHERE Station_Name='New Delhi') ;
select * from f;
select MAX(Departure_time) from f;

/* Find the phone number of the user whose email id is ajitesh@pes.edu */
Select Phone_no from Contact where username IN (Select Username from account where Email_id='ajitesh@pes.edu');

