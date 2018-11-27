class AnticipatedMovies::Scraper

  def self.scrape_anticipated_movies_list
    html = open ("https://editorial.rottentomatoes.com/article/most-anticipated-2019-movies/")

    doc = Nokogiri::HTML(html)

    doc.css(".articleContentBody a").each do |movie_doc|
      #binding.pry
      #title = movie_doc.text
      title = movie_doc.css("a").text #tried this when attempting to pull URL
      url = movie_doc.css("a").css("href").text
      #movie = AnticipatedMovies::MovieDetails.new(title)
      movie = AnticipatedMovies::MovieDetails.new(title, url) #comment back in and delete previous line when pulling the URL

      movie.save
      #binding.pry

    end

  end
end
