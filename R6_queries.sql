warnings;

-- Select all the tours that still have tickets left and display the number of tickets left
SELECT tourID,tourName,date,atTransport,duration,noOfSeats-T.totalTicketsSold AS noOfSeatsLeft
FROM A1ActualTour,A1GeneralTour,A1Transport,(SELECT ttTourID, SUM(noOfTicketsSold) AS totalTicketsSold FROM A1TourTicket GROUP BY ttTourID) T
WHERE tourID=T.ttTourID 
	AND atTourCode=tourCode 
	AND T.totalTicketsSold<noOfSeats GROUP BY tourID;

-- Show tour information
SELECT A1Transport.type, A1Transport.noOfSeats,A1Transport.avgSpeed, A1ActualTour.duration, A1ActualTour.atTourCode
FROM A1Transport LEFT JOIN A1ActualTour 
ON A1Transport.type=A1ActualTour.atTransport;

-- Display the tour with the most tickets sold for that month
SELECT tourID,tourName,X.noOfTicketsSold
FROM A1ActualTour A,A1TourTicket T,(SELECT tourID FROM A1ActualTour WHERE MONTH(date)='4') Y, 
	(SELECT ttTourID, SUM(noOfTicketsSold) AS noOfTicketsSold FROM A1TourTicket WHERE ttTourID=Y.tourID GROUP BY ttTourID) X
WHERE A.tourID=Y.tourID 
	AND ttTourID=A.tourID ORDER BY X.noOfTicketsSold;




