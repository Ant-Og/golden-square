require "gratitudes"

RSpec.describe Gratitudes do
  it "returns empty array" do
    gratitude = Gratitudes.new
    expect(gratitude.format).to eq "Be grateful for: "
  end

  it "returns concatenated string" do
    gratitude = Gratitudes.new
    gratitude.add("Henry, Anthony")
    gratitude.add("Dogs")
    expect(gratitude.format).to eq "Be grateful for: Henry, Anthony, Dogs"
  end
end
