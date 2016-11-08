class Tweet < ApplicationRecord
  belongs_to :user

  # Validations
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
end
