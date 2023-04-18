require 'swagger_helper'

RSpec.describe Reservation do
  it 'should be valid' do
    reservation = Reservation.create(start_date: Date.today,
                                     end_date: Date.tomorrow)
    expect(reservation).to_not be_valid
  end
end