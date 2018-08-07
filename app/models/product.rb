class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :comments
end
