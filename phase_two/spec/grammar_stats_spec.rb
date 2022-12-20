require "grammar_stats"

RSpec.describe GrammarStats do
  it "return true or false depending whether text begins with capital letter" do
    my_text = GrammarStats.new
    my_text2 = GrammarStats.new
    expect(my_text.check("tokyo")).to eq "False!"
    expect(my_text.check("Tokyo")).to eq "True!"
  end 

  describe "percentage_good" do
    it "returns percentage that passed" do
      my_text = GrammarStats.new
      my_text2 = GrammarStats.new
      my_text3 = GrammarStats.new
      my_text4 = GrammarStats.new
      my_text.check("Tokyo")
      my_text2.check("London")
      expect(my_text2.percentage_good).to eq "100% passed!"
      my_text3.check("paris")
      expect(my_text3.percentage_good).to eq "67% passed!"
      my_text4.check("rio de janerio")
      expect(my_text4.percentage_good).to eq "50% passed!"
    end
  end
end 