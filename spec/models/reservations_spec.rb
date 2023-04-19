require 'swagger_helper'

RSpec.describe Reservation do
  it 'Reservation Api should be valid' do
    reservation = Reservation.create(start_date: Date.today,
                                     end_date: Date.tomorrow)
    expect(reservation).to_not be_valid
  end

  it 'Reservation Api should contain start date' do
    user = User.create!(name: 'admin', email: 'admin@gmail.com', password: '123456')
    room = Room.create(name: 'Name',
                       photo: 'photo.png',
                       price: '100',
                       city: 'City',
                       description: 'Description')
    reservation = Reservation.create!(start_date: '2023/05/19', end_date: '2023/05/20', user_id: user.id,
                                      room_id: room.id)
    expect(reservation.start_date.strftime('%a, %d %b %Y')).to eq('Fri, 19 May 2023')
  end

  it 'Reservation Api should contain end date' do
    user = User.create!(name: 'admin', email: 'admin@gmail.com', password: '123456')
    room = Room.create(name: 'Name',
                       photo: 'photo.png',
                       price: '100',
                       city: 'City',
                       description: 'Description')
    reservation = Reservation.create!(start_date: '2023/05/19', end_date: '2023/05/20', user_id: user.id,
                                      room_id: room.id)
    expect(reservation.end_date.strftime('%a, %d %b %Y')).to eq('Sat, 20 May 2023')
  end

  it 'Reservation Api should contain user id' do
    user = User.create!(name: 'admin', email: 'admin@gmail.com', password: '123456')
    room = Room.create(name: 'Name',
                       photo: 'photo.png',
                       price: '100',
                       city: 'City',
                       description: 'Description')
    reservation = Reservation.create!(start_date: '2023/05/19', end_date: '2023/05/20', user_id: user.id,
                                      room_id: room.id)
    expect(reservation.user_id).to eq(user.id)
  end

  it 'Reservation Api should contain room id' do
    user = User.create!(name: 'admin', email: 'admin@gmail.com', password: '123456')
    room = Room.create(name: 'Name',
                       photo: 'photo.png',
                       price: '100',
                       city: 'City',
                       description: 'Description')
    reservation = Reservation.create!(start_date: '2023/05/19', end_date: '2023/05/20', user_id: user.id,
                                      room_id: room.id)
    expect(reservation.room_id).to eq(room.id)
  end
end
