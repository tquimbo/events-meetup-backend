class Event < ApplicationRecord

  # has_many :users, through: :user_events
  # has_many :user_events
  has_many :user_events
  has_many :users, through: :user_events
  # has_many :attendees, through: :user_events, source: :user

  
  scope :trending, -> {
    joins(:user_events)
    .where('user_events.created_at >= ?', 7.days.ago)
    .group('events.id')
    .order('COUNT(user_events.id) DESC')
    .limit(100)
  }



  
  def self.search(input)
    SeatGeek.new(input).to_events
end

end
