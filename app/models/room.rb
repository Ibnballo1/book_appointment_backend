class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :photo, presence: true
  validates :city, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
