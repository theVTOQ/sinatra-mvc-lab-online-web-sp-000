class PigLatinizer
  @@vowels = ["a", "e", "i", "o", "u"]

  def piglatinize(user_phrase)
    text = user_phrase
    #text = user_phrase.downcase
    individual_translations = []

    text.split(" ").each do |word|
      new_word = word
      first_letter = word[0]

      if @@vowels.include?(first_letter)
        new_word[0] = ""
        new_word << "#{first_letter}way"
        #new_word.capitalize!
      else
        prefix = get_prefix(word)
        new_word.gsub!(prefix, "")
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
