Factory.define :account do |f|
  f.sequence(:number) { |n| 1101+n }
  f.title "Title"
  f.account_type_id 1
end