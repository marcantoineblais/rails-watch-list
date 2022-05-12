require 'open-uri'
require 'json'

Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'

# Populates Movie DB with top rated movie from API
doc = JSON.parse(URI.open(url).read)
doc['results'].each do |m|
  Movie.create(title: m['title'], overview: m['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{m['poster_path']}", rating: m['vote_average'])
end
