When(/^I withdraw \$(\d+)$/) do |amount|
  teller.withdraw_from(my_account, amount)
end