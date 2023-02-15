require_relative '../teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new('test_specialization', 45)
  end
  context 'Unit testing in the Teacher class' do
    it 'test creating an instance' do
      expect(@teacher.specialization).to eql('test_specialization')
      expect(@teacher.age).to be > 18
      expect(@teacher.name).to eql('Unknown')
      expect(@teacher.parent_permission).to be true
      expect(@teacher.id).to be_between(1, 1000)
    end

    it 'test can_use_services method' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
