SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
ORDER BY 1,2

-- LOOKING AT TOTAL CASES VS TOTAL DEATHS
-- SHOWS LIKELIHOOD OF DYING FROM CONTRACTING COVID-19 IN YOUR COUNTRY

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%States%'
ORDER BY 1,2

-- LOOKING AT TOTAL CASES VS POPULATION
-- SHOWS WHAT PERCENTAGE OF POPULATION CONTRACTED COVID-19

SELECT location, date, total_cases, population, (total_cases/population)*100 AS CasesPercentage
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%States%'
ORDER BY 1,2

-- COUNTRIES WITH HIGHEST INFECTION RATES

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY population, location
ORDER BY 4 DESC

-- COUNTRIES WITH HIGHEST DEATH COUNT PER POPULATION

SELECT location, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT null
GROUP BY location
ORDER BY 2 DESC

-- CONTINENTS WITH HIGHEST DEATH COUNT PER LOCATION

SELECT continent, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT null
GROUP BY continent
ORDER BY 2 DESC	

-- GLOBAL CASES EACH DAY

SELECT date, SUM(new_cases) as total_cases, SUM(CAST(new_deaths as int)) as total_deaths, SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as death_percentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT null
GROUP BY date
ORDER by 1,2

-- JOINING THE TWO DATABASES
-- TOTAL POPULATION VS VACCINATION

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CAST(vac.new_vaccinations AS bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as Sum_of_People_Vaccinated_by_Date
--(Sum_of_People_Vaccinated_by_Date/dea.population)*100 as sum_of_percent_vaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT null
ORDER BY 2,3

-- USE CTE

With popvsvac (continent, location, date, population, new_vaccinations, Sum_of_People_Vaccinated_by_Date) 
as
(SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CAST(vac.new_vaccinations AS bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as Sum_of_People_Vaccinated_by_Date
--(Sum_of_People_Vaccinated_by_Date/dea.population)*100 as sum_of_percent_vaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT null
--ORDER BY 2,3
)
SELECT *, (Sum_of_People_Vaccinated_by_Date/population)*100 as sum_of_percent_vaccinated
FROM popvsvac

-- CREATING VIEW TO STORE FOR DATA VISUALIZATION LATER

CREATE VIEW Covid_Total_Death_Count as
SELECT continent, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT null
GROUP BY continent	


CREATE VIEW Percent_Population_Infected AS
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY population, location

CREATE VIEW sum_of_percent_vaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CAST(vac.new_vaccinations AS bigint)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as Sum_of_People_Vaccinated_by_Date
--(Sum_of_People_Vaccinated_by_Date/dea.population)*100 as sum_of_percent_vaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT null

CREATE VIEW Highest_Infection_Rates AS
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY population, location

CREATE VIEW Percent_Population_Infected_by_Day AS
SELECT location, date, total_cases, population, (total_cases/population)*100 AS CasesPercentage
FROM PortfolioProject..CovidDeaths