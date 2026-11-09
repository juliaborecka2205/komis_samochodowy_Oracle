# [PL] Komis samochodowy: opis projektu

Baza danych do obsługi komisu samochodowego.

## Zakres danych

- **Dane techniczne pojazdów:** marka, model, nadwozie, silnik.
- **Stan pojazdów:** przebieg, VIN, rok produkcji.
- **Klienci:** dane teleadresowe.

## Funkcjonalności

- Ewidencja ofert sprzedaży wraz z ich statusem i ceną wywoławczą.
- W przypadku sfinalizowania operacji rejestracja transakcji z przypisanym kupującym, datą i ceną ostateczną.
- Każdy klient może zarówno sprzedawać, jak i kupować wiele aut.

## Normalizacja

Schemat w III postaci normalnej eliminuje redundancję dzięki zastosowaniu tabel słownikowych dla marek, modeli i parametrów technicznych.

# [ENG] Used Cars Dealership simulator: about the project

Database for managing a car dealership.

## Data Scope

- **Vehicle technical specifications:** brand, model, body type, engine.
- **Vehicle condition:** mileage, VIN, year of manufacture.
- **Customers:** contact and address details.

## Functionalities

- Recording of sales offers, including their status and asking price.
- Registration of completed transactions, linking the buyer, the date, and the final sale price.
- Each customer can both sell and purchase multiple vehicles.

## Normalization

The schema, designed in the Third Normal Form (3NF), eliminates redundancy by utilizing lookup (dictionary) tables for brands, models, and technical parameters.
