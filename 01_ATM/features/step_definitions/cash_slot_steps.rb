Then(/^\$(\d+) should be dispensed$/) do |amount|
  expect(cash_slot.contents).to eq(amount)
end