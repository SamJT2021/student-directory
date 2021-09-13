# Outputs header in a multiple lines
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Outputs student names per line
def print_students(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

# Outputs total in a singular line
def print_footer(students)
  puts "Overall, we have #{students.length} great students"
end

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

# students = input_students
# print_header
# print(students)
# print_footer(students)

def filter_students(initial, array)
  return (array.select{ |x| x[0] == initial.to_s})

end

students = ['tom', 'john', 'sam', 'troy', 'bradleigh']
print "a letter pls: "
initial = gets.chomp

print filter_students(initial, students)
