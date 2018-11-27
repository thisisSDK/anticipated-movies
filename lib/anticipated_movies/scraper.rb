class AnticipatedMovies::Scraper

  def self.scrape_anticipated_movies_list
    html = open ("https://editorial.rottentomatoes.com/article/most-anticipated-2019-movies/")

    doc = Nokogiri::HTML(html)

    doc.css(".articleContentBody a").each do |movie_doc|
    binding.pry
      title = movie_doc.text
      movie = AnticipatedMovies::MovieDetails.new(title)
      movie.save

    end
    binding.pry

  end
end
