# =begin
# Basic code is working
# Next step is add some more nouns
# Also want to automate the nouns
# By creating a text file, loading it automatically and populating the array of hashes
# Then I want to automate putting the nouns in the textfiles

# Create 4 textfiles, one for each gender
# Have a set of functions that take 2 files, a list of new nouns and the existing list
# It iterates and only adds a noun to the existing list if it doesn't already exisst
# Adds the noun in csv format?
# Then add a function to load the text files as hashes then the hashes to the master array

# Much later, could add a score functionality.
# Basic socre functionality could be session based, recording number of right answers, 
# but not which were answered correctly.
# Additional score functionality would like correct answers to the noun answered correctly, 
# perhaps storing this as a score in the text files
# Score could be number of times it was answered correctly
# or number of times answered correctly compared to number of times asked
# Additional functionality would choose the nouns that have the lowest score

# Currently returning correct even when my answer is wrong. Problem is on line 102, run the code and you'll see the inconsistent return values. Should be a small step to take next though
# go into irb, then execute require './sourcecode.rb' to interact with the functions as if you were an object in ruby
# =end

@count_questions = 0
@correct_answers = 0
@noun_to_test = nil
# @the_nouns_gender = nil
@array_of_hashes = 
[
  masculine_nouns = {"Mann" => :masculine},
  feminine_nouns = {"Frau" => :feminine},
  neutral_nouns = {"Kind" => :neutral},
  plural_nouns = {"Leute" => :plural}
]

def import_nouns
  file = File.open("german_nouns_neat.txt", "r")
  file.readlines.each do |line|
    noun_and_gender = line.split(" ")
    case noun_and_gender[1]
      when "m"
        @array_of_hashes[0][noun_and_gender[0]] = :masculine
      when "f"
        @array_of_hashes[1][noun_and_gender[0]] = :feminine
      when "n"
        @array_of_hashes[2][noun_and_gender[0]] = :neutral
      when "Pl"
        @array_of_hashes[3][noun_and_gender[0]] = :plural
    end
  end
  file.close
  number_of_nouns
end

def number_of_nouns
  sum = 0
  @array_of_hashes.each do |x|
    sum += x.count
  end
  puts "There are #{sum} nouns in the database"
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
  the_nouns_gender = nil
  @array_of_hashes.each do |hash|
    if hash.keys.include?(@noun_to_test)
      the_nouns_gender = hash[@noun_to_test]
    end
  end

  the_nouns_gender

end

def check_answer(gender)
  map_answers =
  {
    "m" => :masculine,
    "f" => :feminine,
    "n" => :neutral,
    "p" => :plural
  }
  puts "What is the gender of #{@noun_to_test}? Enter m, f, n, p"
  user_guess = gets.chomp
  count_questions
  # puts "Your guess is #{user_guess}, which corresponds to #{map_answers[user_guess]}"
  # puts "The nouns gender is #{gender}"
  # puts gender
  # puts "The map of answers says that the gender should be #{map_answers[user_guess]}"
  if gender == map_answers[user_guess]
    puts "Well done!"
    count_correct_answers
    state_score
  else
    puts "Sorry, that's wrong! It is #{gender}"
    state_score
  end
end

def count_questions
  @count_questions += 1
end

def count_correct_answers
  @correct_answers += 1
end

def state_score
  puts "Your score is #{@correct_answers} out of #{@count_questions}"
end

def start
  import_nouns
  loop do
    get_a_noun(get_a_response)
    check_answer(get_nouns_gender)
  end
end

start