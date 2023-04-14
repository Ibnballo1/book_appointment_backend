require 'swagger_helper'

describe 'Rooms API' do

  path '/api/v1/rooms' do

    post 'Creates a room' do
      tags 'Rooms'
      consumes 'application/json', 'application/xml'
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :text },
          photo: { type: :string },
          city: { type: :string },
          price: { type: :integer }
        },
        required: [ 'name', 'description', 'photo', 'city', 'price' ]
      }

      response '201', 'room created' do
        let(:room) { { name: 'Room 4', description: 'Junior Suite', photo: 'photo.png', city: 'Kano', price: 380 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:room) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/rooms/{id}' do

    get 'Retrieves a room' do
      tags 'Rooms'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            description: { type: :text },
            photo: { type: :string },
            city: { type: :string },
            price: { type: :integer }
          },
          required: [ 'id', 'name', 'description', 'photo', 'city', 'price' ]

        let(:id) { Room.create(name: 'Room 4', description: 'Junior Suite', photo: 'photo.png', city: 'Kano', price: 380).id }
        run_test!
      end

      response '404', 'room not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end