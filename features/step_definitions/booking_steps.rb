Given /^the following (\w.+) records$/ do |model, table|  
  table.hashes.each do |hash|
    Factory(model, hash)
  end
end

Then /^I should see a (\w.+) table$/ do |model, table|
  table.diff!(tableish("table##{model}", 'td'))
end

Given /^I have no transactions$/ do
  Transaction.delete_all
end

Then /^I should have (\d+) transactions$/ do |count|
  Transaction.count == count.to_i
end
