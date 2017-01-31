# old input_students asking for name and hard coded cohort
=begin
def input_students
  puts "Please enter the name of the students"
  puts "to finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the arrays
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
=end

# new input_students asking more information
def input_students
  students = []
  tracker = false
  while tracker == false
    puts "Fill out the following information"
    puts "Student Name:"
    name = gets.chomp
      # makes sure a name is not empty
      while name.empty?
        puts "A name must be entered. Please enter a student name."
        name = gets.chomp
      end
    puts "Age:"
    age = gets.chomp
    puts "Date of birth:"
    dob = gets.chomp
    puts "Country of Birth:"
    birthplace = gets.chomp
    puts "Cohort:"
    # converts user input to symbol
    cohort = gets.chomp.downcase.to_sym
      # if nothing is entered default cohort will be :november
      if cohort.empty?
        cohort = :november
      end
    # if user has made a typo the information will not be stored
    # and they can re-enter data
    puts """
    Summary
    Student Name: #{name}
    Age: #{age}
    Date of birth: #{dob}
    Birthplace: #{birthplace}
    cohort: #{cohort}
    ---------------
    Is this information correct? Y/N
    """
    choice = gets.chomp
    if choice == "Y"
      students << {name: name, cohort: cohort, age: age, dob: dob, birthplace: birthplace}
      if students.count == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
    end
      puts "Do you wish you add another student? Y/N"
      choice = gets.chomp
        if choice == "N"
          tracker = true
        end
    end
  students
end

# prints header for information
def print_header
  puts "The students of Villains Academy".center(centered_txt)
  puts "--------------".center(centered_txt)
end

# prints students showing name and cohort
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(centered_txt)
  end
end

# prints students showing index, name and cohort
def print_with_index(students) # use each with index to display index with student name and cohort
  puts "Number before the name of each student:"
  students.each_with_index do |student, index|
    # without +1, index begins at 0.
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# prints students in alphabetical order
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

# prints students with less than 12 characters
def print_less_than_12(students)
  puts "Students whose name is shorter than 12 characters"
  students.each do |student|
    # show if student value length is less than 12
    if (student[:name]).length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# print students using while loop instead of each
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

# goes through hash and returns array of existing cohorts
def print_all_existing_cohorts(students)
  puts "Students sorted by cohort"
  arr = []
  students.each do |student|
    student.select do |k,v|
      arr.push(student[:cohort])
    end
  end
  # gets an array of exisint cohorts
  existing_cohorts = arr.uniq
  # uses array to display all cohorts for various months
  existing_cohorts.each do |month|
    puts "\n#{month.to_s.capitalize} cohort"
    students.each do |student|
      student.select do |k,v|
        if v == month
        puts "#{student[:name]}"
        end
      end
    end
  end
end

# prints footer summarizing how many students
def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(centered_txt)
  else
    puts "Overall, we have #{students.count} great students".center(centered_txt)
  end
end

# added seperator just to make things look more presentable
def new_line
  puts " "
end

# To change value of alignment of centered variable
def centered_txt
  centered_txt = 50
end


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
new_line
print_all_existing_cohorts(students)
