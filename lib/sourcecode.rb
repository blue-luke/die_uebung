=begin
Basic code is working
Next step is add some more nouns
Also want to automate the nouns
By creating a text file, loading it automatically and populating the array of hashes
Then I want to automate putting the nouns in the textfiles
=end

@noun_to_test = nil
@the_nouns_gender = nil
@array_of_hashes = 
[
  masculine_nouns = {"Mann" => :der},
  feminine_nouns = {"Frau" => :die},
  neutral_nouns = {"Kind" => :das},
  plural_nouns = {"Leute" => :die}
]

def get_a_response
  puts "Would you like a noun?"
  response = gets.chomp
  if response == "n"
    exit
  end
  response
end

def get_a_noun(response)

  if response == "y"
    hash = @array_of_hashes.sample
    @noun_to_test = hash.keys.sample
  end

end

def get_nouns_gender

  @array_of_hashes.each do |hash|
    if hash.keys.include?(@noun_to_test)
      the_nouns_gender = hash[@noun_to_test]
    end
  end

  the_nouns_gender

end

def check_answer(the_nouns_gender)
  puts "What is the gender of #{@noun_to_test}? Enter m, f, n, p"
  user_guess = gets.chomp
  map_answers =
  {
    "m" => :der,
    "f" => :die,
    "n" => :das,
    "p" => :die
  }
  if the_nouns_gender = map_answers[user_guess]
    puts "Well done!"
  else
    checkanswer(the_nouns_gender)
  end
end

def start
  loop do
    get_a_noun(get_a_response)
    get_nouns_gender
    check_answer(get_nouns_gender)
  end
end

start