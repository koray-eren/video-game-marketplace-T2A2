class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.string :console_compatibility
      t.integer :functional_condition
      t.integer :cosmetic_condition
      t.text :description

      t.timestamps
    end
  end
end
