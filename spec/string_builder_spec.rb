require "string_builder"

RSpec.describe StringBuilder do
  it "returns an empty" do
    string_builder = StringBuilder.new
    expect(string_builder.output).to eq ""
  end

  it "adds words to the empty string" do
    string_builder = StringBuilder.new
    string_builder.add("Hi, I'm Anthony")
    expect(string_builder.output).to eq "Hi, I'm Anthony"
  end

  it "returns a length of a string" do
    string_builder = StringBuilder.new
    string_builder.add("Hi, I'm Henry")
    expect(string_builder.size).to eq 13
  end
end
