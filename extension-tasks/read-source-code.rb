def print_header
  puts "The students of Villains Academy \n -------------"
end

# Outputs student names per line
# param students Array of Hashes
def print_students(students)
  students.each { |student| puts "#{student[:name]}"}
end

# param students as array of hashes
def print_footer(students)  
  puts "Overall, we have #{students.length} great students" 
end

# saves input students to csv file
def save_students(students, filename = "students.csv")
  File::open(filename, "w") do |file|
    students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

# loads students from csv file
def load_students(students, filename = "students.csv")
  File::open(filename, "r") do |file|
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      students << {name: name, cohort: cohort.to_sym}
    end
  end
end

# checks if valid filename has been input from the command line
def try_load_students(students)
  filename = ARGV.first 
  return if filename.nil?
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
  puts "Please enter the names of the students \n To finish, just hit return twice"

  students = []
  name = STDIN.gets.chomp

  while !name.empty? do
    # add each individual student hash into an array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

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

# Displays menu of actions to the user
def print_menu(filename)
    puts "Please input a number: "
    puts "1. Input the students"
    puts "2. Print the students"
    puts "3. Save the list to #{filename}"
    puts "4. Load the list from #{filename}"
    puts "9. Exit"
end

# Uses input from interactive menu to run appropriate method
def process(selection, students)
  case selection
  when "1"
    p "Selection successful!"
    students = students.concat input_students
  when "2"
    p "Selection successful!"
    show_students(students)
  when "3"
    p "Selection successful, saving students to file!"
    save_students(students)
  when "4"
    p "Selection successful, loading students!"
    try_load_students(students)  
  when "9"
    puts "Exiting..."
    exit
  else
    puts "Please try again"
  end
  interactive_menu(students)
end

# runs interactive menu
def interactive_menu(students, filename = ARGV.first)
  # Display menu choices
  print_menu(filename)
  # Read the input and save it into a variable
  process(STDIN.gets.chomp, students)
end

# interactive_menu([])

def read_source
  File.open(__FILE__,"r"){|file| file.readlines.each{|line| puts line}}
end

read_source