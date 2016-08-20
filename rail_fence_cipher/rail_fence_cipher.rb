# I setup the rails like so:
#
# [['A', nil, nil, nil, 'E']
#  [nil, 'B', nil, 'D', nil]
#  [nil, nil, 'C', nil, nil]]

class RailFenceCipher
  def self.encode(message, number_of_rails)
    RailFenceCipher.new(message, number_of_rails).encode
  end

  def self.decode(message, number_of_rails)
    RailFenceCipher.new(message, number_of_rails).decode
  end

  def initialize(message, number_of_rails)
    @message = message.chars
    @rail_size = message.length
    @number_of_rails = number_of_rails
    @rails = setup_rails
    @direction = 'positive'
  end

  def encode
    return @message.join('') if @number_of_rails == 1

    fill_rails

    encoded_message = ''
    @rails.each do |rail|
      encoded_message << rail.select { |letter| letter }.join('')
    end
    encoded_message
  end

  def decode
    return @message.join('') if @number_of_rails == 1

    fill_rails('placeholder')
    replace_placeholders
    decipher
  end

  def setup_rails
    rails = []
    @number_of_rails.times do
      rail = []
      @rail_size.times { rail << nil }
      rails << rail
    end
    rails
  end

  def fill_rails(placeholder = nil)
    row = 0
    @rail_size.times do |index|
      @rails[row][index] = placeholder || @message.shift
      row = increment(row)
      change_direction! if row == @number_of_rails - 1 || row.zero?
    end
    @direction = 'positive'
  end

  def replace_placeholders
    @rails.each do |rail|
      while rail.include? 'placeholder'
        index = rail.index('placeholder')
        rail[index] = @message.shift
      end
    end
  end

  def decipher
    result = []
    row = 0
    @rail_size.times do |index|
      result << @rails[row][index]
      row = increment(row)
      change_direction! if row == @number_of_rails - 1 || row.zero?
    end
    result.join('')
  end

  def increment(number)
    case @direction
    when 'positive'
      number + 1
    when 'negative'
      number - 1
    end
  end

  def change_direction!
    case @direction
    when 'positive'
      @direction = 'negative'
    when 'negative'
      @direction = 'positive'
    end
  end
end
