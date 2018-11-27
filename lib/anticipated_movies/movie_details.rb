class AnticipatedMovies::MovieDetails
  attr_accessor :title

  @@all = []

  def initialize(title, url)
    @title = title
    @url = url
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end
end
