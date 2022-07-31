# build command line calc that does the following
# asks for 2 numbers
# asks for type of operation(add,subtract,multipy, or divide)
# displays result

# ask the user for two numbers
def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

# bc case statement is last in the method- will automatically return value
def operation_to_message(oper)
  case oper
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '5'
    'Dividing'
  end
end

prompt 'welcome to the calculator! Enter your name:'
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt 'please enter a name!'
  else
    break
  end
end

prompt "Hi #{name}"

# main loop
loop do
  number1 = ''
  # loop to check if valid number
  loop do # need to move number1 variable outside of looop do block
    prompt "what's the first number?"
    number1 = gets.chomp.to_i
    if valid_number? number1
      break
    else
      prompt 'Error..please enter a valid number'
    end
  end

  # ask for number2 and check for valid number
  prompt "what's the second number?"
  number2 = ''
  loop do
    prompt "what's the first number?"
    number2 = gets.chomp.to_i
    if valid_number?(number2)
      break
    else
      prompt 'Error..please enter a valid number'
    end
  end

  # ask the user for an operation to perform
  operator_prompt = <<-MSG
  what operation do you want to do? 
    1(Add)
    2(subtract)
    3(multipy)
    4(divide)
  MSG

  prompt operator_prompt
  operator = ''
  loop do
    operator = gets.chomp
    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt 'must enter 1,2,3 or 4'
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers.. "
  # perform the operation on the two numbers

  result =  case operator
            when '1'
              number1 + number2
            when '2'
              number1 - number2
            when '3'
              number1 * number2
            when '4'
              number1.to_f / number2.to_f
            end

  # output the result
  prompt "the result is #{result}"

  prompt 'do you want to perform another calculation (Y to calculate again)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'thank you for using the calcuator. Good bye!'
