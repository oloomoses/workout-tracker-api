require 'rails_helper'

RSpec.describe 'TrackIts', type: :request do
  let(:user) { create(:user) }
  let!(:workout) { create(:workout) }
  let!(:track_its) { create_list(:track_it, 20, workout_id: workout.id, user_id: user.id) }
  let(:workout_id) { workout.id }
  let(:id) { track_its.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /workouts/:workout_id/track_its
  describe 'GET /workouts/:workout_id/track_its' do
    before { get "/workouts/#{workout_id}/track_its", params: {}, headers: headers }

    context 'when workout exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all workout track_its' do
        expect(json.size).to eq(20)
      end
    end

    context 'when workout does not exist' do
      let(:workout_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Workout")
      end
    end
  end

  # Test suite for GET /workouts/:workout_id/track_its/:id
  describe 'GET /workouts/:workout_id/track_its/:id' do
    before { get "/workouts/#{workout_id}/track_its/#{id}", params: {}, headers: headers }

    context 'when workout track_it exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the track_it' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when workout track_it does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find TrackIt")
      end
    end
  end

  # Test suite for PUT /workouts/:workout_id/track_its
  describe 'POST /workouts/:workout_id/track_its' do
    let(:valid_attributes) { { calories: 2000, minutes_recorded: 10, user_id: user.id }.to_json }
    let(:invalid_attributes) { { user_id: user.id }.to_json }

    context 'when request attributes are valid' do
      before { post "/workouts/#{workout_id}/track_its", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/workouts/#{workout_id}/track_its", params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body)
          .to include("Validation failed: Calories can't be blank, Minutes recorded can't be blank")
      end
    end
  end

  # Test suite for PUT /workouts/:workout_id/track_its/:id
  describe 'PUT /workouts/:workout_id/track_its/:id' do
    let(:valid_attributes) { { calories: 2000, minutes_recorded: 10 }.to_json }

    before { put "/workouts/#{workout_id}/track_its/#{id}", params: valid_attributes, headers: headers }

    context 'when track_it exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the track_it' do
        updated_track_it = TrackIt.find(id)
        expect(updated_track_it.calories).to match(2000)
      end
    end

    context 'when the track_it does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find TrackIt")
      end
    end
  end

  # Test suite for DELETE /workouts/:id
  describe 'DELETE /workouts/:id' do
    before { delete "/workouts/#{workout_id}/track_its/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
