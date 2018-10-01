class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  
  scope :list_categories, ->{select :id, :name}
  self.per_page = 10
end

