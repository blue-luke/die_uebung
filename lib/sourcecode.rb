# Specification
# Gives user a German noun
# Asks user for input
# Input is m, w, n, p, or stop to exit
# Maennlich, weblich, neutral, plural
# Check whether noun matches the user-guessed gender
# Display well done if correct
# Display sorry, and the correct gender, if incorrect
# Loops until user exits

=begin
Code is sort of working
Ended up creating a bunch of instance vairables
But there must be away to do it without instance variables
There is - pass functions as arguments
this makes their return value available to other functions
return to this
=end

def select_noun

  masculine_nouns = {"Mann" => :der}
  feminine_nouns = {"Frau" => :die}
  neutral_nouns = {"Kind" => :das}
  plural_nouns = {"Leute" => :die}

  array_of_hashes = 
    [
      masculine_nouns,
      feminine_nouns,
      neutral_nouns,
      plural_nouns
    ]

  random_hash = array_of_hashes.sample
  @random_noun = random_hash.keys.sample
  @the_nouns_gender = random_hash[@random_noun]
  @random_noun

end

def present_noun
  puts "What is the gender of #{@random_noun}?"
end

def get_gender
  puts "Enter m, w, n or p"
  @answer = gets.chomp
end

def check_gender
  convert_gender_names = 
  {
    "m" => "der",
    "w" => "die",
    "n" => "das",
    "p" => "die"
  }
  if convert_gender_names[@answer].to_sym == @the_nouns_gender
    "Well done!"
  else
    puts "Sorry, that's wrong! The noun's gender is #{@the_nouns_gender}"
  end
end

def suggest_noun
  puts "Would you like a noun? y/n"
  response = gets.chomp
  if response == "y"
    select_noun
    present_noun
    get_gender
    check_gender
    suggest_noun
  elsif response == "n"
    "Bye!"
    exit
  end
end

suggest_noun