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

(Dla każdej tabeli kod + opis w formie tabelki + kod DDL)


## Nazwa tabeli: Orders
- Opis: Lista zamówień oraz użytkowników, którzy je złożyli

| Nazwa atrybutu | Typ | Opis/Uwagi                 |
|----------------|-----|----------------------------|
| OrderID        | int | PK                         |
| CustomerID     | int | FK -> Customers            |
| Active         | int | 1 - aktywne, 0 - anulowane |


- kod DDL

```sql

```

## Nazwa tabeli: OrderDetails
- Opis: Szczegóły zamoówienia

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

```

## Nazwa tabeli: AttractionOrders
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

```

## Nazwa tabeli: Attracions
- Opis: Lista dostępnych atrakcji oraz informacje o nich

| Nazwa atrybutu | Typ      | Opis/Uwagi                |
|----------------|----------|---------------------------|
| AttractionID   | int      | PK                        |
| TripID         | int      | DK -> Trips               |
| StartDate      | datetime | data rozpoczęcia atrakcji |
| EndDate        | datetime | data zakończenia atrakcji |
| Price          | money    | cena atrakcji za osobę    |
| Limit          | int      | liczba dostępnch miejsc   |


- kod DDL

```sql

```

## Nazwa tabeli: Attendees
- Opis: Lista uczestników wycieczki i informacje o nich

| Nazwa atrybutu | Typ     | Opis/Uwagi   |
|----------------|---------|--------------|
| AttendeeID     | int     | PK           |
| OrderID        | int     | FK -> Orders |
| FirstName      | nvachar | imię         |
| LastName       | nvachar | nazwisko     |
| BirthDate            | date     | wiek         |


- kod DDL

```sql

```

## Nazwa tabeli: Customers
- Opis: Lista klientów składających zamówienia

| Nazwa atrybutu | Typ     | Opis/Uwagi     |
|----------------|---------|----------------|
| CustomerID     | int     | PK             |
| FirstName      | nvachar | imię           |
| LastName       | nvachar | nazwisko       |
| CompanyName    | nvachar | N  nazwa firmy |
| Email          | nvachar | adres mailowy  |
| PhoneNumber    | nvachar | numer telefonu |


- kod DDL

```sql

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
