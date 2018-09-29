class DeleteColumstatusinorderDeails < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :status
  end
end
