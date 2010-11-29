Factory.define :account do |f|
  f.sequence(:number) { |n| 1101+n }
  f.title "Title"
  f.account_type_id 1
end

Factory.define :transaction do |f|
  f.debit 1502
  f.credit 3102
  f.amount 1.0
  f.title "test"
end