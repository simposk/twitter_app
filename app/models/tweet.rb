class Tweet < ApplicationRecord
  belongs_to :user

  # Acts as votable
  acts_as_votable
  
  # Validations
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
end
