class User < ApplicationRecord

    has_secure_password

    has_many :events, through: :user_events
  
 
end
