class Scrabble
  LETTER_VALUES = { %w(a e i o u l n r s t) => 1,
                    %w(d g) => 2,
                    %w(b c m p) => 3,
                    %w(f h v w y) => 4,
                    %w(k) => 5,
                    %w(j x) => 8,
                    %w(q z) => 10 }

  def initialize(word)
    @word = word ? word.gsub(/\s+/, '').downcase : ''
  end

  def score
    self.class.score(@word)
  end

  def self.score(word)
    word.chars.reduce(0) do |sum, letter|
      letters = LETTER_VALUES.keys.find { |letters| letters.include? letter }
      points = LETTER_VALUES[letters]
      sum + points
    end
  end
end
