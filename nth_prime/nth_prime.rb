class Prime
  def self.nth(number)
    fail ArgumentError, 'Number must be greater than 0' if number <= 0

    primes = [2]

    current_num = 3
    while primes.size < number
      stop_num = Math.sqrt(current_num)
      primes.each do |prime|
        break if current_num % prime == 0
        if prime > stop_num
          primes << current_num
          break
        end
      end
      current_num += 2
    end

    primes.last
  end
end
