 
   create  table  Passenger 
(
	passid int primary key,
	passname varchar(20),
	passemail varchar(20),
	passdob date
);

create table Flight
(
	flightid int primary key,
	flightsource varchar(20),
	flightdest varchar(20),
	flightdate date,
	flightseat int(4),
	ticketcost float
);

create table Booking
(
	bookingid int primary key,
	flightid int,
	bookdate date,
	foreign key(flightid) references Flight(flightid)
);

create table Booking_details
(
	bookingid int,
	passid int,
	primary key(bookingid,passid),
	foreign key(bookingid) references Booking(bookingid),
	foreign key(passid) references Passenger(passid)
);





Insert into Passenger values(1,'Rajesh','raj@y.com','1980-12-01');
Insert into Passenger values(2,'hira','hira@y.com','1939-11-11');
Insert into Passenger values(3,'sita','sita@y.com','1988-02-06');
Insert into Passenger values(4,'mica','mica@y.com','1973-09-18');
Insert into Passenger values(5,'elizabeth','eliza@y.com','1976-05-09');
Insert into Passenger values(6,'kaushik','kaushik@y.com','1955-08-08');

Insert into Flight values(1,'kol','hyd','2012-12-01' ,100,2000.00);
Insert into Flight values(2,'chen','hyd','2012-12-02',100,3000.00);
Insert into Flight values(3,'pune','kol','2012-12-02',100,2500.00);
Insert into Flight values(4,'bangalore','pune','2012-12-03',100,2300.00);
Insert into Flight values(5,'hyd','bangalore','2012-12-05',100,2600.00);
Insert into Flight values(6,'pune','hyd','2012-12-03',100,2000.00);
Insert into Flight values(7,'pune','kol','2012-12-04',100,2900.00);
Insert into Flight values(8,'kol','hyd','2012-12-06',100,3500.00);

Insert into Booking values(1,1,'2012-12-01');
Insert into Booking values(2,3,'2012-12-02');
Insert into Booking values(3,4,'2012-12-03');
Insert into Booking values(4,5,'2012-12-04');
Insert into Booking values(5,4,'2012-12-02');
Insert into Booking values(6,1,'2012-12-02');
Insert into Booking values(7,3,'2012-12-02');

Insert into Booking_Details values(1,1);
Insert into Booking_Details values(1,2);
Insert into Booking_Details values(1,3);
Insert into Booking_Details values(2,4);
Insert into Booking_Details values(3,5);
Insert into Booking_Details values(3,6);
Insert into Booking_Details values(4,1);
Insert into Booking_Details values(5,2);
Insert into Booking_Details values(5,3);
Insert into Booking_Details values(5,4);
				



select * from flight;


 select passname from passenger where passname like "_e%";

select passname from passenger where passdob=
  (select max(passdob) max from passenger);

SELECT PASSNAME,PASSDOB,ROUND((DATEDIFF(NOW(),PASSDOB)/365),2) DATEDIFF FROM PASSENGER;  



 select passname from passenger where passname like "_e%";



 select passname from passenger where passdob=
  (select max(passdob) max from passenger);



  SELECT PASSNAME,PASSDOB,ROUND((DATEDIFF(NOW(),PASSDOB)/365),2) DATEDIFF FROM PASSENGER;



 
 SELECT COUNT(*) NO_OF_FLIGHTS FROM FLIGHT WHERE FLIGHTSOURCE="KOL";


 


 SELECT FLIGHTSOURCE FROM 
 (SELECT FLIGHTSOURCE,COUNT(*) C1 FROM FLIGHT GROUP BY  FLIGHTSOURCE)A INNER JOIN 
 (SELECT FLIGHTDEST,COUNT(*) C2 FROM FLIGHT GROUP BY FLIGHTDEST)B ON A.C1=B.C2 AND  
 A.FLIGHTSOURCE=B.FLIGHTDEST;

 




 SELECT FLIGHTSOURCE FROM FLIGHT
  NOT IN
  (SELECT FLIGHTDEST FROM FLIGHT);
 
 
 


 SELECT FLIGHTDATE FROM FLIGHT WHERE FLIGHTID=1 OR FLIGHTID=4;



 
 SELECT FLIGHTID,COUNT(BD.PASSID) PASSCOUNT FROM BOOKING_DETAILS BD INNER
 JOIN BOOKING B ON B.BOOKINGID=BD.BOOKINGID GROUP BY FLIGHTID;




 SELECT PASSNAME,PASSDOB FROM PASSENGER where (ROUND((DATEDIFF(NOW(),PASSDOB)/365)))>=60;




 SELECT BOOKINGID FROM BOOKING_DETAILS GROUP BY BOOKINGID HAVING COUNT(PASSID)=
 (
 SELECT MAX(C) FROM 
 (
 SELECT BOOKINGID,COUNT(PASSID) C FROM BOOKING_DETAILS GROUP BY BOOKINGID
 ) a);




 SELECT B.BOOKINGID,F.TICKETCOST TOTAL_FARE FROM BOOKING B INNER JOIN FLIGHT F ON B.FLIGHTID=F.FLIGHTID;




 select b.bookingid,case
                       when round(datediff(curdate(),p.passdob)/365)>60 then f.ticketcost/2
                       else f.ticketcost
                   end as 'Total_Fare'
from booking b,flight f,booking_details bd,passenger p
where b.bookingid=bd.bookingid and b.flightid=f.flightid and bd.passid=p.passid;



 select flightdest 
from flight 
group by flightdest 
having count(*)=(select max(c) 
                 from (select count(*) c 
                       from flight 
                       group by flightdest
                     )a
               );

 


  SELECT PASSNAME FROM PASSENGER WHERE PASSID IN 
 (
 SELECT PASSID FROM BOOKING_DETAILS GROUP BY PASSID HAVING COUNT(BOOKINGID)>1
 );



 select flightid,count(*) NO_OF_BOOKINGS from booking group by flightid;


 
 select p.passname from passenger p,booking b,flight f,booking_details d
 where b.flightid="1" and f.flightdate=b.bookdate and d.passid=p.passid and b.bookingid=d.bookingid;


 
 
 select flightid from flight where flightdest=flightsource;



 
 select concat("Ticket No:",bookingid," Flight id: ",fl.flightid," Total Passengers: ",count(bookingid)," Total Fare:",count(bookingid)*ticketcost) booking_details
 from booking 
 inner join
 flight fl
 on 
 booking.flightid=fl.flightid
 group by 
 fl.flightid; 



  
 select flightid,flightdate,CASE 

     WHEN FLIGHTID=2 THEN adddate(FLIGHTDATE,interval 4 hour)
     ELSE FLIGHTDATE
     END AS 'FLIGHT NEW DATE'
     FROM FLIGHT;



 
 select passname,passdob from passenger order by passdob;