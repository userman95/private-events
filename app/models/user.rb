class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: "event", dependent: :destroy
  has_many :events, foreign_key: :creator_id, class_name: 'Event'

  validates :name, presence: true, uniqueness: true


  def get_upcoming
    events.where("date > ?",Time.zone.now)
  end

  def get_previous
    events.where("date < ?",Time.zone.now)
  end

end
