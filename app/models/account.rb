class Account < ActiveRecord::Base
  has_many :transactions, :class_name => "Transaction", :finder_sql => 'SELECT * FROM transactions WHERE debit_id = #{self.id} OR credit_id = #{self.id}'
  belongs_to :account_type
  
  validates_presence_of :number
  validates_presence_of :title
  validates_uniqueness_of :number
  validates_presence_of :account_type_id
end
