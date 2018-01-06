class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:browse,:show]
  before_action :set_link, except: [:index, :new, :create, :show,:browse]
  before_action :authenticate_admin_user!,only: [:create]

  # before_action :layout_change, only: [:new]



  def index
    @movie = Movie.all
  end

  def new
    # @movie = Movie.new
    # @all = Movie.all
    # render layout: "new_layout"
  end

  def create
    if params[:view] == "automatic"
      @m = ApiCall.new.api_call(params[:movie][:title])
        if @m == true
          redirect_to 'http://moviedetail.herokuapp.com/admin/movies', notice: "Movie Saved Successfully"
        else
          redirect_to new_admin_movie_path(view: params[:view]), alert: "Movie Not Found."
        end
    else
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to 'http://moviedetail.herokuapp.com/admin/movies', notice: "Your Movie Saved Successfully"
        # redirect_to movie_path(@movie.title), notice: "Your Movie Saved Successfully"
      else
        redirect_to new_admin_movie_path
      end
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
     render layout: "show_layout"
   end

  def destroy
  end


  def browse
      @movie = Movie.all
      @sorted = params[:view]

      # @moviesearch = Movie.all.search(params[:search])
      search = params[:search]
      @a = Movie.search(params[:search])
      if(search)
          if @a.count == @movie.count
            flash[:alert]="Enter Something To Search!!"
            @movies_rating = Movie.all.order('rating DESC')
            @movies_view = Movie.all.order('view_count DESC')
          elsif @a.empty?
            flash[:alert]="There are No Movies Matching Your Search!!"
            @movies_rating = Movie.all.order('rating DESC')
            @movies_view = Movie.all.order('view_count DESC')
          else
            flash[:alert]="Movie Matching Your Search!!"
            @movies_rating = Movie.search(params[:search]).order('rating DESC')
            @movies_view = Movie.search(params[:search]).order('view_count DESC')
          end
      else
        @movies_rating = Movie.all.order('rating DESC')
        @movies_view = Movie.all.order('view_count DESC')
      end
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
