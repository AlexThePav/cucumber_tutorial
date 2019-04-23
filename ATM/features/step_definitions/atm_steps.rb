# \$(100) - regex capture group
# \$(100|250) - regex wildcard alternation
# \$(...) - regex wildcard dot, each dot is a single character
# \$(.*) - regex wildcard star modifier, any character any number of times
# \$([1234567890]*) - regex wildcard star modifier, any character in that class any number of times
# \$(\d*) - regex any digit any number of times
# \$(\d+) - regex plus modifier, any character any number of times but not zero
# (\d+) cucumbers? - regex ? modifier, previous character 0 or 1 times
# (?:visit|go to) - regex noncapturing group
# /^ ... $/ - regex anchors

# Successful login with PIN
Given(/^I have authenticated with the correct PIN$/) do 
  steps %{
    And I have pushed my card in the slot
    And I enter my PIN
    And I press "OK"
  }
end

# Successful withdrawal from an account in credit
Given(/^I have \$(\d+) in my Account$/) do |amount|
  pending("Need to design the Account interface")
  # Account.new(amount.to_i)
end

When(/^I request \$(\d+)$/) do |amount|
  pending("How do we simulate cash being requested?")
end

Then(/^\$(\d+) should be dispensed$/) do |amount|
  pending("How do we validate that cashed was dispensed?")
end

# Transfer funds from savings into checking account
Given(/^I have deposited \$(\d+) in my (\w+) Account$/) do |amount, account_type|
  # TODO: code that puts amount into user's account type goes here
end

When(/^I transfer \$(\d+) from my (\w+) Account into my (\w+) Account$/) do |amount, from_account, into_account|
  # TODO: code htat puts amount from user's from_account into user's into_account goes here
  puts amount
  puts from_account
  puts into_account
end