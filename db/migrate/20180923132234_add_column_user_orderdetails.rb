class AddColumnUserOrderdetails < ActiveRecord::Migration[5.2]
  def change
    add_reference(:order_details, :user, foreign_key: true)
  end
end
