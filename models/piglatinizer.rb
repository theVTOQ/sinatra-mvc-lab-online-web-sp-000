class PigLatinizer
  @@vowels = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]

  def piglatinize(user_phrase)
    text = user_phrase
    #text = user_phrase.downcase
    individual_translations = []

    text.split(" ").each do |word|
      new_word = word
      first_letter = word[0]

      if @@vowels.include?(first_letter)
        new_word << "way"
        #new_word.capitalize!
      else
        prefix = get_prefix(word)
        new_word.sub!(prefix, "")
        new_word << "#{prefix}ay"
      end

      individual_translations << new_word
    end

    individual_translations.join(" ")
  end

  def get_prefix(word)
    prefix = ""
    word.chars.each do |char|
      if @@vowels.include?(char)
        return prefix
      else
        prefix << char
      end
    end
    prefix
  end
end
