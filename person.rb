require_relative('./nameable')
require_relative('./capitalize_decorator')
require_relative('./trimmer_decorator')
require_relative('./rental')
require_relative('./book')

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age
  attr_reader :id, :rentals

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
