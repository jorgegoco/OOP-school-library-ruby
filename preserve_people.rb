require 'json'

module PreservePeople
  def fetch_people
    people_array = []
    people_file = 'people.json'
    return people_array if !File.exist?(people_file) || File.read(people_file) == ''

    json_people = File.read('people.json')
    data_people = JSON.parse(json_people)
    class_people = data_people.map do |person|
      if person.key?('specialization')
        Teacher.new(person['specialization'], person['age'], person['name'])
      else
        Student.new(nil, person['age'], person['name'], parent_permission: person['parent_permission'])
      end
    end
    class_people.map { |person| people_array.push(person) }
    people_array
  end

  def store_people(people)
    people_array = []
    people.each do |person|
      if person.class.instance_of?(Student)
        people_array.push({ age: person.age, name: person.name, parent_permission: person.parent_permission })
      else
        people_array.push({ specialization: person.specialization, age: person.age, name: person.name })
      end
    end
    File.write('people.json', JSON.generate(people_array))
  end
end
