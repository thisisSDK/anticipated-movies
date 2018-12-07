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

    if input != "e"; "l"; "s"; "n"
      puts "Invalid input. Please try again."
      # start #### -- creates a loop don't do this
      menu
    elsif input == "e"

    # elsif input == "n"

    else
      display_movies
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
    #binding.pry
    # error: used this is not the place for class methods. --> details = AnticipatedMovies::Scraper.movie_synopsis
    puts movie.synopsis
    puts movie.rating
    puts movie.genre
    puts "Would you like to view another movie?"
    puts "(y)es | (n)o"
    input = gets.chomp
    if input == "y"
      display_movies
    else input == "n"

    end
  end
end

 ##stuck on final logic - need to display movie details from scraper.rb - the URL is working. Logic is wrong.
