require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)

  results = response_hash["results"] 
  films = []
  correct_hash = results.select do |character|
    character["name"] == character_name
    films = character["films"]
  end
  films.map do |film_url|
    user_response_string = RestClient.get(film_url)
    user_response_hash = JSON.parse(user_response_string)
  end

end
  # ********iterate over the response hash to find the collection of `films` for the given
  #   *********`character`
  # *********collect those film API urls, make a web request to each URL to get the info
  #  ***********for that film
  # **********return value of this method should be a collection of info about each film.
  #  **********i.e. an array of hashes in which each hash reps a given film
  # ***********this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each_with_index {|film, index| puts "#{index+1}:#{film["title"]}"}
  binding.pry
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

