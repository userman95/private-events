class User < ApplicationRecord
  has_many :attendances ,dependent: :destroy
  has_many :events, through: :attendances , dependent: :destroy

  validates :name, presence: true, uniqueness: true


  def self.get_upcoming(user)
    user.events.where("date > ?",Time.zone.now)
  end

  def self.get_previous(user)
    user.events.where("date < ?",Time.zone.now)
  end
end
