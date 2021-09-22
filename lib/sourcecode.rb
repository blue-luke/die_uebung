
# Much later, could add a score functionality.
# Basic socre functionality could be session based, recording number of right answers, 
# but not which were answered correctly.
# Additional score functionality would like correct answers to the noun answered correctly, 
# perhaps storing this as a score in the text files
# Score could be number of times it was answered correctly
# or number of times answered correctly compared to number of times asked
# Additional functionality would choose the nouns that have the lowest score

# Have scores attached to each word
# Storing them in a text file is easy, just use .split(" ")
# Eg Ursprung f. 4 10
# This means 4/10
# Call text files username_scores.txt
# But getting this info into the sourcecode requires refactoring
# What is the best way to store the data?
# Need 3 bits of data
# Noun
# Gender
# Correct answers, eg 4
# Total times asked, eg 10
# Could change the array so it 
# @array_of_hashes = 
# [
#   :masculine = {"Mann" => [4,10]},
#   etc

# Next step is to figure out syntax for writing scores to the array
# Then how to save nouns and scores to a text file
# Then be able to select the file that is loaded, ie user-specific data


@count_questions = 0
@correct_answers = 0
@noun_to_test = nil
# @the_nouns_gender = nil

masculine = {"Mann" => ["masculine", 0, 0]}
feminine = {"Frau" => ["feminine", 0, 0]}
neutral = {"Kind" => ["neutral", 0, 0]}
plural = {"Leute" => ["plural", 0, 0]}

@array_of_hashes = 
[
  masculine,
  feminine,
  neutral,
  plural
]

def import_nouns
  file = File.open("german_nouns_neat.txt", "r")
  file.readlines.each do |line|
    noun_and_gender = line.split(" ")
    case noun_and_gender[1]
      when "m"
        @array_of_hashes[0][noun_and_gender[0]] = ["masculine", 0, 0]
      when "f"
        @array_of_hashes[1][noun_and_gender[0]] = ["feminine", 0, 0]
      when "n"
        @array_of_hashes[2][noun_and_gender[0]] = ["neutral", 0, 0]
      when "Pl"
        @array_of_hashes[3][noun_and_gender[0]] = ["plural", 0, 0]
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
  puts "There are #{@array_of_hashes[3].length} plural nouns in the database"
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
      the_nouns_gender = hash[@noun_to_test][0]
    end
  end

  the_nouns_gender

end

def check_answer(gender)
  map_answers =
  {
    "m" => "masculine",
    "f" => "feminine",
    "n" => "neutral",
    "p" => "plural"
  }
  puts "What is the gender of #{@noun_to_test}? Enter m, f, n, p"
  puts "You have got it right x out of y times so far"
  user_guess = gets.chomp
  count_questions
  if gender == map_answers[user_guess]
    puts "Well done!"
    count_correct_answers
    state_score
  else
    puts "Sorry, that's wrong! It is #{gender}"
    state_score
  end
  collect_stats(gender)
end

def collect_stats(gender)
  map_answers =
  {
    "m" => "masculine",
    "f" => "feminine",
    "n" => "neutral",
    "p" => "plural"
  }
  if gender == map_answers[user_guess]
    case gender
    when "m"
      @array_of_hashes[0][@noun_to_test][1] += 1
      @array_of_hashes[0][@noun_to_test][2] += 1
    when "f"
      @array_of_hashes[1][@noun_to_test][1] += 1
      @array_of_hashes[1][@noun_to_test][2] += 1
    when "n"
      @array_of_hashes[2][@noun_to_test][1] += 1
      @array_of_hashes[2][@noun_to_test][2] += 1
    when "Pl"
      @array_of_hashes[3][@noun_to_test][1] += 1
      @array_of_hashes[3][@noun_to_test][2] += 1
    end
  else
    case gender
    when "m"
      @array_of_hashes[0][@noun_to_test][2] += 1
    when "f"
      @array_of_hashes[1][@noun_to_test][2] += 1
    when "n"
      @array_of_hashes[2][@noun_to_test][2] += 1
    when "Pl"
      @array_of_hashes[3][@noun_to_test][2] += 1
    end
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