require 'imdb'
require 'pry'#debuggear en pry#

array_txt=IO.readlines("movies.txt")

#creo un array con los puntajes redondeados
array_movie=array_txt.map do |movie|
		Imdb::Search.new(movie).movies[0].rating.round
end

class Movie
	attr_reader :title, :rating
	def initialize title, rating
		@title = title
		@rating = rating
	end
end

class Paint
	def self.start(movies)
		movies.each do |movie|
			puts "Movie: #{movie.title}. Rating: #{movie.rating}"
		end
	end
end

class MovieRating
	def initialize file
		@array_txt = IO.readlines(file)
		@movies = []
	end
	def search_movies 
		@movies = @array_txt.map do |movie|
			i = Imdb::Search.new(movie).movies[0]
			new_movie = Movie.new(i.title, i.rating)
		end
	end
	def paint
		Paint.start(@movies)
	end
end



movie_rating = MovieRating.new("movies.txt")
movie_rating.search_movies
movie_rating.paint


binding.pry

