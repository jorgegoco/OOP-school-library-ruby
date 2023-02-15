require_relative '../book'

describe Book do
  context 'Unit testing in the Book class' do
    it 'test creating an instance' do
      book = Book.new('test_title', 'test_author')
      expect(book.title).to eq 'test_title'
      expect(book.author).to eq 'test_author'
      expect(book.rentals).to eq []
    end
  end 
end