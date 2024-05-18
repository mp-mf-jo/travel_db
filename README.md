# 1.	Wymagania i funkcje systemu

### Użytkownicy

- Tworzenie konta 

- Rezerwacja wycieczki 

- Rezerwacja atrakcji 

- Wgląd do swoich rezerwacji i płatności

### Administrator

- Dodawanie wycieczek/atrakcji

- Dodawanie transportu dla wycieczki/atrakcji

- Dodawanie wpisów z płatnościami

# 2.	Baza danych

## Schemat bazy danych

![Schemat bazy danych](src/schema.png)

## Opis poszczególnych tabel

## Nazwa tabeli: Orders
- Opis: Lista zamówień oraz użytkowników, którzy je złożyli

| Nazwa atrybutu | Typ | Opis/Uwagi                 |
|----------------|-----|----------------------------|
| OrderID        | int | PK                         |
| CustomerID     | int | FK -> Customers            |
| Active         | int | 1 - aktywne, 0 - anulowane |


- kod DDL

```sql
CREATE TABLE Orders (
    OrderID int  NOT NULL,
    CustomerID int  NOT NULL,
    Active int  NOT NULL DEFAULT 1 CHECK (Active = 1 or Active = 0),
    CONSTRAINT Orders_pk PRIMARY KEY  (OrderID)
);
```

## Nazwa tabeli: OrderDetails
- Opis: Szczegóły zamówienia

| Nazwa atrybutu  | Typ      | Opis/Uwagi                                       |
|-----------------|----------|--------------------------------------------------|
| OrderDetailID   | int      | PK                                               |
| OrderID         | int      | FK   -> Orders                                   |
| TripID          | int      | FK   -> Trips                                    |
| OrderDate       | datetime | data złozenia zamówienia                         |
| AttendeesNumber | int      | ilość uczestników podawana w momencie rezerwacji |
| OrderPrice      | money    | cena wycieczki                                   |


- kod DDL

```sql
CREATE TABLE OrderDetails (
    OrderDetailID int  NOT NULL,
    OrderID int  NOT NULL,
    TripID int  NOT NULL,
    OrderDate datetime  NOT NULL,
    AttendeesNumber int  NOT NULL DEFAULT 0 CHECK (AttendeesNumber > 0),
    OrderPrice money  NOT NULL DEFAULT 0 CHECK (OrderPrice > 0),
    CONSTRAINT OrderDetails_pk PRIMARY KEY  (OrderDetailID)
);
```

## Nazwa tabeli: Trips
- Opis: Dostępne wycieczki oraz informacje o nich

| Nazwa atrybutu | Typ      | Opis/Uwagi                            |
|----------------|----------|---------------------------------------|
| TripID         | int      | PK                                    |
| StartDate      | date | data rozpoczęcia wycieczki            |
| EndDate        | date | data zakończenia wycieczki            |
| Price          | money    | cena wycieczki od osoby               |
| Limit          | int      | liczba dostępnych miejsc na wycieczce |
| Description    | nvachar  | dodatkowe informacje o wycieczce      |
| SellStartDate  | datetime | data rozpoczęcia sprzedaży            |
| Country        | nvachar  | kraj wycieczki                        |

- kod DDL

```sql
CREATE TABLE Trips (
    TripID int  NOT NULL,
    StartDate date  NOT NULL,
    EndDate date  NOT NULL,
    Price money  NOT NULL DEFAULT 0 CHECK (Price > 0),
    Limit int  NOT NULL DEFAULT 0 CHECK (Limit > 0),
    Description nvarchar  NOT NULL,
    SellStartDate datetime  NOT NULL,
    Country nvarchar  NOT NULL,
    CONSTRAINT Trips_pk PRIMARY KEY  (TripID)
);
```

## Nazwa tabeli: AttractionsOrders
- Opis: Zamówienia atrakcji oraz informacje powiązane z zamówieniami

| Nazwa atrybutu    | Typ      | Opis/Uwagi                                                |
|-------------------|----------|-----------------------------------------------------------|
| AttractionOrderID | int      | PK                                                        |
| OrderID           | int      | FK -> AttractionAttendees                                 |
| AttracionID       | int      | FK -> Attractions                                         |
| AttendeesNumber   | int      | ilość uczestników podawana w momencie rezerwacji atrakcji |
| OrderPrice        | money    | cena zamówienia                                           |
| OrderDate         | datetime | data złożenia zamówienia                                  |
| Active            | int      | 1 - aktywne, 0 - anulowane                                |


- kod DDL

```sql
CREATE TABLE AttractionsOrders (
    AttractionOrderID int  NOT NULL,
    OrderID int  NOT NULL,
    AttractionID int  NOT NULL,
    AttendeesNumber int  NOT NULL,
    OrderPrice money  NOT NULL CHECK (OrderPrice > 0),
    OrderDate datetime  NOT NULL,
    Active int  NOT NULL DEFAULT 1 CHECK (Active = 1 or Active = 0),
    CONSTRAINT AttractionsOrders_pk PRIMARY KEY  (AttractionOrderID)
);
```

