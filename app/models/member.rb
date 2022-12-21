class Member < ApplicationRecord
  has_secure_password

  has_many :votes, dependent: :destroy
  has_many :voted_products, through: :votes, source: :product

  has_many :orders, dependent: :destroy
  has_many :ordered_products, through: :orders, source: :product

  validates :name, presence: true,
    format: {
      with: /\A[A-Za-z][A-Za-z0-9]*\z/,
      allow_blank: true,
      message: :invalid_member_name
    },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :email, email: { allow_blank: true }

  attr_accessor :current_password
  validates :password, presence: { if: :current_password }

  def votable_for?(product)
    product &&  !votes.exists?(product_id: product.id)
  end
end
