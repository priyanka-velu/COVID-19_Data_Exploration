# SQL Data Exploration: COVID-19

## Project Overview
Exploring the COVID-19 Dataset using Microsoft SQL Server Management Studio

## Resources
1. Data Source:
- [OurWorldInData](https://ourworldindata.org/covid-deaths)
- owid-covid-data.csv
- CovidDeaths.xlsx
- CovidVaccinations.xlsx

2. Software:
- Microsoft Excel
- Microsoft SQL Server Management Studio

## Organize the Data
- add filters
- split the original dataset into CovidDeaths and CovidVacciantions
- joined it on the population


In SQL
- create database: right click and write name
- make sure that the file is xlsx, NOT csv
- IMPORT DATA: click the database, right click, tasks, import data, data source = microsoft excel, destination = microsfot OLE DB Provider for SQL Server, copy data, finish
- refresh table

## Standardize data type
![Screenshot 2024-07-20 185628](https://github.com/user-attachments/assets/ae49f620-e0d4-4266-b51f-4c28f46925f1)
![Screenshot 2024-07-20 185617](https://github.com/user-attachments/assets/91f6cb77-ce91-4ee1-9c5c-9b2d89c05ff7)
![Screenshot 2024-07-20 185516](https://github.com/user-attachments/assets/58f282e2-8e5e-4a0d-8ff2-e25082ed6df7)
![Screenshot 2024-07-20 185445](https://github.com/user-attachments/assets/ebb682ae-c39c-4c98-b86b-0cc24779b54b)
![Screenshot 2024-07-20 185348](https://github.com/user-attachments/assets/fb719d25-275f-4961-97b8-49e9e09e883a)
![Screenshot 2024-07-20 185255](https://github.com/user-attachments/assets/a23f7a94-fa70-4fd1-b741-f1aff0322a1f)
![Screenshot 2024-07-20 185231](https://github.com/user-attachments/assets/f1c2c275-0d06-4916-a705-71daa7ce616e)
![Screenshot 2024-07-20 185213](https://github.com/user-attachments/assets/e57a4549-ae99-4484-9fb6-76ee5b65b1db)
![Screenshot 2024-07-20 185151](https://github.com/user-attachments/assets/8a62601a-cac8-4718-9900-b65c806c5c97)
![Screenshot 2024-07-20 185105](https://github.com/user-attachments/assets/121949f9-ea0f-4872-98f8-9dd69f225ff3)
![Screenshot 2024-07-20 185043](https://github.com/user-attachments/assets/92a43ec7-8406-410b-a177-dbd516641fd8)
![Screenshot 2024-07-20 185014](https://github.com/user-attachments/assets/99274f0e-ba85-4757-ad50-ca9781e76a61)
![Screenshot 2024-07-20 184942](https://github.com/user-attachments/assets/dc98f5ea-0fab-4e89-903d-2d16cdc1bbef)


## Show the likelihood of dying if you contract COVID-19 in your country


## Percentage of population got COVID-19


## Countries with highest infection rate compared to population


# Break things down by continent
## Showing Countries with the highest death count per population


## Global Numbers


## Using a CTE to look at total population vs vaccinations


## Temp table


## Creating view to store data for later visualizations



## 























