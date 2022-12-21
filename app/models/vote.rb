class Vote < ApplicationRecord
  belongs_to :product
  belongs_to :member

  validate do
    unless member && member.votable_for?(product)
      errors.add(:base, :invalid)
    end
  end
end
