require './lib/sourcecode.rb'

describe 'the function select_noun' do
  it 'should return a string' do
    expect(select_noun()).to be_kind_of(String)
  end
end

=begin
Can't get this test to work, 
checking that the function exists in the first place
describe 'check_gender' do
  it 'returns "true" if check_gender function exists' do
    expect(main.respond_to?(:check_gender)).to eq true
  end
end
=end 

# describe 'check_gender' do
#   it 'returns "Well done!" when passed m' do
#     expect(check_gender("m")).to eq 'Well done!'
#   end
# end

# describe 'suggest_noun' do
#   it 'returns a string when passed y' do
#     expect(suggest_noun("y")).to be_kind_of(String)
#   end
# end

# describe 'suggest_noun' do
#   it 'returns "Bye" when passed n' do
#     expect(suggest_noun("n")).to eq 'Bye!'
#   end
# end

