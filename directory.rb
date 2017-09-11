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
puts "the students of Villians Academy"
puts "______________"
students.each do |student|
  puts student
end
# finally, we print total
puts "Overall, we have #{students.count} great students"
