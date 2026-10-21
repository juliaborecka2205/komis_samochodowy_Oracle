# Komis samochodowy: opis projektu

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
