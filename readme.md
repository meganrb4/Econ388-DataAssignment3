1. CountyCOVID19Mortality.csv
-The New York Times has compiled county-day data on COVID-19 cases and deaths which is presented here for the year 2020.
-To access an explanation of the data visit https://www.nytimes.com/article/coronavirus-county-data-us.html.
-To download the data visit https://github.com/nytimes/covid-19-data/blob/master/us-counties-2020.csv.

2. CountyLevelPopulation.xlsx
-The 2020 census provides information on population levels for each county listed by state.
-To access the census website visit https://www.census.gov/data.html.
-To access the county-level data visit https://data.census.gov/cedsci/table?g=0100000US%240500000&y=2020&d=DEC%20Redistricting%20Data%20%28PL%2094-171%29&tid=DECENNIALPL2020.P1. You need to edit the table to take it down to county level.
-I cleaned out the data by deleting unnecessary columns and parsing out the FIPS code.

3. ZipLevelHPI.xlsx
-The Federal Finance Housing Agency maintains housing price indices at the 3-digit ZIP lvel over many years.
-To access the ZIP-level housing price data vist https://www.fhfa.gov/DataTools/Downloads/Pages/House-Price-Index-Datasets.aspx and scroll down to the line item Three-Digit ZIP Codes (Developmental Index; Not Seasonally Adjusted).
-I did a little data cleaning by removing the first four rows and renaming the columns.

4. ZipCountyCrosswalk.xlsx
-There are often several ZIP codes in one county, so you need to aggregate the ZIP-level data to the county level. This requires knowing which ZIP codes correspond to which county. This information is found at the U.S. Department of Housing and Urban Development's Office of Policy Development and Research's website.
-To access the ZIP-county crosswalk visit https://www.huduser.gov/portal/datasets/usps_crosswalk.html and select ZIP-county for Q4 2021.

5. unempincomecounty.xlsx
-An interesting control to examine is median income by county and the change in the unemployment rate. This requires knowing the 2020 data for median household income for each FIPS code as well as the 2020 and 2021 unemployment rates. 
-To access this data visit https://www.ers.usda.gov/data-products/county-level-data-sets/county-level-data-sets-download-data/ and download "Unemployment and median household income for the U.S., States, and counties, 2000-2021".
-I cleaned up the data by renaming columns and deleting all other variables besides median household income and the unemployment rates.