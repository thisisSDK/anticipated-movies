class AnticipatedMovies::Scraper

  def self.scrape_anticipated_movies_list
    html = open ("https://editorial.rottentomatoes.com/article/most-anticipated-2019-movies/")

    doc = Nokogiri::HTML(html)
    doc.css("strong a").each do |movie_doc|
      #title = movie_doc.text
      title = movie_doc.text #tried this when attempting to pull URL
      url = movie_doc.attribute("href").value #pulls value when binding.pry is commented in above.
      #movie = AnticipatedMovies::MovieDetails.new(title)
      movie = AnticipatedMovies::MovieDetails.new(title, url) #comment back in and delete previous line when pulling the URL
      ##problem: calling AnticipatedMovies::MovieDetails with binding.pry at :16 gives an error. URL only shown when individually called and binding.pry is  above.
      movie.save
    end
    #binding.pry

    def self.scrape_movie(movie)
      html = open (movie.url)

      doc = Nokogiri::HTML(html)
      #binding.pry
      movie.synopsis = doc.css(".movie_synopsis").text
      # movie.rating = doc.css(".meta-value")[0].text
      # movie.genre = doc.css(".meta-value")[1].text
      # movie.director = doc.css(".meta-value")[2].text
    end
  end
end
