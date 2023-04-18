require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      security [Bearer: {}]
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          start_date: { type: :date },
          end_date: { type: :date },
          room_id: { type: :integer }
        },
        required: %w[start_date end_date room_id]
      }

      response '201', 'reservation created' do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:reservation) { { start_date: '01/01/2023', end_date: '05/01/2023', room_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { start_date: '01/01/2023' } }
        run_test!
      end
    end

    get('List of reservations') do
      tags 'Reservations'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
