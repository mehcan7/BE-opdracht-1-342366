# Database Specificatie Tabel - Jamin Magazijn

Database: `jamin`

## Stamtabellen

### Product
| Kolom | Type | Null | Sleutel |
|---|---|---|---|
| Id | INT UNSIGNED AUTO_INCREMENT | Nee | PK |
| Naam | VARCHAR(50) | Nee | |
| Barcode | VARCHAR(13) | Nee | UNIQUE |
| IsActief | BIT | Nee | |
| Opmerking | VARCHAR(250) | Ja | |
| DatumAangemaakt | DATETIME(6) | Nee | |
| DatumGewijzigd | DATETIME(6) | Nee | |

### Allergeen
| Kolom | Type | Null | Sleutel |
|---|---|---|---|
| Id | INT UNSIGNED AUTO_INCREMENT | Nee | PK |
| Naam | VARCHAR(50) | Nee | |
| Omschrijving | VARCHAR(100) | Nee | |
| IsActief | BIT | Nee | |
| Opmerking | VARCHAR(250) | Ja | |
| DatumAangemaakt | DATETIME(6) | Nee | |
| DatumGewijzigd | DATETIME(6) | Nee | |

### Leverancier
| Kolom | Type | Null | Sleutel |
|---|---|---|---|
| Id | INT UNSIGNED AUTO_INCREMENT | Nee | PK |
| Naam | VARCHAR(50) | Nee | |
| ContactPersoon | VARCHAR(75) | Nee | |
| LeverancierNummer | VARCHAR(15) | Nee | UNIQUE |
| Mobiel | VARCHAR(12) | Nee | |
| IsActief | BIT | Nee | |
| Opmerking | VARCHAR(250) | Ja | |
| DatumAangemaakt | DATETIME(6) | Nee | |
| DatumGewijzigd | DATETIME(6) | Nee | |

## Koppeltabellen

### Magazijn
| Kolom | Type | Null | Sleutel |
|---|---|---|---|
| Id | INT UNSIGNED AUTO_INCREMENT | Nee | PK |
| ProductId | INT UNSIGNED | Nee | FK -> Product(Id) |
| VerpakkingsEenheidInKilogram | DECIMAL(6,3) | Nee | |
| AantalAanwezig | INT UNSIGNED | Ja | |
| IsActief | BIT | Nee | |
| Opmerking | VARCHAR(250) | Ja | |
| DatumAangemaakt | DATETIME(6) | Nee | |
| DatumGewijzigd | DATETIME(6) | Nee | |

### ProductPerAllergeen
| Kolom | Type | Null | Sleutel |
|---|---|---|---|
| Id | INT UNSIGNED AUTO_INCREMENT | Nee | PK |
| ProductId | INT UNSIGNED | Nee | FK -> Product(Id) |
| AllergeenId | INT UNSIGNED | Nee | FK -> Allergeen(Id) |
| IsActief | BIT | Nee | |
| Opmerking | VARCHAR(250) | Ja | |
| DatumAangemaakt | DATETIME(6) | Nee | |
| DatumGewijzigd | DATETIME(6) | Nee | |

### ProductPerLeverancier
| Kolom | Type | Null | Sleutel |
|---|---|---|---|
| Id | INT UNSIGNED AUTO_INCREMENT | Nee | PK |
| LeverancierId | INT UNSIGNED | Nee | FK -> Leverancier(Id) |
| ProductId | INT UNSIGNED | Nee | FK -> Product(Id) |
| DatumLevering | DATE | Nee | |
| Aantal | INT UNSIGNED | Nee | |
| DatumEerstVolgendeLevering | DATE | Ja | |
| IsActief | BIT | Nee | |
| Opmerking | VARCHAR(250) | Ja | |
| DatumAangemaakt | DATETIME(6) | Nee | |
| DatumGewijzigd | DATETIME(6) | Nee | |
