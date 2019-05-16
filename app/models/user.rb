class User < ApplicationRecord
  has_many :attendances ,dependent: :destroy
  has_many :events, through: :attendances , dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
