require "greet"

RSpec.describe "greet method" do
  it "concatenates Anthony to Hello!" do
    result = greet("Anthony")
    expect(result).to eq "Hello, Anthony!"
  end
end