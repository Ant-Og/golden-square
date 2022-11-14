require "count_words"

RSpec.describe "count_words" do
  it "returns a count of 0 words" do
    result = count_words("")
    expect(result).to eq "The number of words in your entry is 0"
  end

  it "returns a count of 1 word" do
    result = count_words("Hello")
    expect(result).to eq "The number of words in your entry is 1"
  end

  it "returns a count of 5 words" do
    result = count_words("Hello my name is Anthony")
    expect(result).to eq "The number of words in your entry is 5"
  end
end