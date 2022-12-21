class Order < ApplicationRecord
  belongs_to :product
  belongs_to :member
  STATUS_VALUES = %w(cart before_ordering after_ordering)
  STATUS_VALUES_JA = %w(カート 発送前 発送後)

  scope :cart, -> { where(status: "cart") }
  scope :before_ordering, -> { where(status: "before_ordering") }
  scope :after_ordering, ->  { where(status: "after_ordering") }
  scope :history , -> { where(status: "before_ordering").or(where(status: "after_ordering")) }

  validates :orders, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      allow_blank: true
    }
  validates :status, inclusion: { in: STATUS_VALUES }
  # validate do
  #   ordered = Member.find(self.member_id).orders
  #   errors.add(:base , "すでにカートに入っています。") if ordered.exists?(status: "cart" , product_id: self.product_id)
  # end

  def self.status_text(status)
    status_options.to_h.invert[status]
  end
  def self.status_options
    STATUS_VALUES_JA.zip(STATUS_VALUES)
  end
end