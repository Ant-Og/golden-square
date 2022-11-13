require "present"

RSpec.describe Present do
  it "fails" do
    contents = Present.new
    contents.wrap("teddy")
    expect { contents.wrap("teddy") }.to raise_error "A contents has already been wrapped."
  end

  it "fails" do
    contents = Present.new
    expect { contents.unwrap }.to raise_error "No contents have been wrapped."
  end
end
