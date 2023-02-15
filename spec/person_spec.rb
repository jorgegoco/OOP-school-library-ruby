require_relative '../person'

describe Person do
  before(:each) do
    @person = Person.new(18, 'test_name', parent_permission: true)
  end
  context 'Unit testing in the Person class' do
    it 'test creating an instance' do
      expect(@person.age).to eql(18)
      expect(@person.name).to eql('test_name')
      expect(@person.parent_permission).to eql(true)
    end

    it 'test can_use_services method' do
      @person.age = 17
      @person.parent_permission = false
      expect(@person.can_use_services?).to be false
    end

    it 'test of_age method' do
      expect(@person.of_age?).to be true
    end

    it 'test add_rental method' do
      @person.add_rental('test_date1', Book.new('test_title1', 'test_author1'))
      @person.add_rental('test_date2', Book.new('test_title2', 'test_author2'))
      expect(@person.rentals.length).to eql 2
    end

    it 'test correct_name method' do
      expect(@person.correct_name).to eql(@person.name)
    end
  end
end
