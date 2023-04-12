class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :photo, presence: true
  validates :city, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
