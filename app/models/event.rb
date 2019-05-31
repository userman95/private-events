class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances

  scope :past, -> {where("date < ?",Time.zone.now)}
  scope :future, -> {where("date > ?",Time.zone.now)}

end
