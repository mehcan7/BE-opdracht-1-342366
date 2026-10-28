# Database Specificatie Tabel - Jamin

Database: `jamin`

## Product
| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | | No | PK, AUTO_INCREMENT |
| Naam | Varchar | 50 | No | |
| Barcode | Varchar | 13 | No | UNIQUE |
| IsActief | BIT | | No | Default 1 |
| Opmerking | Varchar | 255 | Yes | Default NULL |
| DatumAangemaakt | DateTime | 6 | No | Default NOW(6) |
| DatumGewijzigd | DateTime | 6 | No | Default NOW(6), ON UPDATE NOW(6) |

## Allergeen
| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | | No | PK, AUTO_INCREMENT |
| Naam | Varchar | 50 | No | |
| Omschrijving | Varchar | 100 | No | |
| IsActief | BIT | | No | Default 1 |
| Opmerking | Varchar | 255 | Yes | Default NULL |
| DatumAangemaakt | DateTime | 6 | No | Default NOW(6) |
| DatumGewijzigd | DateTime | 6 | No | Default NOW(6), ON UPDATE NOW(6) |

## Leverancier
| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | | No | PK, AUTO_INCREMENT |
| Naam | Varchar | 50 | No | |
| ContactPersoon | Varchar | 75 | No | |
| LeverancierNummer | Varchar | 15 | No | UNIQUE |
| Mobiel | Varchar | 12 | No | |
| IsActief | BIT | | No | Default 1 |
| Opmerking | Varchar | 255 | Yes | Default NULL |
| DatumAangemaakt | DateTime | 6 | No | Default NOW(6) |
| DatumGewijzigd | DateTime | 6 | No | Default NOW(6), ON UPDATE NOW(6) |

## Magazijn
| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | | No | PK, AUTO_INCREMENT |
| ProductId | INT UNSIGNED | | No | FK(Product) |
| VerpakkingsEenheidInKilogram | Decimal | 6,3 | No | In kilogram |
| AantalAanwezig | INT UNSIGNED | | Yes | NULL = geen voorraad |
| IsActief | BIT | | No | Default 1 |
| Opmerking | Varchar | 255 | Yes | Default NULL |
| DatumAangemaakt | DateTime | 6 | No | Default NOW(6) |
| DatumGewijzigd | DateTime | 6 | No | Default NOW(6), ON UPDATE NOW(6) |

## ProductPerAllergeen
| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | | No | PK, AUTO_INCREMENT |
| ProductId | INT UNSIGNED | | No | FK(Product) |
| AllergeenId | INT UNSIGNED | | No | FK(Allergeen) |
| IsActief | BIT | | No | Default 1 |
| Opmerking | Varchar | 255 | Yes | Default NULL |
| DatumAangemaakt | DateTime | 6 | No | Default NOW(6) |
| DatumGewijzigd | DateTime | 6 | No | Default NOW(6), ON UPDATE NOW(6) |

## ProductPerLeverancier
| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT UNSIGNED | | No | PK, AUTO_INCREMENT |
| LeverancierId | INT UNSIGNED | | No | FK(Leverancier) |
| ProductId | INT UNSIGNED | | No | FK(Product) |
| DatumLevering | DATE | | No | |
| Aantal | INT UNSIGNED | | No | |
| DatumEerstVolgendeLevering | DATE | | Yes | |
| IsActief | BIT | | No | Default 1 |
| Opmerking | Varchar | 255 | Yes | Default NULL |
| DatumAangemaakt | DateTime | 6 | No | Default NOW(6) |
| DatumGewijzigd | DateTime | 6 | No | Default NOW(6), ON UPDATE NOW(6) |

## Stored procedures
| Naam | Parameters | Doel |
|---|---|---|
| sp_GetAllLeveranciers | | Leveranciers met aantal verschillende producten, aflopend |
| sp_GetLeverancierById | LeverancierId | Gegevens van één leverancier |
| sp_GetGeleverdeProductenByLeverancierId | LeverancierId | Geleverde producten, aflopend op aantal in magazijn |
| sp_GetLeveringProductInfo | LeverancierId, ProductId | Gegevens voor het scherm Levering product |
| sp_CreateLevering | LeverancierId, ProductId, Aantal, DatumEerstVolgendeLevering | Nieuwe levering opslaan en voorraad verhogen (weigert inactieve producten) |
