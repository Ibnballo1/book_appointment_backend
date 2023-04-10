class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :room, class_name: 'Room', foreign_key: 'room_id'

  validates :start_date, :end_date, presence: true
  validate :validate_dates

  def validate_dates
    errors.add(:start_date, 'must be a valid date') unless start_date.is_a?(Date)

    errors.add(:end_date, 'must be a valid date') unless end_date.is_a?(Date)

    errors.add(:start_date, 'must be before end date') if start_date > end_date
  end
end
