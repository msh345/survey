class Word < ActiveRecord::Base


  def self.test(word)
    sorted = word.split(//).sort.join
    result = Word.where(:sorted => sorted)
    results = []
    # p sorted
    p result
    if result.length > 1
        p result
        result.each { |hash| 
            results << hash.word if hash.word != word
         }
      else
      return "#{word} is not an anagram"
    end
      # results.each { |word| 
      string = results.join(", ")
      return "#{word}'s anagram(s) are #{string}"
      # p result[0].word
    # result.class  
  end

end
