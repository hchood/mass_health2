class TownHealthRecord < ActiveRecord::Base
  validates_presence_of :geography
end
