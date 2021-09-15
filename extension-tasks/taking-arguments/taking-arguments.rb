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

def save_students(students)
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(students, filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students(students)
  filename = ARGV.first 
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) 
    load_students(students, filename)
     puts "Loaded #{students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

# takes user input of student names and adds to an array of hashes
# returns array of hashes
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = STDIN.gets.chomp

  while !name.empty? do
    # add student hash into an array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    # get another name from the user
    name = STDIN.gets.chomp
  end

  return students
end

def show_students(students)
  print_header
  print_students(students)
  print_footer(students)
  interactive_menu(students)
end

def print_menu(filename)
    # 1. print the menu and ask the user what to do
    puts "Please input a number: "
    puts "1. Input the students"
    puts "2. Print the students"
    puts "3. Save the list to #{filename}"
    puts "4. Load the list from #{filename}"
    puts "9. Exit"
end

def process(selection, students)
  # 3. do what the user has asked
  case selection
  when "1"
    students = students.concat input_students
  when "2"
    show_students(students)
  when "3"
    save_students(students)
  when "4"
    try_load_students(students)  
  when "9"
    puts "Exiting..."
    exit
  else
    # 4. repeat from step 1
    puts "Please try again"
    interactive_menu(students)
  end
  interactive_menu(students)
end

def interactive_menu(students, filename = ARGV.first)
  # Display menu choices
  print_menu(filename)
  # 2. read the input and save it into a variable
  process(STDIN.gets.chomp, students)
end

interactive_menu([])