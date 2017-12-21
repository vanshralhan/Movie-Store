class MoviesController < ApplicationController
  before_action :set_link, except:[:index, :new, :create, :show,:browse]
  # before_action :layout_change, only: [:new]
  def index
    @movies = Movie.all

  end

  def new
    @movie = Movie.new
    @all = Movie.all
    render layout: "new_layout"
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
    @movie = Movie.find(params[:id])
    # @movie.increment!(:count, by = 1)
    View.create(movie_id: @movie.id)
    @genre = Movie.where(genre: @movie.genre).order('rating Desc')

     # @movies_view = Movie.select("movies.*, COUNT(*) AS group_count").joins(:views).joins("JOIN views rg on rg.movie_id = views.movie_id").group('movies.id').order('group_count DESC')
   end

  def destroy
  end


  def browse
      if params[:search]
        @movie = Movie.search(params[:search]).order("created_at DESC")
      else
          redirect_to movies_path
      end

      @sorted = params[:view]
      @movies_rating = Movie.order('rating DESC')
      @movies_view = Movie.order('view_count DESC')
  end

  def search

  end

  private
    def movie_params
      params.require(:movie).permit(:title, :genre, :plot, :image, :rating, :web, :year)
    end

    def set_link
      @movie = Movie.find(params[:id])
      # @movie = Movie.find_by(title: params[:id])
    end

    def counter_check(movie)
        movie.increment!(:count, by = 1)
        # movie.save
    end
end
