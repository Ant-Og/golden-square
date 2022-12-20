require "dairy_entry"

RSpec.describe DiaryEntry do
  it "constructs a new instance" do
    new_entry = DiaryEntry.new("Nov 16 2022", "my contents")
    expect(new_entry.title).to eq "Nov 16 2022"
    expect(new_entry.contents).to eq "my contents"
  end

  describe "#count_words" do
    it "returns the number of word in contents as an integer" do
      new_entry = DiaryEntry.new("Nov 16 2022", "my contents")
      expect(new_entry.count_words).to eq 2
    end
  
    it "returns the 0 when there is no contents" do
      new_entry = DiaryEntry.new("Nov 16 2022", "")
      expect(new_entry.count_words).to eq 0
    end
  end

  describe "#reading_time" do
    it "returns the estimated reading time of contents based on users wpm" do
      new_entry = DiaryEntry.new("Nov 16 2022", "my contents")
      expect(new_entry.reading_time(2)).to eq 1
    end

    it "returns a fail message given a wpm input of 0" do
      new_entry = DiaryEntry.new("Nov 16 2022", "my contents")
      expect { new_entry.reading_time(0) }.to raise_error "Invalid input"
    end
  end

  describe "#reading_chunk" do
    it "returns a given chunk of contents along with he number of mins it 
    will take the user to read it" do
      new_entry = DiaryEntry.new("Nov 16 2022", "my writing is good fire material")
      expect(new_entry.reading_chunk(1,4)).to eq "The passage 'my writing is good' will take 4 minute to finish."
    end

    it "returns the next chunk" do
      new_entry = DiaryEntry.new("Nov 16 2022", "my writing is good fire material")
      new_entry.reading_chunk(1,4)
      chunk = new_entry.reading_chunk(1,4)
      expect(chunk).to eq "The passage 'fire material' will take 4 minute to finish."
    end


    it "returns no chunk of contents if minutes and/or wpm is 0" do
      new_entry = DiaryEntry.new("Nov 16 2022", "my writing is good fire material")
      expect { new_entry.reading_chunk(2,0) }.to raise_error "Please input at least 1 or more minute and/or words per minute"
      expect { new_entry.reading_chunk(0,2) }.to raise_error "Please input at least 1 or more minute and/or words per minute"
    end
  end
end