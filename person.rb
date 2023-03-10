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

  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id, :classroom

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    @rentals.push(Rental.new(date, book, self))
  end

  # private

  def of_age?
    @age >= 18
  end
end
