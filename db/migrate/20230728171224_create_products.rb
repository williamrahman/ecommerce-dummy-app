class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :seller
      t.string :name
      t.string :category
      t.decimal :price, precision: 10, scale: 2 

      t.timestamps
    end
  end
end
