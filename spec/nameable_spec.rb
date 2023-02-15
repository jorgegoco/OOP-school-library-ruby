require_relative '../nameable'

describe Nameable do
  before(:each) do
    @nam = Nameable.new
  end
  it 'tests creation of an instance from Neamable' do
    expect(@nam).to be_an_instance_of(Nameable)
  end
  it 'tests Neamble method' do
    expect do
      subject.correct_name
    end.to raise_error(NotImplementedError, "Nameable has not implemented method 'correct_name'")
  end
end
