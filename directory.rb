# let's put all students into an array
students = [
   "Dr. Hannibal Lectur",
   "Darth Vader",
   "Nurse Ratched",
   "Michael Corleone",
   "Alex Delarge",
   "The Wicked Witch of the West",
   "Terminator",
   "Freddy Krueger",
   "The Joker",
   "Joffrey Baratheon",
   "Norman Bates"]
# and then print them

def print_header
  puts "the students of Villians Academy"
  puts "______________"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
