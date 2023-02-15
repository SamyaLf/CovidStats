
 
 --MortalityRate
 select [Country/Region], TotalCases, TotalDeaths, (TotalDeaths/TotalCases)*100 as MortalityRate
 from world_data
 

 --InfectionRate
 select [Country/Region], TotalCases, Population, (TotalCases/Population)*100 as InfectionRate
from world_data

--Countries with highest InfectionRate
select [Country/Region], Population, max((TotalCases/Population))*100 as InfectionRate
from world_data
group by [Country/Region],Population
order by InfectionRate desc

-- TotalCases and TotalDeaths by continent
select distinct (Continent), sum(TotalCases) as TotalCases, sum(TotalDeaths) as TotalDeaths, sum(Population) as ContinentPopulation
from world_data
where Continent is not null
group by Continent

--TestingRate
select [Country/Region], population, TotalTests, (TotalTests/Population)*100 as TestingRate
from world_data
order by [Country/Region]

--SeriousCasesRate
select [Country/Region],TotalTests, ActiveCases, [Serious,Critical], ([Serious,Critical]/ActiveCases)*100 as SeriousCasesRate
from world_data
where ActiveCases<>0
order by [Country/Region]


--RecoveryRate
select [Country/Region], TotalCases, TotalRecovered, (TotalRecovered/TotalCases)*100 as RecoveryRate
from world_data
order by TotalCases desc

--Total of administered vaccines per country
select country, sum(daily_vaccinations) as AdministeredVaccines
from country_vaccinations
group by country
order by country

