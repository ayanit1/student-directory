@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the name of the students"
  puts "to finish, just hit return twice"
  # create an empty array
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the arrays
    add_students(name)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

# add hash of student to instance variable
def add_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

# prints header for information
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

# prints students showing name and cohort
def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# prints footer summarizing how many students
def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.count == 0
    puts "There are currently no students in the database"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv","r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first arguement from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
