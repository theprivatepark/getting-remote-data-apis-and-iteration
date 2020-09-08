def welcome
  # puts out a welcome message here!
end

def get_character_from_user
  puts "please enter a character name"
  user_input = gets.chomp
  films = get_character_movies_from_api(user_input)
  print_movies(films)
  # use gets to capture the user's input. This method should return that input, downcased.
end
