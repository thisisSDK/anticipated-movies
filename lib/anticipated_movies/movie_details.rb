class AnticipatedMovies::MovieDetails
  attr_accessor :title, :url

  @@all = []

  #def initialize(title)
  def initialize(title, url) #comment back in and delete previous line when pulling URL
    @title = title
    @url = url # comment back in when pulling the URL
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end
end
