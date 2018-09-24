class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :product_id, :user_id, :quantity, :price
  belongs_to :order
  belongs_to :product
  belongs_to :user
end
