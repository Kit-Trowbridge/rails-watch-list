require 'faker'

puts 'Cleaning database...'
Movie.destroy_all

puts 'Creating movies...'
20.times do
  Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: Faker::LoremFlickr.image,
    rating: rand(1.0..10.0)
  )
end
puts 'Finished'
