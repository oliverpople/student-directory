@students = []

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  puts "\nYou have selected option #{selection}."
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

def input_students
  puts "\nPlease enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Is '#{name}' written correctly? If correct press 'Y'"
      check = gets.chomp.downcase
        if check == 'y'
          students_array(name, "November")
          puts "Now we have #{@students.count} students"
          name = STDIN.gets.chomp
        else
          break
        end
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "\nThe students of my cohort at Makers Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "\nOverall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "You have saved #{@students.length} students to the file."
  file.close
end

def try_load_students
  filename = ARGV.first
  filename ||= "students.csv"  # ruby "||="
  if File.exist?(filename.to_s)
    load_students(filename)
      puts "Loaded"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    students_array(name, cohort)
  end
  puts "\nYou have loaded #{@students.length} students from the file."
  file.close
end

def students_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
