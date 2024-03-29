require 'swagger_helper'

RSpec.describe 'items', type: :request do

  path '/todos/{todo_id}/items' do
    # You'll want to customize the parameter types...
    parameter name: 'todo_id', in: :path, type: :string, description: 'todo_id'

    post('create item') do
      response(200, 'successful') do
        let(:todo_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/todos/{todo_id}/items/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'todo_id', in: :path, type: :string, description: 'todo_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show item') do
      response(200, 'successful') do
        let(:todo_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update item') do
      response(200, 'successful') do
        let(:todo_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete item') do
      response(200, 'successful') do
        let(:todo_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
