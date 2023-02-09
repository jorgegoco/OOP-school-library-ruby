require_relative './student'
require_relative './teacher'
require_relative './book'

class App
  def initialize
    @people = []
    @books = []
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

    when 2
      puts 'Specialization:'
      specialization = gets.chomp.to_s
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.chomp.to_s
      @people.push(Teacher.new(specialization, age, name))
      puts 'Person created successfully'
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
end