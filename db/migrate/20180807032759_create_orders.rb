class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status
      t.string :name
      t.string :phone_number
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
