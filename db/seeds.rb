# require 'faker'

# puts 'Cleaning database...'
# Movie.destroy_all

# puts 'Creating movies...'
# 20.times do
#   Movie.create(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     poster_url: Faker::LoremFlickr.image,
#     rating: rand(1.0..10.0)
#   )
# end
# puts 'Finished'

require 'json'
require 'open-uri'

# tested in rails console

url = 'https://tmdb.lewagon.com/movie/top_rated'
top_films_serialized = URI.parse(url).read
top_films = JSON.parse(top_films_serialized)['results']

# puts 'Cleaning database...'
# Movie.destroy_all
top_films.each do |film|
  Movie.create(
    title: film['title'],
    overview: film['overview'],
    poster_url: "http://image.tmdb.org/t/p/original#{film['poster_path']}",
    rating: film['vote_average']
  )
end
