class AnticipatedMovies::CLI

  def start
    puts "Welcome to Rotten Tomatoes"
    puts "Here are the most anticipated movies of 2019:"

    AnticipatedMovies::Scraper.scrape_anticipated_movies_list
  end

end
