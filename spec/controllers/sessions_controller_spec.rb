require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  # create user and get token
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  # Test suite for POST /logout
  describe 'POST /logout' do
    context 'when user is authenticated' do
      before { post '/logout', params: {}, headers: headers }

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a JSON message indicating successful logout' do
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Logout successful')
      end
    end

    context 'when user is not authenticated (missing token)' do
      before { post '/logout', params: {}, headers: {} }

      it 'returns status code 422 (unauthorized)' do
        expect(response).to have_http_status(422)
      end

      it 'returns an unauthorized message' do
        expect(json['message']).to match(/Missing token/)
      end
    end
  end
end