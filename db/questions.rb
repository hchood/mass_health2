# What 3 towns have the highest population of citizens that are 65 years and older?

TownHealthRecord.order('pop_over_65_2005 DESC').limit(3)

# What 3 towns have the highest population of citizens that are 19 years and younger?

TownHealthRecord.order('pop_0_thru_19_2005 DESC').limit(3)

# What 5 towns have the lowest per capita income?

TownHealthRecord.order('per_cap_income_2000').limit(5)

# Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?

TownHealthRecord.order('perc_teen_births_2005_08 DESC').where("perc_teen_births_2005_08 IS NOT NULL AND geography != 'Boston' AND geography != 'Becket' AND geography != 'Beverly'").limit(1)

# Omitting Boston, what town has the highest number of infant mortalities?

TownHealthRecord.order('infant_mortality_rate_per_1000_2005_08 DESC').where("infant_mortality_rate_per_1000_2005_08 IS NOT NULL AND geography != 'Boston'").limit(1)
