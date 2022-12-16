class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :administrator
end
