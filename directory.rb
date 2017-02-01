@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the name of the students"
  puts "to finish, just hit return twice"
  # create an empty array
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the arrays
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
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
    when "9"
      exit(0)
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

interactive_menu
