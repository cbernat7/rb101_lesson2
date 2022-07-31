#need three things to start: loan amount, APR, loan duration
#need to calculate: monthly interest rate, loan duration in months
  #monthly payment

#formula: 
#m=monthly payment
#p = loan amount/principle
#j = monthly interest rate
#n = loan duration in monthts

puts "please enter total loan amount"
principal = ''
loop do
  principal = gets.chomp.to_f
  if principal.empty? || principal.to_f < 0
    puts "must enter positive number"
  else
    break
  end
end


puts "please enter the loan APR. EX 5 for 5% or 2.5 for 2.5%"
interest_rate = gets.chomp.to_f
apr = interest_rate / 100
apr_per_month = apr / 12

puts "please enter the loan duration in years"
loan_duration_years = gets.chomp.to_f
loan_duration_months = loan_duration_years * 12

monthly_payment = principal * 
                  (apr_per_month / 
                  (1 - (1 + apr_per_month)**(-loan_duration_months)))



puts "your monthly payment would be #{monthly_payment}"