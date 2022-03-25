class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :count

  belongs_to :ferret
end
