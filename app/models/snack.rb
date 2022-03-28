class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :count

  belongs_to :ferret

  def self.ferret_safe_true
    where(ferret_safe: true)
  end
end
