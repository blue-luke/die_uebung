require './lib/sourcecode.rb'

describe "get_a_noun" do
  it "returns a noun when passed 'yes'" do
    expect(get_a_noun("y")).to be_kind_of(String)
  end
end
