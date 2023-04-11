class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
