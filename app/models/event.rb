class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances
  has_many :attendees, through: :attendances, source: "user"

  scope :past, -> {where("date < ?",Time.zone.now)}
  scope :future, -> {where("date > ?",Time.zone.now)}

  validates :name, presence: true
  validates :date, presence: true

end
