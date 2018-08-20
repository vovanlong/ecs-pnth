class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  self.per_page = 10
end
