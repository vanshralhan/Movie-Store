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

     # @movies_view = Movie.select("movies.*, COUNT(*) AS group_count").joins(:views).joins("JOIN views rg on rg.movie_id = views.movie_id").group('movies.id').order('group_count DESC')
  end

  def destroy
  end


  def browse
    @movies = Movie.all

    @sorted = params[:view]

  #   if @sorted == "view"
  #     @sort = Movie.order('rating DESC')
  #   elsif @sorted == "rating"
  #     @sort = Movie.order('view_count DESC')
  #   end

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
