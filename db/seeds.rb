require 'csv'

filename = Rails.root + 'db/seeds.rb'

def has_geography?(row)
  !row["Geography"].nil? && row["Geography"].length > 0 && row["Geography"] != 'Massachusetts Total' && !row["Geography"].include?('"Note')
end

def convert_NA_to_nil(value)
  if value == 'NA'
    nil
  else
    value
  end
end

def make_valid_integer(value)
  new_value = convert_NA_to_nil(value)
  new_value.gsub(/\D/, '').to_i
end

def make_valid_float(value)
  new_value = convert_NA_to_nil(value)
  new_value.gsub(/\D/, '').to_f
end

CSV.foreach(filename, headers: true) do |row|
  # create a nice hash with the values I want, sanitized
  # create a new table row for the town hash
  if has_geography?(row)
    town_hash = {
      geography: row["Geography"]
      pop_total_2005: make_valid_integer(row['"total pop, year 2005"']),
      pop_0_thru_19_2005: make_valid_integer(row['"age 0-19, year 2005"']),
      pop_over65_2005: make_valid_integer(row['"age 65+, year 2005"']),
      per_cap_income_2000: make_valid_integer(row['"Per Capita Income, year 2000"']),
      num_below_200fpl_2000: make_valid_integer(row['"Persons Living Below 200% Poverty, year 2000 "']),
      perc_below_200fpl_2000: make_valid_float(row['"% all Persons Living Below 200% Poverty Level, year 2000"']),
      perc_adeq_prenatal_care: make_valid_float(row['% adequacy prenatal care (kotelchuck)']),
      perc_c_sections_2005_08: make_valid_float(row['"% C-section deliveries, 2005-2008"']),
      num_infant_deaths_2005_08: make_valid_integer(row['"Number of infant deaths, 2005-2008"']),
      infant_mortality_rate_per_1000_2005_08: make_valid_float(row['"Infant mortality rate (deaths per 1000 live births), 2005-2008"']),
      perc_low_birthweight_2005_08: make_valid_float(row['% low birthweight 2005-2008']),
      perc_multiple_births_2005_08: make_valid_float(row['"% multiple births, 2005-2008"']),
      perc_pub_financed_prenatal_care_2005_08: make_valid_float(row['"% publicly financed prenatal care, 2005-2008"']),
      perc_teen_births_2005_08: make_valid_float(row['"% teen births, 2005-2008"'])
    }
    unless TownHealthRecord.where(geography = town_hash[:geography]).count >= 1
      TownHealthRecord.create(town_hash)
      puts "Added #{town_hash[:geography]}."
    end
  end
end


