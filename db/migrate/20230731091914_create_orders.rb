class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer
      t.references :seller
      
      t.timestamps
    end
  end
end
