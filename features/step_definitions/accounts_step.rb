Given /^I have accounts numbered (\d.+)$/ do |numbers|
  numbers.split(', ').each do |number|
    Account.create!(:number => number.to_i)
  end
end

Given /^I have no accounts$/ do
  Account.delete_all
end
 
Then /^I should have (\d+) account$/ do |count|
  Account.count == count.to_i
end