class Series
  attr_reader :digit_string

  def initialize(digit_string)
    @digit_string = digit_string
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > digit_string.length

    result = []
    counter = 0
    stop_index = digit_array.length - slice_length
    while counter <= stop_index
      result << digit_array[counter, slice_length]
      counter += 1
    end
    result
  end

  def digit_array
    digit_string.split('').map(&:to_i)
  end
end
