class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:id])
      if @movie.save
        redirect_to @article, notice: "Your Movie Saved Successfully"
      else
        render 'new'
      end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def movies_params

    end

end
