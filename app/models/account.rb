class Account < ActiveRecord::Base
  validates_presence_of :number
  validates_presence_of :title
end
