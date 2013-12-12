-- NOTE:  I included the field in question in the SELECT statement because I thought it would
-- be useful to see numbers in addition to the towns identified by the query.

-- What 3 towns have the highest population of citizens that are 65 years and older?

SELECT geography, pop_over65_2005
FROM town_health_records
ORDER BY pop_over65_2005 DESC
LIMIT 3;

-- What 3 towns have the highest population of citizens that are 19 years and younger?

SELECT geography, pop_0_thru_19_2005
FROM town_health_records
ORDER BY pop_0_thru_19_2005 DESC
LIMIT 3;

-- What 5 towns have the lowest per capita income?

SELECT geography, per_cap_income_2000
FROM town_health_records
ORDER BY per_cap_income_2000
LIMIT 5;

-- Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?

SELECT geography, perc_teen_births_2005_08
FROM town_health_records
WHERE perc_teen_births_2005_08 IS NOT NULL AND geography != 'Boston' AND geography != 'Becket' AND geography != 'Beverly'
ORDER BY perc_teen_births_2005_08 DESC
LIMIT 1;

-- Omitting Boston, what town has the highest number of infant mortalities?
ß
SELECT geography, infant_mortality_rate_per_1000_2005_08
FROM town_health_records
WHERE infant_mortality_rate_per_1000_2005_08 IS NOT NULL AND geography != 'Boston'
ORDER BY infant_mortality_rate_per_1000_2005_08 DESC
LIMIT 1;
