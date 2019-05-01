# Before do |scenario|
#   puts "Starting scenario #{scenario.name}"
# end

# After do |scenario|
#   puts "Oh dear" if scenario.failed?
# end

# Around do |scenario, block|
#   puts "About to run #{scenario.name}"
#   block.call
#   puts "Finished running #{scenario.name}"
# end

Before do
  TransactionQueue.clear
end