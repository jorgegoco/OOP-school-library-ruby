require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './preserve_books'
require_relative './preserve_people'
require_relative './preseve_rentals.rb'


class App
  include PreserveBooks
  include PreservePeople
  include PreserveRentals

  attr_accessor :books, :people, :rentals

  def initialize
    @people = fetch_people
    @books = fetch_books
    @rentals = fetch_rentals
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
    input = input_age_and_name
    puts 'Has parent permission? [Y/N]:'
    case gets.chomp.capitalize
    when 'Y'
      permission = true
    when 'N'
      permission = false
    else
      puts 'Invalid Input'
    end
    @people.push(Student.new(nil, input[0], input[1], parent_permission: permission))
    puts 'Person created successfully'
  end

  def create_teacher
    input = input_age_and_name
    puts 'Specialization:'
    specialization = gets.chomp.to_s
    @people.push(Teacher.new(specialization, input[0], input[1]))
    puts 'Person created successfully'
  end

  def index_out_of_bounds?(idx, array)
    idx >= array.length || idx.negative?
  end

  def input_age_and_name
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    [age, name]
  end
end
