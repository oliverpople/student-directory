@students = [] # an empty variable for all methods

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit" # '9' beacuse we'll be adding more.
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
      confirm_save_students
    when "4"
      try_load_students
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
    puts "#{student[:name]} #{student[:cohort]}"
  end
end

def print_footer
  puts "\nOverall, we have #{@students.count} great students"
end

def confirm_save_students
  puts "What is the name of the file you'd like to save the list to?"
  filename = gets.chomp
  puts "Do you want the file accessor method to be 'w' / 'a' ?"
  accessor_method = gets.chomp
  unless File.exist?(filename.to_s)
    puts "#{filename} doesn't currently exist. Creating new file called #{filename}."
  end
  save_students(filename, accessor_method)
end

def save_students(filename, accessor_method)
  file = File.open(filename, accessor_method)
  @students.each do |student|
      student_data = student[:name], student [:cohort]
      puts student_data.inspect
      csv_line = student_data.join(',')
      file.puts csv_line
  end
  puts "\nYou have saved #{@students.length} students to the file."
  file.close
end

def try_load_students
  filename = ARGV.first
  if File.exist?(filename.to_s)
    load_students(filename)
    puts "Loaded"
  else
    puts "\nSorry, no file loaded from command line."
  end
  if filename.nil?
    puts "\nWhat's the name of the file would you like to load?"
    filename = gets.chomp
    if File.exist?(filename)
      load_students(filename)
    else
      puts "\nSorry, file #{filename} doesn't exist."
      exit
    end
  end
end

def load_students(filename)
  puts filename.inspect
  require 'csv'
  CSV.foreach(filename) do |row|
    name, cohort = row.to_s.split(',')
    students_array(name, cohort)
  end
  puts "\nLoaded #{@students.length} students from the file."
end

def students_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

puts "\nCurrently running #{$0}"
try_load_students
interactive_menu
