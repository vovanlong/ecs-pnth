class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_id, :user_id, :quantity, :price, :total_price, :status
  belongs_to :order
  belongs_to :product
  belongs_to :user

  def total_price
    return object.quantity * object.price
  end
  
end
