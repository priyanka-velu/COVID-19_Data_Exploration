/*

DATA EXPLORATION IN SQL USING COVID DATA

*/

--------------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent is not NULL
ORDER BY 3,4

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--ORDER BY 3,4

--------------------------------------------------------------------------------------------------------------------------------------

-- SELECT DATA THAT WE ARE GOING TO USE

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent is not NULL
ORDER BY 1, 2

-- CHANGE VARIABLE TYPES TO FLOAT

SELECT *
FROM PortfolioProject..CovidDeaths

ALTER TABLE PortfolioProject..CovidDeaths
ALTER COLUMN total_deaths float

ALTER TABLE PortfolioProject..CovidDeaths
ALTER COLUMN total_cases float

--------------------------------------------------------------------------------------------------------------------------------------

-- LOOKING AT total_cases VS total_deaths
-- SHOWS LIKELIHOOD OF DYING IF YOU CONTRACT COVID IN YOUR COUNTRY

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like '%States%'
AND continent is not NULL
ORDER BY 1, 2

--------------------------------------------------------------------------------------------------------------------------------------

-- LOOKING AT total_cases VS POPULATION
-- SHOWS WHAT PERCENTAGE OF POPULATION GOT COVID

SELECT location, date, Population, total_cases, (total_cases/population)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like '%States%'
ORDER BY 1, 2

--------------------------------------------------------------------------------------------------------------------------------------

-- LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION
--Looking at Countries with highest infection rate compared to population

SELECT location, Population, MAX(total_cases) AS HighestInfectionCount, MAX(total_cases/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location like '%States%'
GROUP BY Location, Population
ORDER BY 1, 2

SELECT location, Population, MAX(total_cases) AS HighestInfectionCount, MAX(total_cases/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
WHERE location like '%States%'
GROUP BY Location, Population
ORDER BY PercentPopulationInfected desc

--------------------------------------------------------------------------------------------------------------------------------------

-- SHOWING COUNTRIES WITH HIGHEST DEATH COUNT PER POPULATION

SELECT location, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is not NULL
GROUP BY Location
ORDER BY TotalDeathCount desc

--------------------------------------------------------------------------------------------------------------------------------------

-- LET'S BREAK THINGS DOWN BY CONTINENT

-- SHOWING CONTINENTS WITH THE HIGHEST DEATH COUNT PER POPULATION

SELECT continent, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is not NULL
GROUP BY continent
ORDER BY TotalDeathCount desc

-- GLOBAL NUMBERS

SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS int)) AS total_deaths, SUM(CAST(new_deaths as int))/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
--WHERE location like '%States%'
WHERE continent is not NULL
ORDER BY 1, 2

-- LOOKINGA AT TOTAL POPULATION VS VACCINATIONS
-- USE CTE TABLE

ALTER TABLE PortfolioProject..CovidVaccinations
ALTER COLUMN new_vaccinations float

WITH PopVsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated) 
AS 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) 
AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date    
WHERE dea.continent is NOT NULL
--ORDER BY 2, 3
)

Select *, (RollingPeopleVaccinated/population)*100
FROM PopVsVac

--------------------------------------------------------------------------------------------------------------------------------------

-- TEMP TABLE

DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime, 
Population numeric, 
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) 
AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date    
WHERE dea.continent is NOT NULL
ORDER BY 2, 3

Select *, (RollingPeopleVaccinated/population)*100
FROM #PercentPopulationVaccinated

--------------------------------------------------------------------------------------------------------------------------------------

-- CREATING VIEW TO STORE DATA FOR LATER VISUALIZATIONS

CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) 
AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date    
WHERE dea.continent is NOT NULL
--ORDER BY 2, 3

SELECT *
FROM PercentPopulationVaccinated

--------------------------------------------------------------------------------------------------------------------------------------