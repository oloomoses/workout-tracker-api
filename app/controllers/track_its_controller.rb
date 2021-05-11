class TrackItsController < ApplicationController
  before_action :set_workout
  before_action :set_workout_track_it, only: %i[show update destroy]

  def index
    json_response(@workout.track_its)
  end

  def show
    json_response(@track_it)
  end

  def create
    @workout.track_its.create!(track_it_params)
    json_response(@workout, :created)
  end

  def update
    @track_it.update(track_it_params)
    head :no_content
  end

  def destroy
    @track_it.destroy
    head :no_content
  end

  private

  def track_it_params
    params.permit(:date, :description, :minutes_recorded)
  end

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_workout_track_it
    @track_it = @workout.track_its.find_by!(id: params[:id]) if @workout
  end
end
