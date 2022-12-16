class Member < ApplicationRecord
  has_secure_password

  has_many :votes, dependent: :destroy
  has_many :voted_products, through: :votes, source: :product

  has_many :orders, dependent: :destroy
  has_many :ordered_products, through: :orders, source: :product
end
