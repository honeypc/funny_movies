module Movies
  class SharesController < ApplicationController
    include Concerns::Movieable

    before_action :authenticate_user!

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)
      @movie.user = current_user
      set_sources_movie

      respond_to do |format|
        if @movie.save
          format.html { redirect_to root_url, notice: 'Video was successfully shared.' }
          format.json { render :show, status: :created, location: @movie }
        else
          format.html { render :new }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    end

    private

      def set_sources_movie
        return unless movie_params[:url].present?

        source = youtube(movie_params[:url]).first
        if source
          snippet = source["snippet"]
          @movie.name = snippet["title"]
          @movie.description = snippet["description"]
          @movie.sources = snippet.merge(source["statistics"])
        end
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def movie_params
        params.require(:movie).permit(:name, :description, :url, :thumbnail, :user_id)
      end
  end
end
