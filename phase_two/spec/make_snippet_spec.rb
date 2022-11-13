require "make_snippet"

RSpec.describe "make_snippet" do
  it "returns first five leters of a string" do
    result = make_snippet("apples pears oranges bananas strawberrys")
    expect(result).to eq "apples pears oranges bananas strawberrys"
  end

  it "return '...' after first five letters of a string" do
    result = make_snippet("apples pears oranges bananas strawberrys grapes")
    expect(result).to eq "apples pears oranges bananas strawberrys..."
  end
end
