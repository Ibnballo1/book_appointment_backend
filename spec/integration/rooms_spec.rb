require 'swagger_helper'

RSpec.describe Room do
  # let(:user) do
  #   User.create(name: 'Admin', email: 'admin@gmail.com', password: '123456789', role: 'admin')
  # end

  # let(:token) do
  #   post '/auth/login', params: { email: user.email, password: user.password }
  #   response.headers['Authorization']
  # end

  # let(:auth_headers) { { 'Authorization': "Bearer #{token}" } }

  it 'Room Api should be valid' do
    room = Room.create(name: '',
                       photo: '',
                       price: '',
                       city: '',
                       description: '')
    expect(room).to_not be_valid
  end

  it 'Room Api should have a name' do
    room = Room.create(name: 'Name',
                       photo: 'photo.png',
                       price: '100',
                       city: 'City',
                       description: 'Description')
    expect(room.name).to eql('Name')
  end
end
