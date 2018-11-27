class AnticipatedMovies::Scraper

  def self.scrape_anticipated_movies_list
    html = open ("https://editorial.rottentomatoes.com/article/most-anticipated-2019-movies/")

    doc = Nokogiri::HTML(html)
    doc.css("strong a").each do |movie_doc|
      #title = movie_doc.text
      title = movie_doc.text #tried this when attempting to pull URL
      url = movie_doc.attribute("href").value #pulls value when binding.pry is commented in on line 10.
      #movie = AnticipatedMovies::MovieDetails.new(title)
      movie = AnticipatedMovies::MovieDetails.new(title, url) #comment back in and delete previous line when pulling the URL

      movie.save
    end
    #binding.pry
  end
end
