class HomeController < ApplicationController
  def index
    @moviese = Movie.all
  end
end
