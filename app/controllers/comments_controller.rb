class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new(comment_params)
    @comment.movie_id = @movie.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to movie_path(@movie)
    else
    end
  end

  private
    def comment_params
        params.require(:comment).permit(:body)
    end


end
