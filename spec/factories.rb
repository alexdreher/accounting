Factory.define :account do |f|
  # f.sequence(:number) { |n| 1501+n }
  f.number 1501
  f.title "Title"
  f.account_type_id 1
end

Factory.define :transaction do |f|
  f.book_date "241013"
  f.debit 1501
  #f.association :debit, :factory => :account
  #f.association :credit, :factory => :account
  f.credit 1502
  f.amount 1.5
  f.title "Title"
end