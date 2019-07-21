module Movies
  class CommentsController < ApplicationController

    before_action :load_movie
    
    def new
      @comment = Comment.new(user_id: current_user.id)
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        respond_to do |format|
          format.html { redirect_to movie_path(@movie), notice: 'Comment was successfully added.' }
          format.js
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.js
        end
      end
    end

    private

    def load_movie
      @movie = Movie.find(comment_params[:movie_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :movie_id, :user_id)
    end
  end
end
