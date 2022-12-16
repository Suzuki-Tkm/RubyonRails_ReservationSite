class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :member

  has_many :orders, dependent: :destroy
  has_many :orderers, through: :orders, source: :member
end
