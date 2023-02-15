require_relative '../rental.rb'

describe Rental do
  before(:each) do
    @person = Person.new(23, 'adds')
    @book = Book.new('test_title', 'test_author')
    @rent = Rental.new('2/2/2022', @person, @book)
  end
  it "tests the class Rental" do
    expect(@rent.book).to eq(@book)
    expect(@rent.date).to eq('2/2/2022')
    expect(@rent.person).to eq(@person)
  end
end
