class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name
  attr_accessor : age
  attr_reader :id

  def is_of_age?
    if @age >= 18
  end

  private : is_of_age?

  def can_use_services?
    if is_of_age || parent_permission
  end

end