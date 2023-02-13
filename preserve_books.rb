require 'json'

module PreserveBooks
  def fetch_books
    books_array = []
    books_file = 'books.json'
    return books_array if !File.exist?(books_file) || File.read(books_file) == ''

    json_books = File.read('books.json')
    data_books = JSON.parse(json_books)
    class_books = data_books.map { |book| Book.new(book['title'], book['author']) }
    class_books.map { |book| books_array.push(book) }
    books_array
  end

  def store_books(books)
    books_array = []
    books.each { |book| books_array.push({ title: book.title, author: book.author }) }
    File.write('books.json', JSON.generate(books_array))
  end
end
