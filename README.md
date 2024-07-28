# SQL Data Exploration: COVID-19 Health Analyst

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
- We observe that Brunei has the largest infection rate of 76.5%, followed up by Cyprus with 76.0%, and San Marino with 75.0% of people infected. 

![hi](https://github.com/user-attachments/assets/0d1cdf99-187d-478c-af2a-e25c883c9797)

### Break Things Down by Continent
- Aggregates data by continent to provide a broader regional perspective on the impact of COVID-19.

### 6. Shows Countries with the Highest Death Count Per Population
- Calculates the death count per population for each country to identify those most affected by COVID-19 fatalities.
- We observe that North America suffered the highest death count out of all of the continents.

![Screenshot 2024-07-20 185231](https://github.com/user-attachments/assets/f1c2c275-0d06-4916-a705-71daa7ce616e)

- We observe that United States suffered the highest total death count compared to all countries. 

![Screenshot 2024-07-20 185213](https://github.com/user-attachments/assets/e57a4549-ae99-4484-9fb6-76ee5b65b1db)

### 7. Global Numbers
- Provides a summary of global statistics, including total cases, deaths, and vaccination rates.
- We observe that out of the total_cases of 774 million, 704 million people died. This leads to a death percentage of 90.9% if you were infected.
- The number 90.9% as a death percentage seems disproportionately high, this would prompt us to explore this data for data accuracy.

![Screenshot 2024-07-20 185255](https://github.com/user-attachments/assets/a23f7a94-fa70-4fd1-b741-f1aff0322a1f)

### 8. Total Population vs Vaccinations Using a CTE 
- Uses a Common Table Expression (CTE) to compare the total population to the number of vaccinations administered.
- We observe that around 1.71% of people in the United States were vaccinated around December of 2020. 

![v](https://github.com/user-attachments/assets/c5bf3250-f5f3-4479-82a8-2ded51ee2af1)

### 9. Store Results in a Temp Table
- Creates a temporary table to store intermediate results for complex queries and calculations.
- We sucessfully create a temp table that displays information on the number of vaccinations rolling vaccination, and sum of new vaccinations.

![Screenshot 2024-07-20 185445](https://github.com/user-attachments/assets/ebb682ae-c39c-4c98-b86b-0cc24779b54b)

![Screenshot 2024-07-20 185516](https://github.com/user-attachments/assets/58f282e2-8e5e-4a0d-8ff2-e25082ed6df7)

### 10. Store Data for Future Visualizations with View
- We successfully created a view of vaccination information to store, making it easier to generate visualizations and further analysis.

![Screenshot 2024-07-20 185617](https://github.com/user-attachments/assets/91f6cb77-ce91-4ee1-9c5c-9b2d89c05ff7)

![Screenshot 2024-07-20 185628](https://github.com/user-attachments/assets/ae49f620-e0d4-4266-b51f-4c28f46925f1)

### Health Analyst Questions Answered

1. **What factors contributed to the high case fatality rate in Zimbabwe and the United Kingdom during May 2020?**
   - **Context**: The observed case fatality rates of 21.6% in Zimbabwe and 21.5% in the United Kingdom during May 2020 are significantly high.
   - **Follow-up**: Investigate the healthcare infrastructure, availability of medical resources, effectiveness of public health policies, and demographic characteristics of those infected during this period.

2. **What measures were implemented in Brunei that led to the highest infection rate of 76.5% in February 2024?**
   - **Context**: Brunei had an exceptionally high infection rate of 76.5%.
   - **Follow-up**: Analyze government policies, public health measures, and community behavior during this period to understand the underlying causes of such a high infection rate.

3. **How did the healthcare system and government response in North America contribute to the high death count?**
   - **Context**: North America suffered the highest death count among all continents, with the United States having the highest total death count.
   - **Follow-up**: Examine healthcare capacity, response times, policy decisions, and public compliance with health guidelines to determine the factors contributing to these high death rates.

4. **What are the possible reasons for the extremely high global death percentage of 90.9% among infected individuals?**
   - **Context**: The global statistics suggest a death percentage of 90.9% among those infected, which appears disproportionately high.
   - **Follow-up**: Verify data accuracy and investigate potential data recording or reporting issues. Assess global healthcare responses, availability of treatments, and the accuracy of reported cases and deaths.

5. **How did the vaccination rollout in the United States progress, given the low vaccination rate of 1.71% in December 2020?**
   - **Context**: Only 1.71% of the population in the United States was vaccinated by December 2020.
   - **Follow-up**: Analyze the initial challenges faced during the vaccine rollout, such as supply chain issues, distribution logistics, vaccine hesitancy, and prioritization strategies. Compare this with subsequent months to understand improvements and adaptations.

### Conclusion

By addressing these questions, I, as a health analyst, can gain deeper insights into the effectiveness of public health responses, identify areas needing improvement, and develop strategies to better manage future health crises.
