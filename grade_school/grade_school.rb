class School
  attr_reader :roster

  def initialize
    @roster = {}
  end

  def to_h
    sorted_roster = roster.sort.to_h
    sorted_roster.each_value(&:sort!)
    sorted_roster
  end

  def add(name, grade)
    if roster[grade]
      roster[grade].push(name)
    else
      roster[grade] = [name]
    end
  end

  def grade(number)
    roster[number] || []
  end
end
