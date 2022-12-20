class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @your_words_arr = []
    @words_arr = @contents.split(" ")
    @previous_words = @your_words_arr.length
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split(" ").length
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) 
    fail "Invalid input" unless wpm > 0
    return (@contents.split(" ").length / wpm.to_f).ceil
    # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes)
    fail "Please input at least 1 or more minute and/or words per minute" unless
    minutes > 0 && wpm > 0

    
    words_arr_start = @words_arr.drop(@previous_words)
    counter = 0
    
    words_arr_start.each do |word|
      if counter < minutes * wpm
        counter += 1
        @your_words_arr << word
      else
        break
      end
    end
  
    your_words = @your_words_arr.drop(@previous_words).join(" ")
    puts "The passage '#{your_words}' will take #{minutes} minute to finish."
    
    if @your_words_arr.length == @words_arr.length
      @your_words_arr = []
    end
  end
end
=begin
    current_len = @your_words_arr.length
    words_arr = @contents.split(" ").drop(current_len)
    counter = 0

    words_arr.each do |word|
      if counter < minutes * wpm
        counter += 1
        @your_words_arr << word
      else
        break
      end
    end

    #make your_words_arr an instance variable to update it in each loop
    
    your_words = @your_words_arr.drop(current_len).join(" ")
    return "The passage '#{your_words}' will take #{minutes} minute to finish."
=end    

    # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.