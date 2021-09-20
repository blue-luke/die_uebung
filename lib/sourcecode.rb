=begin
Basic code is working
Next step is add some more nouns
Also want to automate the nouns
By creating a text file, loading it automatically and populating the array of hashes
Then I want to automate putting the nouns in the textfiles

Create 4 textfiles, one for each gender
Have a set of functions that take 2 files, a list of new nouns and the existing list
It iterates and only adds a noun to the existing list if it doesn't already exisst
Adds the noun in csv format?
Then add a function to load the text files as hashes then the hashes to the master array

Much later, could add a score functionality.
Basic socre functionality could be session based, recording number of right answers, 
but not which were answered correctly.
Additional score functionality would like correct answers to the noun answered correctly, 
perhaps storing this as a score in the text files
Score could be number of times it was answered correctly
or number of times answered correctly compared to number of times asked
Additional functionality would choose the nouns that have the lowest score

File for neat data is /Users/lukeb/Projects/die_uebung/lib

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

def import_nouns
  file = File.open("german_nouns_neat.txt", "r")
  file.readlines.each do |line|
    noun_and_gender = line.split(" ")
    case noun_and_gender[1]
      when "m"
        @array_of_hashes[0][noun_and_gender[0]] = :der
      when "f"
        @array_of_hashes[1][noun_and_gender[0]] = :die
      when "n"
        @array_of_hashes[2][noun_and_gender[0]] = :das
      when "Pl"
        @array_of_hashes[3][noun_and_gender[0]] = :die
    end
  end
  file.close
  @array_of_hashes.each do |x|
    puts x.count
  end

end

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
      @the_nouns_gender = hash[@noun_to_test]
    end
  end

  @the_nouns_gender

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
    "Sorry, that's wrong!"
    checkanswer(the_nouns_gender)
  end
end

def start
  import_nouns
  loop do
    get_a_noun(get_a_response)
    get_nouns_gender
    check_answer(get_nouns_gender)
  end
end

start