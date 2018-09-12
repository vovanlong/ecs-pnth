class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :name, presence: true,length: {maximum: 50}
  validates :name, presence: true
end
