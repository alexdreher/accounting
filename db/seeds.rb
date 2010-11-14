# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# fixed account_types, because there are only these
account_types = [
    {
      :title => "Asset account",
      :debit => 1,
      :credit => -1
    },
    {
      :title => "Liability account",
      :debit => -1,
      :credit => 1
    },
    {
      :title => "Revenue account",
      :debit => 1,
      :credit => -1
    },
    {
      :title => "Expense account",
      :debit => -1,
      :credit => 1
    },
  ]
AccountType.create(account_types)