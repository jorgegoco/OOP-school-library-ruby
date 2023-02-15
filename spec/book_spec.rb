require_relative '../book'
require_relative '../person'

describe Book do
  context 'Unit testing in the Book class' do
    it 'test creating an instance' do
      book = Book.new('test_title', 'test_author')
      expect(book.title).to eq 'test_title'
      expect(book.author).to eq 'test_author'
      expect(book.rentals).to eq []
    end

    it 'test add_rental method' do
      book = Book.new('test_title', 'test_author')
      book.add_rental('test_date1', Person.new(18, 'test_name1', parent_permission: true))
      book.add_rental('test_date2', Person.new(17, 'test_name2', parent_permission: false))
      expect(book.rentals.length).to eq 2
    end
  end
end
