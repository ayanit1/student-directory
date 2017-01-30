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

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students) # use each with index to display index with student name and cohort
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

def print_less_than_12(students)
  puts "Students whose name is shorter than 12 characters"
  students.each do |student|
    # show if student value length is less than 12
    if (student[:name]).length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# added seperator just to make things look more presentable
def new_line
  puts " "
end


# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
new_line
print_alphabetical_order(students)
new_line
print_less_than_12(students)
