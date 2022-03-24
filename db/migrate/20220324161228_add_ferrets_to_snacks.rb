class AddFerretsToSnacks < ActiveRecord::Migration[5.2]
  def change
    add_reference :snacks, :ferret, foreign_key: true
  end
end
