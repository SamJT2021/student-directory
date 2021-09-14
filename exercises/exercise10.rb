require 'date'

# Outputs header in a multiple lines
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

MONTHS = [
  :january, :february, :march, :april, :may, :june,
  :july, :august, :september, :october, :november, :december
]

# Outputs student names per line
# param students Array of Hashes
def print_students(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

# Outputs student names per line, grouped by cohort
# param students Array of Hashes
# param months array of symbols
def print_students_by_cohort(students, months)
  months.each { |month| 
    filtered_students = students.select { |student|
      student[:cohort].to_sym == month
    }
  
    filtered_students_names = []
    
    filtered_students.each { |student| 
      filtered_students_names.push student[:name]
    }
  
  puts month.to_s + "\n" + filtered_students_names.to_s  if filtered_students.length > 0 
  }
end

# Outputs total in a singular line
# param students Array of Hashes
def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.length} great student"
  elsif students.length > 1
    puts "Overall, we have #{students.length} great students"
  else
    puts "Overall, we have #{students.length} students"
  end
end

# takes user input of student names and adds to an array of hashes
# returns array of hashes
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  months = [
    'january', 'february', 'march', 'april', 'may', 'june',
    'july', 'august', 'september', 'october', 'november', 'december'
  ]
  # get the first name
  name = gets.delete_suffix("\n") 
  puts "what is the cohort? "
  cohort = gets.delete_suffix("\n") 
  if cohort.empty? or not months.include? cohort.to_s
    current_month = Date.today.strftime("%m") 
    cohort = months[current_month.to_i - 1].to_sym
  end 
  while !name.empty? do
    # add student hash into an array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students, enter another name :"

    # get another name from the user
    name = gets.delete_suffix("\n") 
    puts "what is the cohort? "
    cohort = gets.delete_suffix("\n") 
    if cohort.empty? or not months.include? cohort.to_s
      current_month = Date.today.strftime("%m") 
      cohort = months[current_month.to_i - 1].to_sym
    end 
  end

  return students
end


# calls necessary methods
def run_directory
  students = input_students
  print_header
  print_students_by_cohort(students, MONTHS)
  print_footer(students)
end

run_directory