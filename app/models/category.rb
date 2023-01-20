class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }
end
