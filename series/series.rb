class Series
  attr_reader :digits

  def initialize(digit_string)
    @digits = digit_string.split('').map(&:to_i)
  end

  def slices(slice_length)
    raise ArgumentError, 'Number is too large.' if slice_length > digits.length

    result = []
    counter = 0
    stop_index = digits.length - slice_length
    while counter <= stop_index
      result << digits[counter, slice_length]
      counter += 1
    end
    result
  end
end
