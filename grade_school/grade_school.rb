class School
  attr_accessor :students

  def initialize
    @students = {}
  end

  def to_h
    sorted_students = students.sort_by { |grade, _names| grade }.to_h
    sorted_students.each_value(&:sort!)
    sorted_students
  end

  def add(name, grade)
    if students[grade]
      students[grade].push(name)
    else
      students[grade] = [name]
    end
  end

  def grade(number)
    students[number] || []
  end
end
