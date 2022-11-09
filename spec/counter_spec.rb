require "counter"

RSpec.describe Counter do
  it "Add a number to the count variable" do
    counter = Counter.new
    counter.add(1)
    result = counter.report
    expect(result).to eq "Counted to 1 so far."
  end
end
