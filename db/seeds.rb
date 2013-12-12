require 'csv'

filename = Rails.root + 'db/data/mass_health_data.csv'

def has_geography?(value)
  !value.nil? && value.length > 0 && value != 'Massachusetts Total' && !value.include?('Note:')
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
  unless new_value.nil?
    new_value.gsub(/\D/, '').to_i
  else
    nil
  end
end

def make_valid_float(value)
  new_value = convert_NA_to_nil(value)
  unless new_value.nil?
    new_value.to_f
  else
    nil
  end
end

CSV.foreach(filename, headers: true) do |row|
  if has_geography?(row['Geography'])
    town_hash = {
      geography: row['Geography'],
      pop_total_2005: make_valid_integer(row['total pop, year 2005']),
      pop_0_thru_19_2005: make_valid_integer(row['age 0-19, year 2005']),
      pop_over65_2005: make_valid_integer(row['age 65+, year 2005']),
      per_cap_income_2000: make_valid_integer(row['Per Capita Income, year 2000']),
      num_below_200fpl_2000: make_valid_integer(row['Persons Living Below 200% Poverty, year 2000 ']),
      perc_below_200fpl_2000: make_valid_float(row['% all Persons Living Below 200% Poverty Level, year 2000']),
      perc_adeq_prenatal_care: make_valid_float(row['% adequacy prenatal care (kotelchuck)']),
      perc_c_sections_2005_08: make_valid_float(row['% C-section deliveries, 2005-2008']),
      num_infant_deaths_2005_08: make_valid_integer(row['Number of infant deaths, 2005-2008']),
      infant_mortality_rate_per_1000_2005_08: make_valid_float(row['Infant mortality rate (deaths per 1000 live births), 2005-2008']),
      perc_low_birthweight_2005_08: make_valid_float(row['% low birthweight 2005-2008']),
      perc_multiple_births_2005_08: make_valid_float(row['% multiple births, 2005-2008']),
      perc_pub_financed_prenatal_care_2005_08: make_valid_float(row['% publicly financed prenatal care, 2005-2008']),
      perc_teen_births_2005_08: make_valid_float(row['% teen births, 2005-2008'])
    }
    unless TownHealthRecord.where(town_hash).count > 0
      town_record = TownHealthRecord.new(town_hash)
      if town_record.valid?
        town_record.save
        puts 'Added ' + town_record.geography
      else
        puts 'Cannot add ' + town_record.geography
      end
    else
      puts 'Town already added.'
    end
  else
    puts 'Row did not pass has_geography condition.'
  end
end


