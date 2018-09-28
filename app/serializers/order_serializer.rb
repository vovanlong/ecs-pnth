class OrderSerializer < ActiveModel::Serializer
  attributes :name, :phone_number, :address,:status
  belongs_to :user
  has_many :order_details
end
