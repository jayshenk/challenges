class Matrix
  attr_reader :mtrx, :grid

  def initialize(mtrx)
    @mtrx = mtrx
    @grid = create_grid
  end

  def rows
    rows = []
    (0...number_of_rows).each do |number|
      row = grid.select { |coordinate, _| coordinate[0] == number }.values
      rows << row
    end
    rows
  end

  def columns
    columns = []
    (0...number_of_columns).each do |number|
      column = grid.select { |coordinate, _| coordinate[1] == number }.values
      columns << column
    end
    columns
  end

  def saddle_points
    saddle_points = []
    grid.each do |coordinate, number|
      if number == rows[coordinate[0]].max &&
         number == columns[coordinate[1]].min
        saddle_points << coordinate
      end
    end
    saddle_points
  end

  private

  def number_of_rows
    mtrx.split("\n").count
  end

  def number_of_columns
    mtrx.split("\n")[0].split.count
  end

  def coordinates
    (0...number_of_rows).to_a.product((0...number_of_columns).to_a)
  end

  def create_grid
    numbers = mtrx.scan(/\d+/).map(&:to_i)
    result = {}
    coordinates.each do |coordinate|
      result[coordinate] = numbers.shift
    end
    result
  end
end
