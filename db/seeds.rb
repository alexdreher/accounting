# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'active_record/fixtures'

# fixed account_types, because there are only these
Fixtures.create_fixtures(File.join(Rails.root.to_s, 'db/seedfixtures/'), 'account_types')