class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :room, class_name: 'Room', foreign_key: 'room_id'

  validate :validate_dates

  def validate_dates
    if start_date.present? && !start_date.is_a?(Date)
      errors.add(:start_date, 'must be a valid date')
    end
    
    if end_date.present? && !end_date.is_a?(Date)
      errors.add(:end_date, 'must be a valid date')
    end
    
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, 'cannot be before start date')
    end
  end
end
