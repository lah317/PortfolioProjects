SELECT *
FROM PortfolioProject.dbo.Monkey_Pox_Cases_Worldwide

-- REMOVING THE TWO TRAVEL HISTORY COLUMNS BECAUSE I DON'T NEED THEM FOR MY VISUALIZATION

ALTER TABLE PortfolioProject.dbo.Monkey_Pox_Cases_Worldwide
DROP COLUMN Travel_History_Yes

ALTER TABLE PortfolioProject.dbo.Monkey_Pox_Cases_Worldwide
DROP COLUMN Travel_History_No

-- EXTRACTING TOP 10 COUNTRIES IN CONFIRMED CASES, SUSPECTED CASES, AND HOSPITALIZATIONS

SELECT TOP 10 Country, Confirmed_Cases
FROM PortfolioProject.dbo.Monkey_Pox_Cases_Worldwide
ORDER BY Confirmed_Cases DESC

SELECT TOP 10 Country, Suspected_Cases
FROM PortfolioProject.dbo.Monkey_Pox_Cases_Worldwide
ORDER BY Suspected_Cases DESC

SELECT TOP 10 Country, Hospitalized
FROM PortfolioProject.dbo.Monkey_Pox_Cases_Worldwide
ORDER BY Hospitalized DESC