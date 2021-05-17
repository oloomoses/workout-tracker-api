class HomeController < ApplicationController
  skip_before_action :authorize_request, only: :index
  def index
    render json: 'Welcome to Workout Tracker API Home'
  end
end
