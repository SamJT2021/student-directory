# takes user input of student names and adds to an array of hashes
# returns array of hashes
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize

  while !name.empty? do
    # add student hash into an array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    # get another name from the user
    name = gets.chomp.capitalize
  end

  return students
end

# takes an array of hashes that have value :name
# and extracts these into an array
# param students Array - hashes with valid :name
# returns Array - names of students
def extract_name(students)
  student_names = []
  students.each do |student|
    student_names.push(student[:name])
  end
  return student_names
end

# filters student array by first initial
# param initial String letter to filter students by
# param student_names Hash students
def filter_students(initial, student_names)
  student_name_array = extract_name(student_names)
  return (student_name_array.select{ |student_name| student_name[0] == initial.to_s.capitalize})
end

students = input_students
print "the first initial of the student(s) you're looking for "
initial = gets.chomp

print filter_students(initial, students)