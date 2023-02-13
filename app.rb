require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'Empty list!'
    else
      @books.map { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'Empty list!'
    else
      @people.map do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    id = gets.chomp.to_i
    case id
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Input'
    end
  end

  def create_book
    puts 'Title:'
    title = gets.chomp.to_s
    puts 'Author:'
    author = gets.chomp.to_s
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty?
      puts 'Empty list of books!'
    elsif @people.empty?
      puts 'Empty list of people!'
    else
      puts 'Select a book from the following list by number'
      @books.map.with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
      book_idx = gets.chomp.to_i
      return puts 'Invalid Input' if index_out_of_bounds?(book_idx, @books)

      puts 'Select a person from the following lists by number (not id)'
      @people.map.with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_idx = gets.chomp.to_i
      return puts 'Invalid Input' if index_out_of_bounds?(person_idx, @people)

      print 'Date: '
      date = gets.chomp.to_s

      @rentals.push(Rental.new(date, @people[person_idx], @books[book_idx]))
      puts 'Rental created successfully'
    end
  end

  def show_rental_by_id
    if @rentals.empty?
      puts 'Empty list of rentals!'
    else
      print 'ID of person: '
      id = gets.chomp.to_i
      rentals = @rentals.select { |rental| rental.person.id == id }
      puts 'Rentals: '
      rentals.map { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}." }
    end
  end

  private

  def create_student
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Has parent permission? [Y/N]:'
    case gets.chomp.capitalize
    when 'Y'
      @people.push(Student.new(nil, age, name, parent_permission: true))
      puts 'Person created successfully'
    when 'N'
      @people.push(Student.new(nil, age, name, parent_permission: false))
      puts 'Person created successfully'
    else
      puts 'Invalid Input'
    end
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Specialization:'
    specialization = gets.chomp.to_s
    @people.push(Teacher.new(specialization, age, name))
    puts 'Person created successfully'
  end

  def index_out_of_bounds?(idx, array)
    idx >= array.length || idx.negative?
  end
end
