require "pig_latin/version"

module PigLatin
  def self.pig_latin( user_input )
    pig_latinized_words = user_input.split( ' ' ).map do |word|
      front, back, vwl = "","","aeiou"
      ( front = $&; word.sub!( /\A\W+/, "" ); ) if /\A\W+/ === word
      ( back = $&; word.sub!( /\W+\z/, "" ); ) if /\W+\z/ === word
      case word
      when /\A[#{vwl}]/i
        word + 'ay'
      when /\A[^#{vwl}]/i
        word = word.sub( /\Ay|\Aqu|\A[^#{vwl}yq]+/i, "" ) + $& + "ay"
      end
        word = front + word + back
      end
    pig_latinized_words = pig_latinized_words.join( " " )
    return pig_latinized_words
  end
end
