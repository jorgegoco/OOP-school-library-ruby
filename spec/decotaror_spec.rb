require_relative '../decorator.rb'


describe Decorator do
  before(:each) do
      @dec = Decorator.new("hello")
  end
  it 'tets decorator creation' do
    expect(@dec.nameable).to eq("hello")
  end

end
