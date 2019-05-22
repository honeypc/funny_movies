class HomeController < ApplicationController
  def index
    @movies = Movie.includes(:user).paginate(page: params[:page])
  end
end
