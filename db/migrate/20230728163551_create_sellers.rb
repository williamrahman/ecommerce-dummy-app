class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :name, null: false
      t.string :phone_number
      t.string :address
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
