class Ferret < ApplicationRecord
  validates_presence_of :name
  #validates_presence_of :hungry
  validates_presence_of :snack_count

  has_many :snacks, foreign_key: "ferret_id"
end
