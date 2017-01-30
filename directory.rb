# def input_students
  # puts "Please enter the name of the students"
  # puts "to finish, just hit return twice"
  # create an empty array
  # students = []
  # get the first name
  # name = gets.chomp
  # while the name is not empty, repeat this code
  # while !name.empty? do
    # add the student hash to the arrays
  #   students << {name: name, cohort: :november}
  #   puts "Now we have #{students.count} students"
    # get another name from the user
  #   name = gets.chomp
#   end
  # return the array of students
#   students
# end

def input_students
  students = []
  tracker = false
  while tracker == false
    puts "Fill out the following information"
    puts "Student Name:"
    name = gets.chomp
    puts "Age:"
    age = gets.chomp
    puts "Date of birth:"
    dob = gets.chomp
    puts "Country of Birth:"
    birthplace = gets.chomp
    students << {name: name, cohort: :november, age: age, dob: dob, birthplace: birthplace}
    puts "Now we have #{students.count} students"
    puts "Do you wish you add another student? Y/N"
    choice = gets.chomp
    if choice == "N"
      tracker = true
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(centered_txt)
  puts "--------------".center(centered_txt)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(centered_txt)
  end
end

def print_with_index(students) # use each with index to display index with student name and cohort
  puts "Number before the name of each student:"
  students.each_with_index do |student, index|
    # without +1, index begins at 0.
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_alphabetical_order(students)
  puts "Students sorted in alphabetical order:"
  # sorts hash by value of the key :name, returns hash assigned to sorted
  sorted = students.sort_by {|sort| sort[:name]}
  # goes through new hash sorted and prints name and cohort
  sorted.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print students with a certain letter rather than showing all
def print_students_beginning_with(students)
  puts "Show students beginning with which letter? "
  letter = gets.chomp
  students.each do |student|
    if student[:name][0] == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_less_than_12(students)
  puts "Students whose name is shorter than 12 characters"
  students.each do |student|
    # show if student value length is less than 12
    if (student[:name]).length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_with_loop(students)
  puts "Printed using while loops"
  total_students = students.count
  i = 0 # beginning incriment
  arr = [] # empty array to push hash into
  # while i is not equal to the total_students do loop
  while i != total_students
    arr.push(students[i]) # pushes students into an array
    # prints array with following information
    puts "#{i + 1}. #{arr[i][:name]} (#{arr[i][:cohort]} cohort)"
    i += 1 # incriment is plus 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(centered_txt)
end

# added seperator just to make things look more presentable
def new_line
  puts " "
end

def centered_txt
  centered_txt = 50
end


# nothing happens until we call the methods
centered_txt
students = input_students
print_header
print(students)
new_line
print_footer(students)
new_line
print_with_index(students)
new_line
print_alphabetical_order(students)
new_line
print_students_beginning_with(students)
new_line
print_less_than_12(students)
new_line
print_with_loop(students)
