require 'check_codeword'

RSpec.describe "check_codeword method" do
  it "takes horse and returns Correct! Come in." do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end

  it "takes a word beginning with h and ending in e and returns Close, but nope." do
    result = check_codeword("hose")
    expect(result).to eq "Close, but nope."
  end

  it "takes a wrong word and returns WRONG!" do
    result = check_codeword("Please")
    expect(result).to eq "WRONG!"
  end
end