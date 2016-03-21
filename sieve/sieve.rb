class Sieve
  INITIAL_MARKER = 'O'
  PRIME_MARKER = 'P'
  COMPOSITE_MARKER = 'X'

  attr_reader :max_number, :range

  def initialize(number)
    @max_number = number
    @range = create_range
  end

  def create_range
    result = {}
    (2..max_number).each do |number|
      result[number] = INITIAL_MARKER
    end
    result
  end

  def primes
    loop do
      break if unmarked.empty?
      initial_number = unmarked.first
      range[initial_number] = PRIME_MARKER
      number = initial_number
      loop do
        number += initial_number
        break if number > max_number
        range[number] = COMPOSITE_MARKER
      end
    end
    range.select { |num, marker| marker == PRIME_MARKER }.keys
  end

  def unmarked
    range.select { |num, marker| marker == INITIAL_MARKER }.keys
  end
end
