class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :comments
  has_many :photos, dependent: :destroy

  validates :name, presence: true,length: {maximum: 50}
  validates :name, presence: true
end
