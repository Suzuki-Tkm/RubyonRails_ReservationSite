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

    class << self
      def search(query)
        ret = []
        product = Product.all
        if query.present?
          Product.all.each do |p|
            ret.push(p) if p.name.eql?(query) || Brand.find(p.brand_id).name.eql?(query) || Category.find(p.category_id).name.eql?(query)
          end
        else
          ret = product
        end
        ret
      end
    end
end