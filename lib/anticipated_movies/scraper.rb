class AnticipatedMovies::Scraper

  def self.scrape_anticipated_movies_list
    html = open ("https://editorial.rottentomatoes.com/article/most-anticipated-2019-movies/")

    doc = Nokogiri::HTML(html)

    doc.css(".articleContentBody").each do |movie_doc|

      title = movie_doc.css("a").text
      url = movie_doc.css("a").attr("href").value
      movie = AnticipatedMovies::MovieDetails.new(title, url)
      movie.save

    end
    #binding.pry

  end
end
