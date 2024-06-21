class Event < ApplicationRecord

  # has_many :users, through: :user_events
  # has_many :user_events
  has_many :user_events
  has_many :users, through: :user_events
  # has_many :attendees, through: :user_events, source: :user

  
  scope :trending, -> {
    joins(:attendees)
    .where('attendances.created_at >= ?', 7.days.ago)
    .group('events.id')
    .order('COUNT(attendances.id) DESC')
    .limit(10)
  }



  
  def self.search(input)
    SeatGeek.new(input).to_events
end

end
