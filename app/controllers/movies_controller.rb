class MoviesController < ApplicationController
  before_action :set_link, except:[:index, :new, :create]
  # before_action :layout_change, only: [:new]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @all = Movie.all
    render :layout => "new_layout"

  end

  def create
    @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to @movie, notice: "Your Movie Saved Successfully"
        # redirect_to movie_path(@movie.title), notice: "Your Movie Saved Successfully"
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
      params.require(:movie).permit(:title, :genre, :plot, :image, :rating, :web, :year)
    end

    def set_link
      @movie = Movie.find(params[:id])
      # @movie = Movie.find_by(title: params[:id])
    end
end
