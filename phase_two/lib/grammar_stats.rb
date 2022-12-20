class GrammarStats
    def initialize()
      @text = ""
      $passed = 0
      $failed = 0
      $percentage = 0
    end
  
    def check(text) 
      if text == text.capitalize
        $passed += 1
      return "True!"
      else
        $failed += 1
        return "False!"
      end
      # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
    end
  
    def percentage_good
      $percentage = $passed.to_f/($passed.to_f + $failed.to_f) * 100
      return "#{$percentage.round()}% passed!"
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
    end
  end