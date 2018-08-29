class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :comments
  has_many :photos, dependent: :destroy
end
