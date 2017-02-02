require 'csv'
@students = []
@alignment = 40


def input_students
  puts "Please enter the name of the students"
  puts "to finish, just hit return twice"
  user_input_marker
  name = STDIN.gets.chomp
  while !name.empty?
    add_students(name)
    if @students.count == 1
      puts "Now we have #{@students.size} student"
    elsif @students.count == 0
      puts "There are currently no students in the database"
    else
      puts "Now we have #{@students.size} students"
    end
    user_input_marker
    name = STDIN.gets.chomp
  end
end

def add_students(name, cohort = 'november')
  @students << {name: name,
                cohort: cohort.to_sym}
end

def interactive_menu
  loop do
    puts print_menu
    puts 'Select an option'
    user_input_marker
    process(STDIN.gets.chomp)
  end
end

def print_menu
  <<~END

              Main Menu
          -----------------
1. Input the students
2. Show the students
3. Save the list to students.csv
4. Load the list from students.csv
9. Exit

  END
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts ''
  puts 'The students of Villains Academy'.center(@alignment)
  puts '--------------'.center(@alignment)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(@alignment)
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.size} great student".center(@alignment)
  elsif @students.count == 0
    puts 'There are currently no students in the database'.center(@alignment)
  else
    puts "Overall, we have #{@students.size} great students".center(@alignment)
  end
end

def save_students
  file = File.open('students.csv', 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students(filename = 'students.csv')
  file = File.open('students.csv','r')
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def auto_load
  file = CSV.open('students.csv','r')
    file.each do |line|
      name, cohort = line
      add_students(name, cohort)
    end
  file.close
end

def user_input_marker
  print '> '
end


auto_load
interactive_menu
