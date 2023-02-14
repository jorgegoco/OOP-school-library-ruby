require_relative './app'
require_relative './preserve_books'
require_relative './preserve_people'
require_relative './preserve_rentals'

class Menu
  include PreserveBooks
  include PreservePeople
  include PreserveRentals

  def initialize
    @app = App.new
  end

  def text_menu
    puts "
        Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit"
  end

  def main_menu
    loop do
      text_menu
      id = gets.chomp.to_i
      case id
      when 1
        @app.list_all_books
      when 2
        @app.list_all_people
      when 3
        @app.create_person
      when 4
        @app.create_book
      when 5
        @app.create_rental
      when 6
        @app.show_rental_by_id
      else
        exit_app
      end
    end
  end

  private

  def exit_app
    store_books(@app.books)
    store_people(@app.people)
    store_rentals(@app.rentals)
    exit
  end
end

def main
  puts 'Welcome to School library App!'
  menu = Menu.new
  menu.main_menu
end

main
