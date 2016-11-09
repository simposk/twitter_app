class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", small: "50x50#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :tweets, dependent: :destroy

  acts_as_voter
end
