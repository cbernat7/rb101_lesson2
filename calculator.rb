#build command line calc that does the following
#asks for 2 numbers
#asks for type of operation(add,subtract,multipy, or divide)
#displays result


#ask the user for two numbers
puts "welcome to the calculator"
puts "what's the first number?"
number1 = gets.chomp.to_i
puts number1 
puts "what's the second number?"
number2 = gets.chomp.to_i

#ask the user for an operation to perform
puts "what operation do you want to do? 1-Add, 2-subtract, 3-multipy, 4-divide "
operator = gets.chomp.to_i

#perform the operation on the two numbers
#if condition doesn't create a block so result can be accessed outside the if condition
if operator == 1
  result = number1 + number2
elsif operator == 2
  result = number1 - number2
elsif operator == 3
  result = number1 * number2
else
  result = number1.to_f / number2.to_f
end

#output the result
puts "the result is #{result}"