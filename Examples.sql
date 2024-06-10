
--1 Dodanie nowego zamówienia na wyiecieczke
DECLARE @OrderID INT = 16;
DECLARE @CustomerID INT = 1; --777; --pokaże błąd no such ID
DECLARE @OrderDetailID INT = 16;
DECLARE @TripID INT = 4; --1; --pokaże błąd no aviable trip with such ID
DECLARE @AttendeesNumber INT = 2; --100; --pokaże błąd invalid amount of attendees

EXEC p_add_order @OrderID, @CustomerID, @OrderDetailID, @TripID, @AttendeesNumber;

--2 Dodanie nowego zamówienia na atrakcje
DECLARE @OrderID INT = 1;
DECLARE @AttractionOrderID INT = 17;
DECLARE @AttractionID INT = 2; --777/5 -- pokaże no such attraction with id/nieprzypisane do tej wycieczi;
DECLARE @AttendeesNumber INT = 2; 

EXEC p_add_attractionOrder @OrderID, @AttractionOrderID, @AttractionID, @AttendeesNumber;

--Czy zamówienie jest opłacone 0-NIE/1-TAK
DECLARE @OrderID INT = 1;
SELECT dbo.f_is_order_paid(@OrderID) AS IsOrderPaid;

select * from vw_payments_summary

--Czy wycieczka/atrakcja jest dostępna
SELECT * FROM vw_aviableTrips;
SELECT * FROM vw_aviableAttraction;

--lista członków zamówienia
SELECT * FROM dbo.f_list_order_attendees(1);


--Lista zaówień klienta
 SELECT * FROM dbo.f_list_customer_orders_attactions(1);

--podsumowanie opłat
SELECT * FROM vw_payments_summary;

