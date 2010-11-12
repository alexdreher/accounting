Given /^the following (\w.+) records$/ do |model, table|  
  table.hashes.each do |hash|
    Factory(model, hash)
  end
end

Then /^I should see (\w.+) table$/ do |table|
  table.diff!(table_at("##{$1}").to_a)  
end

Given /^I have no transactions$/ do
  Transaction.delete_all
end
