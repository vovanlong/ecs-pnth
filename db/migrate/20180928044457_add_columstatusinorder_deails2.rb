class AddColumstatusinorderDeails2 < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :status, :integer, :default => 0
  end
end
