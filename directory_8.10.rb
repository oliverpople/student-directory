
  puts "Please enter the name and cohort of each student."
  puts "To finish, just the hit return twice"

def input_students
  students = []
  count = 0
  while students.count == count
    puts "What is the student's name?"
    name = gets.strip
    puts "What is the student's cohort?"
    cohort = gets.strip
    unless name.empty? && cohort.empty?
      name = "Default name" if name.empty?
      cohort = "Default date" if cohort.empty?
      students << {name: name.to_sym, cohort: cohort.to_sym}
        if count == 0
          puts "Now we have #{students.count} student."
        else
          puts "Now we have #{students.count} students."
        end
      count += 1
    else
      count -= 1
      print(students)
      puts "Would you like to make any changes to this list? Y/N?" # Opportunity to amend typos
      answer = gets.strip.downcase
        if answer == "y"
          puts "Which student's details would you like to change?" +
          " Please spell name as written on list."
          name = gets.strip
          students.delete_if {|x| x[:name] == name.to_sym}
          puts "'#{name}' has been deleted from the list." +
          " Please add the the correct details this time."
        else
        end
    end
  end
   students
end

def print_header
  puts "The students of Villians Academy"
  puts "______________"
end

def print(students)
  cohorts = [ :January, :February,      :March,
              :April  , :May     ,      :June ,
              :July   , :August  , :September ,
              :October, :November,   :December]
  count = 0
  while count <= 11
        students.each do |student|
          student.each do |name, cohort|
            if cohort == cohorts[count]
              puts "#{student[:name]} (#{student[:cohort]} cohort)"
            end
          end
        end
      count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students) # why isn't this executing?
