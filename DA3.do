*directory
cd C:\Users\meganrb4\Documents\econometrics\DA3

*clean housing file
import excel using ZIPLevelHPI, firstrow
drop E F
gen keep = 0
replace keep = 1 if Year == 2020
replace keep = 1 if Year == 2021
drop if keep == 0
drop keep
drop if Quarter != 1
bysort ThreeDigitZip (Year): gen housechange = 100*(HPI[_n]-HPI[_n-1])/HPI[_n-1]
drop if Year != 2021
drop HPI Quarter Year
rename ThreeDigitZip zip3
save ZIPLevelHPI
clear

*crosswalk to housing merge
import excel using ZIPCountyCrosswalk, firstrow
gen zip3 = substr(zip,1,3)
merge m:1 zip3 using ZIPLevelHPI
drop _merge zip3 tot_ratio oth_ratio bus_ratio res_ratio usps_zip_pref_state usps_zip_pref_city
collapse housechange, by(county)
rename county fips
save FIPS_HPI
clear

*collapse nyt data
import delimited using CountyCOVID19Mortality
collapse (max) deaths, by(fips)
gen str5 fips2 = string(fips,"%05.0f")
drop fips
rename fips2 fips
merge 1:1 fips using FIPS_HPI
drop _merge
save FIPS_HPI_deaths
clear

*per capita adjustment
import excel using CountyLevelPopulation, firstrow
rename FIPS fips
merge 1:1 fips using FIPS_HPI_deaths
drop _merge FullID
gen mortper100k = (deaths/PopulationTotal)*100000
drop PopulationTotal deaths
save FIPS_HPI_mortality
clear

*add income and unemp data
import excel unempincomecounty, firstrow
merge 1:1 fips using FIPS_HPI_mortality
drop _merge
gen unempchange = (unemp2022 - unemp2021) / unemp2021
drop unemp2022 unemp2021
save FIPS_HPI_mortality_controls

*regression analysis
sum housechange medianincome unempchange mortper100k
histogram mortper100k
regress housechange mortper100k medianincome unempchange
twoway (scatter housechange mortper100k) (lfit housechange mortper100k)







