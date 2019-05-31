class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances, dependent: :destroy
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'

  validates :name, presence: true, uniqueness: true


  def get_upcoming
    created_events.where("date > ?",Time.zone.now)
  end

  def get_previous
    created_events.where("date < ?",Time.zone.now)
  end

end
