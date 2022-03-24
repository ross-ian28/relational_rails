class CreateFerrets < ActiveRecord::Migration[5.2]
  def change
    create_table :ferrets do |t|
      t.string :name
      t.boolean :hungry
      t.integer :snack_count

      t.timestamps
    end
  end
end
