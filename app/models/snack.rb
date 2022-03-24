class Snack < ApplicationRecord
  validates_presence_of :name
  #validates_presence_of :ferret_safe
  validates_presence_of :count

  belongs_to :ferret
end
