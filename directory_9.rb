def interactive_menu
  students = [] # decalring the students variable before the loop
  # makes it avaible for several iterations.
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # '9' beacuse we'll be adding more.
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the prgram to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp
  while !name.empty? do
    students << {name: name.to_sym, cohort: :november}
    puts "Now we have #{students.count} students"
  name = gets.chomp
  end
  students
    if !students.empty?
      print_header
      print(students)
      print_footer(students)
    end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

interactive_menu
