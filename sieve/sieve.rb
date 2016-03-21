class Sieve
  attr_reader :unsieved

  def initialize(number)
    @unsieved = (2..number).to_a
  end

  def primes
    prime_numbers = []
    while unsieved.any?
      prime = unsieved.shift
      unsieved.reject! { |num| num % prime == 0 }
      prime_numbers << prime
    end
    prime_numbers
  end
end
