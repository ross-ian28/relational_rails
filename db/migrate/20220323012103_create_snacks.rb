class CreateSnacks < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks do |t|
      t.string :name
      t.boolean :ferret_safe
      t.integer :count

      t.timestamps
    end
  end
end