## Nazwa tabeli: Attractions
- Opis: Lista dostępnych atrakcji oraz informacje o nich

| Nazwa atrybutu | Typ      | Opis/Uwagi                |
|----------------|----------|---------------------------|
| AttractionID   | int      | PK                        |
| TripID         | int      | DK -> Trips               |
| StartDate      | datetime | data rozpoczęcia atrakcji |
| EndDate        | datetime | data zakończenia atrakcji |
| Price          | money    | cena atrakcji za osobę    |
| Limit          | int      | liczba dostępnych miejsc  |


- kod DDL

```sql
CREATE TABLE Attractions (
    AttractionID int  NOT NULL,
    TripID int  NOT NULL,
    StartDate datetime  NOT NULL,
    EndDate datetime  NOT NULL,
    Price money  NOT NULL DEFAULT 0 CHECK (Price > 0),
    Limit int  NOT NULL DEFAULT 0 CHECK (Limit > 0),
    CONSTRAINT Attractions_pk PRIMARY KEY  (AttractionID)
);
```

## Nazwa tabeli: Attendees
- Opis: Lista uczestników wycieczki i informacje o nich

| Nazwa atrybutu | Typ     | Opis/Uwagi   |
|----------------|---------|--------------|
| AttendeeID     | int     | PK           |
| OrderID        | int     | FK -> Orders |
| FirstName      | nvachar | imię         |
| LastName       | nvachar | nazwisko     |
| BirthDate      | date    | wiek         |


- kod DDL

```sql
CREATE TABLE Attendees (
    AttendeeID int  NOT NULL,
    OrderID int  NOT NULL,
    FirstName nvarchar  NOT NULL,
    LastName nvarchar  NOT NULL,
    Birthdate date  NOT NULL,
    CONSTRAINT Attendees_pk PRIMARY KEY  (AttendeeID)
);
```

## Nazwa tabeli: Customers
- Opis: Lista klientów składających zamówienia

| Nazwa atrybutu | Typ     | Opis/Uwagi     |
|----------------|---------|----------------|
| CustomerID     | int     | PK             |
| FirstName      | nvachar | imię           |
| LastName       | nvachar | nazwisko       |
| CompanyName    | nvachar | nazwa firmy N  |
| Email          | nvachar | adres mailowy  |
| PhoneNumber    | nvachar | numer telefonu |


- kod DDL

```sql
CREATE TABLE Customers (
    CustomerID int  NOT NULL,
    FirstName nvarchar  NOT NULL,
    LastName nvarchar  NOT NULL,
    CompanyName nvarchar  NULL,
    Email nvarchar  NOT NULL,
    PhoneNumber nvarchar  NOT NULL,
    CONSTRAINT Customers_pk PRIMARY KEY  (CustomerID)
);
```


## Nazwa tabeli: Payments
- Opis: Lista opłat za zamówienia

| Nazwa atrybutu | Typ      | Opis/Uwagi               |
|----------------|----------|--------------------------|
| PaymentID      | int      | PK                       |
| OrderID        | int      | FK -> Orders             |
| PaymentDate    | datetime | data dokonania płatności |
| Amount         | money    | Zapłacona kwota          |
| Type           | nvachar  | Forma płatności          |


- kod DDL

```sql
CREATE TABLE Payments (
    PaymentID int  NOT NULL,
    OrderID int  NOT NULL,
    PaymentDate datetime  NOT NULL,
    Amount money  NOT NULL DEFAULT 0 CHECK (Amount >0),
    Type nvarchar  NOT NULL,
    CONSTRAINT Payments_pk PRIMARY KEY  (PaymentID)
);
```

# Nazwa tabeli: AttractionAttendees
- Opis: Tabela łącząca uczestników wycieczki z wykupionymi atrakcjami

| Nazwa atrybutu   | Typ | Opis/Uwagi                  |
|------------------|-----|-----------------------------|
| AttendeeID       | int | PK, FK -> Attendees         |
| AttracionOrderID | int | PK, FK -> AttractionsOrders |

- kod DDL
```sql
CREATE TABLE AttractionAttendees (
    AttendeeID int  NOT NULL,
    AttractionOrderID int  NOT NULL,
    CONSTRAINT AttractionAttendees_pk PRIMARY KEY  (AttendeeID,AttractionOrderID)
);
```

# 3.  Widoki, procedury/funkcje, triggery 


## Widoki

(dla każdego widoku należy wkleić kod polecenia definiującego widok wraz z komentarzem)


## Procedury/funkcje

(dla każdej procedury/funkcji należy wkleić kod polecenia definiującego procedurę wraz z komentarzem)

## Triggery

(dla każdego triggera należy wkleić kod polecenia definiującego trigger wraz z komentarzem)


# 4. Inne

(informacja o sposobie wygenerowania danych, uprawnienia …)
