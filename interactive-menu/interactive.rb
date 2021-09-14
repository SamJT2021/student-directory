# Outputs header in a multiple lines
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Outputs student names per line
# param students Array of Hashes
def print_students(students)
  students.each { |student| puts "#{student[:name]}"}
end

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
    students << {name: name}
    puts "Now we have #{students.count} students"

    # get another name from the user
    name = gets.chomp
  end

  return students
end

def interactive_menu(students)
  # 1. print the menu and ask the user what to do
  puts "Please input a number: "
  puts "1. Input the students"
  puts "2. Print the students"
  puts "9. Exit"
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
  when "1"
    students = students.concat input_students
    interactive_menu(students)

  when "2"
    print_header
    print_students(students)
    print_footer(students)
    interactive_menu(students)
  when "9"
    puts "Exiting..."
    exit
  else
    # 4. repeat from step 1
    puts "Please try again"
    interactive_menu(students)
  end

end

interactive_menu([])