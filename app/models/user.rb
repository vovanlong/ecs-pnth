class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :suggests, dependent: :destroy

  enum role: { admin: 0, customer: 1 }

  self.per_page = 10
end
