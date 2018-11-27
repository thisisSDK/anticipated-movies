class AnticipatedMovies::MovieDetails
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end
end
