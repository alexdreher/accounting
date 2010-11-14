Factory.define :account do |f|
  f.number "1101"
  f.title "Title"
  #f.account_type_id 1
  f.association :account_type
end

Factory.define :account_type do |f|
  f.title "Asset account"
  f.debit 1
  f.credit -1
end