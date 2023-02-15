require_relative '../decorator'
require_relative '../nameable'

describe Decorator do
  before(:each) do
    @nam = Nameable.new
    @dec = Decorator.new(@nam)
  end
  it 'tests decorator creation' do
    expect(@dec).to be_an_instance_of(Decorator)
  end
  it 'tests decorator method' do
    expect do
      @dec.correct_name
    end.to raise_error(NotImplementedError, "Nameable has not implemented method 'correct_name'")
  end
end
