class Ferret < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :snack_count

  has_many :snacks, foreign_key: "ferret_id", dependent: :delete_all

  def snacks_num
    snacks.length
  end

  def snack_true
    snacks.where(ferret_safe: true)
  end
end
