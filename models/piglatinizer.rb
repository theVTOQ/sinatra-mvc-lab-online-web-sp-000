class PigLatinizer
  @@vowels = ["a", "e", "i", "o", "u"]

  def initialize(user_phrase)
    @text = user_phrase.downcase
  end

  def translation
    individual_translations = []


    @text.split(" ").each do |word|
      new_word = word
      first_letter = word[0]

      if @@vowels.include?(first_letter)
        new_word[0] = ''
        new_word << "#{first_letter}way"
      else
        prefix = get_prefix(word)
        new_word.gsub(prefix, "")
        new_word << "#{prefix}ay"
      end
    end
  end

  def get_prefix(word)
    prefix = ""
    index = 0
    until @@vowels.include?(word[index])
      prefix << word[index]
      index += 1
    end
    prefix
  end
end
