require_relative '../classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Physics')
    @s1 = Student.new(nil, 17, 'test_name', parent_permission: false)
    @student = @classroom.add_student(@s1)
  end
  it 'tests classroom class creation' do
    expect(@classroom.label).to eq('Physics')
  end
  it 'test classroom class method' do
    expect(@classroom.add_student(@s1)).to eq(@student)
  end
end
