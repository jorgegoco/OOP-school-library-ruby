require 'json'

module PreserveRentals
  def fetch_rentals
    rentals_array = []
    rentals_file = 'rentals.json'
    return rentals_array if !File.exist?(rentals_file) || File.read(rentals_file) == ''

    json_rentals = File.read('rentals.json')
    data_rentals = JSON.parse(json_rentals)
    class_rentals = data_rentals.map do |rental|
      Rental.new(rental['date'], data_person(rental['person']), data_book(rental['book']))
    end
    class_rentals.map { |rental| rentals_array.push(rental) }
    rentals_array
  end

  def store_rentals(rentals)
    rentals_array = []
    rentals.each do |rental|
      rentals_array.push({ date: rental.date, person: json_person(rental.person), book: json_book(rental.book) })
    end
    File.write('rentals.json', JSON.generate(rentals_array))
  end
end

def json_person(person)
  if person.instance_of?(Student)
    { age: person.age, name: person.name, parent_permission: person.parent_permission }
  else
    { specialization: person.specialization, age: person.age, name: person.name }
  end
end

def json_book(book)
  { title: book.title, author: book.author }
end

def data_person(person)
  if person.key?('specialization')
    Teacher.new(person['specialization'], person['age'], person['name'])
  else
    Student.new(nil, person['age'], person['name'], parent_permission: person['parent_permission'])
  end
end

def data_book(book)
  Book.new(book['title'], book['author'])
end
