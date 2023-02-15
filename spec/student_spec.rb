require_relative '../student'
require_relative '../classroom'

describe Student do
  before(:each) do
    @student = Student.new(nil, 17, 'test_name', parent_permission: false)
  end
  context 'Unit testing in the Student class' do
    it 'test creating an instance' do
      expect(@student.age).to be < 18
      expect(@student.name).to eq 'test_name'
      expect(@student.parent_permission).to be false
      expect(@student.id).to be_between(1, 1000)
    end

    it 'test play_hooky method' do
      expect(@student.play_hooky).to eq '¯\(ツ)/¯'
    end
    it 'tets classroom method' do
      expect(@student.classroom).to be_nil
    end
  end
end
