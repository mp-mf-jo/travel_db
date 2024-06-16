


--1 Dodanie nowego zamówienia na wyiecieczke
DECLARE @OrderID INT = 20;
DECLARE @CustomerID INT = 20; --777; --pokaże błąd no such ID
DECLARE @OrderDetailID INT = 20;
DECLARE @TripID INT = 4; --1;3--pokaże błąd no aviable trip with such ID
DECLARE @AttendeesNumber INT = 2; --100; --pokaże błąd invalid amount of attendees

EXEC p_add_order @OrderID, @CustomerID, @OrderDetailID, @TripID, @AttendeesNumber;

--2 Dodanie nowego zamówienia na atrakcje
DECLARE @OrderID INT = 1;
DECLARE @AttractionOrderID INT = 17;
DECLARE @AttractionID INT = 2; --777/5 -- pokaże no such attraction with id/nieprzypisane do tej wycieczi;
DECLARE @AttendeesNumber INT = 2; 
select * from orders

EXEC p_add_attractionOrder @OrderID, @AttractionOrderID, @AttractionID, @AttendeesNumber;


DECLARE @OrderID INT = 15;--777; --pokaże błąd no such ID || --; --15; -- błąd too many attendees
DECLARE @AttendeeID INT = 56; 
DECLARE @FirstName nvarchar = 'ala';
DECLARE @LastName nvarchar = 'kot'; 
DECLARE @Birthday date = '1999-02-02';--'1599-02-02'; --pokaże błąd invalid birthdate

EXEC p_add_attendees @AttendeeID, @OrderID, @FirstName, @LastName, @Birthday;


DECLARE @AttractionOrderID INT = 15;
DECLARE @AttendeeID INT = 59; -- 777; --pokaze no such attendee 

EXEC p_add_Attractionttendees @AttendeeID, @AttractionOrderID


--Czy zamówienie jest opłacone 0-NIE/1-TAK
DECLARE @OrderID INT = 1;
SELECT dbo.f_is_order_paid(@OrderID) AS IsOrderPaid;

select * from vw_payments_summary

--Czy wycieczka/atrakcja jest dostępna
SELECT * FROM vw_aviableTrips;
SELECT * FROM vw_aviableAttraction;

--lista członków zamówienia
SELECT * FROM dbo.f_list_order_attendees(1);


--Lista atrakcji dla zamówienia
select * from dbo.f_attractions_per_order(3)

--podsumowanie opłat
SELECT * FROM vw_payments_summary;

--trgger dodania zamówienia atrakcji   
insert into AttractionsOrders (AttractionOrderID, OrderID, AttractionID, AttendeesNumber, OrderPrice, OrderDate, Active)
values (20,11,16,1,999, '2024-06-06 12:13:14.000', 1)

-- trigger akualizacji zamówienia
update Orders set Active=0 where OrderID=11





delete from Orders
where OrderID = 17
