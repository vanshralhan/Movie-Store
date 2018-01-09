class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.new(comment_params)
    @comment.movie_id = @movie.id
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Thanks!! Comment Added Successfully"
      redirect_to movie_path(@movie)
      Thread.new do
      UserMailer.comment_mail(@comment.user_id,@movie).deliver_now
      end
      ActiveRecord::Base.connection.close
    elsif @comment.body == ""
      flash[:alert] = "Comment can't be blank"
      redirect_to movie_path(params[:movie_id])
    else
    end
  end

  private
    def comment_params
        params.require(:comment).permit(:body)
    end


end
