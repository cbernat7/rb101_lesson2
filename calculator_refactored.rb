# build command line calc that does the following
# asks for 2 numbers
# asks for type of operation(add,subtract,multipy, or divide)
# displays result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# ask the user for two numbers
def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

#validates if the input is a float or integer
def number?(input)
  integer?(input) || float?(input)
end

#validates if input is float
def float?(input)
  /\d/.match(input) && /^-?\d*\.?d*$\.match(input)
end

# bc case statement is last in the method- will automatically return value
def operation_to_message(oper)
 word = case oper
        when '1'
          'Adding'
        when '2'
          'Subtracting'
        when '3'
          'Multiplying'
        when '5'
          'Dividing'
        end
  word
end

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['greeting'])

# main loop
loop do
  number1 = ''
  # loop to check if valid number
  loop do # need to move number1 variable outside of looop do block
    prompt(MESSAGES['first_num'])
    number1 = gets.chomp.to_i
    if valid_number? number1
      break
    else
      prompt(MESSAGES['invalid_num_error'])
    end
  end

  # ask for number2 and check for valid number
  prompt(MESSAGES['second_num'])
  number2 = ''
  loop do
    number2 = gets.chomp.to_i
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_num_error'])
    end
  end

  # ask the user for an operation to perform


  prompt(MESSAGES['operator_prompt']) 
  operator = ''
  loop do
    operator = gets.chomp
    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator_error'])
    end
  end

  prompt(MESSAGES['operation_notification'])
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
  prompt(MESSAGES['result'])

  prompt(MESSAGES['another_calculation_question'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])
