masculine_nouns = {"Mann" => :der}
feminine_nouns = {"Frau" => :die}
neutral_nouns = {"Kind" => :das}
plural_nouns = {"Leute" => :die}

@array_of_hashes = 
  [
    masculine_nouns,
    feminine_nouns,
    neutral_nouns,
    plural_nouns
  ]

@random_noun = ""

def return_noun_gender
  the_nouns_gender = ""
  @array_of_hashes.each do |hash|
    if hash.keys.include?(@random_noun)
      the_nouns_gender = hash[@random_noun]
    end
  end
  the_nouns_gender
end