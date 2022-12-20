class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :member

  has_many :orders, dependent: :destroy
  has_many :orderers, through: :orders, source: :member

  validates :name, presence: true, uniqueness: true
  validates :stock, presence: true,
    numericality: {
      only_integer: true,
      greater_than: -1,
      allow_blank: true
    }
  validates :price, presence: true,
    numericality: {
      only_integer: true,
      greater_than: -1,
      allow_blank: true
    }
end
