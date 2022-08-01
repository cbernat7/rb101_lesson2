VALID_CHOICES = %w[rock paper scissors lizard spock]

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt 'You won!'
  elsif win?(computer, player)
    prompt 'Computer won!'
  else
    prompt "It's a tie!"
  end
end

count_rounds = 0
player_score = 0
computer_score = 0

def keep_score(player, computer)
  if win?(player, computer)
    player_score += 1
  elsif win?(computer, player)
    computer_score += 1
  end
  count_rounds += 1
  if count_rounds >= 3
    prompt "is the Grand Winner!"
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt "That's not a valid choice."
  end

  computer_choice = VALID_CHOICES.sample
  prompt "You chose: #{choice}. Computer chose: #{computer_choice}."

  display_results(choice, computer_choice)
  keep_score(choice, computer_choice)

  prompt 'Do you want to play again? y/n'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thank you for playing!'
