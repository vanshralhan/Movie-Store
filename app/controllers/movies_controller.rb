class MoviesController < ApplicationController
  before_action :set_link, except:[:index, :new, :create]
  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to @movie, notice: "Your Movie Saved Successfully"
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
    def movie_params
      params.require(:movie).permit(:title, :genre, :plot, :image, :rating, :web)
    end

    def set_link
      @movie = Movie.find(params[:id])
    end
end
