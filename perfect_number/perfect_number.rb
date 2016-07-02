class PerfectNumber
  def self.classify(number)
    fail 'Number must be greater than 0' if number <= 0

    sum_of_factors = (1...number).select { |num| number % num == 0 }.reduce(:+)

    if sum_of_factors > number
      'abundant'
    elsif sum_of_factors == number
      'perfect'
    else
      'deficient'
    end
  end
end
