# SQL Data Exploration: COVID-19

## Project Overview
The COVID-19 pandemic has had a profound impact on global health and economies, necessitating a comprehensive analysis of its spread, fatalities, and vaccination efforts. This project aims to explore and analyze the COVID-19 dataset from OurWorldInData using Microsoft SQL Server Management Studio (SSMS). By leveraging SQL queries, we will gain valuable insights into the pandemic's impact across different countries and continents. Key areas of focus include infection rates, case fatality rates, vaccination coverage, and their relationships with population metrics. This project will also highlight the importance of data cleaning, standardization, and the use of SQL tools for data analysis and visualization preparation.

## Resources
1. **Data Source:**
   - [OurWorldInData](https://ourworldindata.org/covid-deaths)
   - [owid-covid-data.csv](owid-covid-data.csv)
   - [CovidDeaths.xlsx](CovidDeaths.xlsx)
   - [CovidVaccinations.xlsx](CovidVaccinations.xlsx)
2. **Software:**
   - Microsoft Excel
   - Microsoft SQL Server Management Studio (SSMS)

## Project Highlights
### 1. Data Cleaning
- The cleaning process involves handling missing values, standardizing date and numerical formats, and removing duplicates to maintain data integrity.
- A critical step is joining these datasets on the population data to ensure consistency and completeness.
- This preparation is essential as it transforms raw data into a structured format, making it suitable for in-depth analysis and ensuring reliable results when imported into Microsoft SQL Server Management Studio.
### 2. Exploratory Data Analysis
- Using SQL queries in Microsoft SQL Server Management Studio, we will calculate key metrics such as the infection rate, case fatality rate, and vaccination coverage for each country.
- This analysis will include determining the percentage of the population infected with COVID-19, the likelihood of death upon infection (case fatality rate), and the proportion of the population vaccinated.
- These insights will not only highlight the severity and spread of the virus across different regions but also provide a comparative view of how countries have managed vaccinations.

## Data Cleaning and Standardization
- **Excel**: The original dataset from OurWorldInData was split into two separate files: [CovidDeaths.xlsx](CovidDeaths.xlsx) and [CovidVaccinations.xlsx](CovidVaccinations.xlsx).
- **Joining Data**: Both datasets were joined on the population data to ensure consistency and accuracy.
- **Standardization**: Standardizing data types ensures consistency, particularly for date formats and numerical data, which is crucial for accurate analysis. Specifically, we changed the total_deaths and total_cases to float variables.

![Screenshot 2024-07-20 185014](https://github.com/user-attachments/assets/99274f0e-ba85-4757-ad50-ca9781e76a61)

## SQL Data Exploration

### 1. Likelihood of Dying if You Contract COVID-19 in Your Country
- This step calculates the case fatality rate (CFR) by country to show the likelihood of death upon contracting COVID-19.
- For example, we observe that Zimbabwe had a death percentage of 21.6% during may of 2020, whereas the United Kingdom has a 21.5% death percentage during that time as well. 

![deathper](https://github.com/user-attachments/assets/62596de7-cd2a-4815-afb3-9fd4a7fc914a)

### 2. Percentage of Population that Got COVID-19
- This query calculates the percentage of the population that contracted COVID-19 in each country.
- We observe that Brunei had the largest Infected Percentage of 76.5% during February of 2024.

![inf](https://github.com/user-attachments/assets/c7fb1040-bc8e-491d-996d-065f50db3330)

### 3. Countries with the Highest Infection Rate Compared to Population
- Identifies countries with the highest infection rates relative to their population size.
- We observe that
- 
![hi](https://github.com/user-attachments/assets/0d1cdf99-187d-478c-af2a-e25c883c9797)



### Break Things Down by Continent
- Aggregates data by continent to provide a broader regional perspective on the impact of COVID-19.

### 6. Shows Countries with the Highest Death Count Per Population
- Calculates the death count per population for each country to identify those most affected by COVID-19 fatalities.

![Screenshot 2024-07-20 185231](https://github.com/user-attachments/assets/f1c2c275-0d06-4916-a705-71daa7ce616e)
![Screenshot 2024-07-20 185213](https://github.com/user-attachments/assets/e57a4549-ae99-4484-9fb6-76ee5b65b1db)

### 7. Global Numbers
- Provides a summary of global statistics, including total cases, deaths, and vaccination rates.

![Screenshot 2024-07-20 185255](https://github.com/user-attachments/assets/a23f7a94-fa70-4fd1-b741-f1aff0322a1f)

### 8. Total Population vs Vaccinations Using a CTE 
- Uses a Common Table Expression (CTE) to compare the total population to the number of vaccinations administered.

![Screenshot 2024-07-20 185348](https://github.com/user-attachments/assets/fb719d25-275f-4961-97b8-49e9e09e883a)

### 9. Store Results in a Temp Table
- Creates a temporary table to store intermediate results for complex queries and calculations.

![Screenshot 2024-07-20 185516](https://github.com/user-attachments/assets/58f282e2-8e5e-4a0d-8ff2-e25082ed6df7)
![Screenshot 2024-07-20 185445](https://github.com/user-attachments/assets/ebb682ae-c39c-4c98-b86b-0cc24779b54b)

### 10. Store Data for Future Visualizations with View
- Creates a view to store the processed data, making it easier to generate visualizations and further analysis.

![Screenshot 2024-07-20 185617](https://github.com/user-attachments/assets/91f6cb77-ce91-4ee1-9c5c-9b2d89c05ff7)
![Screenshot 2024-07-20 185628](https://github.com/user-attachments/assets/ae49f620-e0d4-4266-b51f-4c28f46925f1)

### Questions Answered

1. **Which countries have the highest and lowest infection rates?**
   - **Answer**: By calculating the percentage of the population infected with COVID-19 in each country, we can identify those with the highest and lowest infection rates. This information helps businesses and policymakers understand which regions are most affected and require more stringent health measures or support.

2. **What is the case fatality rate (CFR) in different countries, and how does it compare globally?**
   - **Answer**: The case fatality rate (CFR) can be determined by dividing the total number of deaths by the total number of confirmed cases in each country. This rate indicates the severity of the virus and the effectiveness of the healthcare system in managing COVID-19. Comparing CFR across countries helps in assessing global healthcare responses and identifying best practices.

3. **What percentage of the population has been vaccinated in each country?**
   - **Answer**: By calculating the vaccination rate, or the percentage of the population that has received at least one dose of the COVID-19 vaccine, we can evaluate the progress of vaccination campaigns globally. This information is crucial for understanding the level of herd immunity and planning future vaccination drives.

4. **Which countries have the highest death counts per population, and what might be contributing factors?**
   - **Answer**: By calculating the death count per population (total deaths/population), we can identify the countries most impacted by COVID-19 fatalities. Factors contributing to high death rates may include healthcare infrastructure, government response, population density, and pre-existing health conditions. Understanding these factors can help tailor responses to mitigate future outbreaks.

5. **How do infection and vaccination rates vary across different continents?**
   - **Answer**: Aggregating data by continent and analyzing infection and vaccination rates provides a broader regional perspective. This comparison helps identify which continents are lagging in vaccination efforts or have higher infection rates, guiding international aid and resource allocation. It also aids businesses in making strategic decisions regarding operations and expansions in different regions based on the pandemic's impact.
