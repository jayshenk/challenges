class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a
    rows = create_rows(letters)
    width = rows.find { |row| row.start_with? letter }.length

    assemble_diamond(rows, width)
  end

  def self.create_rows(letters)
    counter = 1
    letters.each_with_object([]) do |char, rows|
      if char == 'A'
        rows << char
      else
        rows << (char + ' ' * counter + char)
        counter += 2
      end
    end
  end

  def self.assemble_diamond(rows, width)
    diamond_top = rows.map { |row| row.center(width) }
    diamond_bottom = diamond_top[0..-2].reverse
    (diamond_top + diamond_bottom).join("\n") + "\n"
  end

  private_class_method :create_rows, :assemble_diamond
end

module Bookkeeping
  VERSION = 1
end
