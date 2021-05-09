require 'rails_helper'

RSpec.describe "Workouts", type: :request do
  let!(:workouts) { create_list(:workout, 10) }
  let(:workout_id) { workouts.first.id }

  # Test suite for GET /workouts
  describe 'GET /workouts' do
    # make HTTP get request before each example
    before { get '/workouts' }

    it 'returns workouts' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /workouts/:id
  describe 'GET /workouts/:id' do
    before { get "/workouts/#{workout_id}" }

    context 'when the record exists' do
      it 'returns the workouts' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:workout_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Workout/)
      end
    end
  end

  # Test suite for POST /workouts
  describe 'POST /workouts' do
    # valid payload
    let(:valid_attributes) { { name: 'Morning run', icon: 'icon' } }

    context 'when the request is valid' do
      before { post '/workouts', params: valid_attributes }

      it 'creates a workout' do
        expect(json['name']).to eq('Morning run')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/workouts', params: { icon: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name by can't be blank/)
      end
    end
  end

  # Test suite for PUT /workouts/:id
  describe 'PUT /workouts/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/workouts/#{workout_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /workouts/:id
  describe 'DELETE /workouts/:id' do
    before { delete "/workouts/#{workout_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
