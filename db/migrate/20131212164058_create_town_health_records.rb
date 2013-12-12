class CreateTownHealthRecords < ActiveRecord::Migration
  def change
    create_table :town_health_records do |t|
      t.string :geography, null: false
      t.integer :pop_total_2005
      t.integer :pop_0_thru_19_2005
      t.integer :pop_over65_2005
      t.integer :per_cap_income_2000
      t.integer :num_below_200fpl_2000
      t.decimal :perc_below_200fpl_2000
      t.decimal :perc_adeq_prenatal_care
      t.decimal :perc_c_sections_2005_08
      t.integer :num_infant_deaths_2005_08
      t.decimal :infant_mortality_rate_per_1000_2005_08
      t.decimal :perc_low_birthweight_2005_08
      t.decimal :perc_multiple_births_2005_08
      t.decimal :perc_pub_financed_prenatal_care_2005_08
      t.decimal :perc_teen_births_2005_08

      t.timestamps
    end
  end
end
