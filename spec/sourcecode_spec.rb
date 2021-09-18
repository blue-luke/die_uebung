require './lib/sourcecode.rb'

=begin
describe 'check_gender' do
  it 'returns "true" if check_gender function exists' do
    expect(main.respond_to?(:check_gender)).to eq true
  end
end
=end 

describe 'check_gender' do
  it 'returns "Well done!" when passed m' do
    expect(check_gender("m")).to eq 'Well done!'
  end
end