class CreateTownHealthRecords < ActiveRecord::Migration
  def change
    create_table :town_health_records do |t|

      t.timestamps
    end
  end
end
