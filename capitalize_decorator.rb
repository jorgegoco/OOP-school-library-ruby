require_relative('./decorator')

class Capitalize_Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end