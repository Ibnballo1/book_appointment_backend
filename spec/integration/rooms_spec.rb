require 'swagger_helper'

describe 'Rooms API' do
  path '/api/v1/rooms' do
    get('List of rooms') do
      tags 'Rooms'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end

    post 'Creates a room' do
      tags 'Rooms'
      consumes 'application/json'
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :text },
          photo: { type: :string },
          city: { type: :string },
          price: { type: :integer }
        },
        required: %w[name description photo city price]
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
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :text },
                 photo: { type: :string },
                 city: { type: :string },
                 price: { type: :integer }
               },
               required: %w[id name description photo city price]

        let(:id) do
          Room.create(
            name: 'Room 4',
            description: 'Junior Suite',
            photo: 'photo.png',
            city: 'Kano', price: 380
          ).id
        end
        run_test!
      end

      response '404', 'room not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/rooms/{id}' do
    delete('Delete a room by {id}') do
      tags 'Rooms'
      response(202, 'Deleted Room successfully') do
        let(:id) { '123' }
        run_test!
      end

      response(404, 'Room not found') do
        run_test!
      end
    end
  end
end
