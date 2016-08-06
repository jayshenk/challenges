# I used define_singleton_method to dynamically define the method for each student

class Garden
  PLANT_NAMES = { 'G' => :grass, 'C' => :clover,
                  'R' => :radishes, 'V' => :violets }.freeze
  INITIAL_STUDENTS = %w(alice bob charlie david eve fred ginny harriet ileana
                        joseph kincaid larry).freeze

  def initialize(diagram, students = INITIAL_STUDENTS)
    @rows = diagram.split("\n")
    students.sort.each_with_index do |student, index|
      define_singleton_method(student.downcase) do
        plants(index * 2)
      end
    end
  end

  private

  def plants(student_number)
    letters = extract_letters(student_number)
    determine_plants(letters)
  end

  def extract_letters(student_number)
    result = []
    @rows.each do |row|
      [student_number, student_number + 1].each do |number|
        result << row[number]
      end
    end
    result
  end

  def determine_plants(letters)
    result = []
    letters.each do |letter|
      result << PLANT_NAMES[letter]
    end
    result
  end
end
