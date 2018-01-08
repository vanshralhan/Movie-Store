class ApiCall
  def api_call(title)
    @title = title.split(' ').join('_')
    key = URI("http://www.omdbapi.com/?t=#{@title}&apikey=ef041583")
    a = Net::HTTP.get(key)
    b = JSON.parse(a)
    if b["Response"] == "True"
      title = b["Title"]
      year = b["Year"]
      genre  = b["Genre"].split(',').first
      plot = b["Plot"]
      image = b["Poster"]
      cast = b["Actors"]
      web = b["Website"]
      rating = b["imdbRating"]

      return create_movie(title, year, genre, plot, image, cast, web, rating)
    else
      return false
    end
  end

  private
    def create_movie(title, year, genre, plot, image, cast, web, rating)
      @m = Movie.new
      @m.title = title
      @m.year = year
      @m.genre = genre
      @m.plot = plot
      @m.remote_image_url = image
      @m.cast = cast
      @m.web = web
      @m.rating = rating
      if @m.save
        return true
      else
        return false
      end
    end
end
