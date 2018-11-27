class AnticipatedMovies::CLI

  def start
    puts "Welcome to Rotten Tomatoes"
    puts "Here are the most anticipated movies of 2019:"

    AnticipatedMovies::Scraper.scrape_anticipated_movies_list
    display_movies
    menu
  end

  def menu
    puts "Tell me how you'd like to proceed:"
    puts "(e)xit | (l)ist | (s)elect a movie"

    input = gets.chomp
    case input
    when 's'
      select_movie
    end
  end

  def display_movies
    movies = AnticipatedMovies::MovieDetails.all

    movies.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.title}"
    end
  end

  def select_movie
    puts "Select the movie you would like to view"
    input = gets.chomp.to_i

    movie = AnticipatedMovies::MovieDetails.all[input - 1]
    if !movie.synopsis
      AnticipatedMovies::Scraper.scrape_movie(movie)
      #binding.pry

      display_movie_details(movie)
    else
      display_movie_details(movie)
    end
  end

  def display_movie_details(movie)
    details = AnticipatedMovies::Scraper.movie_synopsis
  end
end
