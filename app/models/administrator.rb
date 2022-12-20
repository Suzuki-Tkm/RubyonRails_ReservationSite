class Administrator < ApplicationRecord
  has_secure_password
  belongs_to :brand , optional: true
  attribute :brand_name

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
  validate do
    brand = Brand.new(name: brand_name)
    errors.add(:base , "ブランド名に誤りがあります") if !brand.save
    self.brand_id = brand.id
  end
end
