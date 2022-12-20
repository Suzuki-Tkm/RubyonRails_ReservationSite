class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :administrator
end
