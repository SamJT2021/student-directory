# Outputs header in a multiple lines
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Outputs student names per line
# param students Array of Hashes
def print_students(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

# exercises 1: print index of student before student name
def print_with_index(students)
  students.each_with_index { |student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"}
end

# Outputs total in a singular line
# param students Array of Hashes
def print_footer(students)
  puts "Overall, we have #{students.length} great students"
end

# takes user input of student names and adds to an array of hashes
# returns array of hashes
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp

  while !name.empty? do
    # add student hash into an array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    # get another name from the user
    name = gets.chomp
  end

  return students
end


# calls necessary methods
def run_directory
  students = input_students
  print_header
  print_students(students)
  print_footer(students)
end

run_directory