# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Cleaning database...'
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

puts 'Creating Movies...'

require 'open-uri'
response = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
result = JSON.parse(response)

pp result['results'][0]['vote_average'].class

result['results'].each do |movie|
  new_movie = Movie.create(title: "#{movie['original_title']}", overview: "#{movie['overview']}", poster_url: "#{movie['poster_path']}", rating: "#{movie['vote_average']}")

  new_list = List.create(
    name: Faker::Name.unique.name
  )

  Bookmark.create(
    movie: new_movie,
    list: new_list,
    comment: Faker::Quote
  )
end

puts 'Finished!'
