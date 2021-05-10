require 'rails_helper'

RSpec.describe 'TrackIts', type: :request do
  let!(:workout) { create(:workout) }
  let!(:track_its) { create_list(:track_it, 20, workout_id: workout.id) }
  let(:workout_id) { workout.id }
  let(:id) { track_its.first.id }

  # Test suite for GET /workouts/:workout_id/track_its
  describe 'GET /workouts/:workout_id/track_its' do
    before { get "/workouts/#{workout_id}/track_its" }

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
    before { get "/workouts/#{workout_id}/track_its/#{id}" }

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
    let(:valid_attributes) { { date: Date.today, description: 'Test description', minutes_recorded: 10 } }

    context 'when request attributes are valid' do
      before { post "/workouts/#{workout_id}/track_its", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/workouts/#{workout_id}/track_its", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body)
          .to include("Validation failed: Date can't be blank, Description can't be blank, Minutes recorded can't be blank")
      end
    end
  end

  # Test suite for PUT /workouts/:workout_id/track_its/:id
  describe 'PUT /workouts/:workout_id/track_its/:id' do
    let(:valid_attributes) { { date: Date.today, description: 'Test description', minutes_recorded: 10 } }

    before { put "/workouts/#{workout_id}/track_its/#{id}", params: valid_attributes }

    context 'when track_it exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the track_it' do
        updated_track_it = TrackIt.find(id)
        expect(updated_track_it.description).to match(/Test description/)
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
    before { delete "/workouts/#{workout_id}/track_its/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
