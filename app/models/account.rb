class Account < ActiveRecord::Base
  acts_as_tree :order => "number"
  
  belongs_to :account_type
  has_many :transactions, :class_name => "Transaction", :finder_sql => 'SELECT * FROM transactions WHERE debit_id = #{self.id} OR credit_id = #{self.id}'
  
  has_many :debit_transactions, :class_name => "Transaction", :foreign_key => "debit_id"
  has_many :credit_transactions, :class_name => "Transaction", :foreign_key => "credit_id"
  
  validates_presence_of :number
  validates_presence_of :title
  validates_uniqueness_of :number
  validates_presence_of :account_type_id
  
  def balance
    @balance ||= account_type.debit * debit_transactions.sum('amount') + account_type.credit * credit_transactions.sum('amount')
  end
end
