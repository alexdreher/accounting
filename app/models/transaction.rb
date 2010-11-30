class Transaction < ActiveRecord::Base
  belongs_to :credit_account, :class_name => "Account", :foreign_key => "credit_id"
  belongs_to :debit_account, :class_name => "Account", :foreign_key => "debit_id"
  
  before_validation :create_booking_date
  
  attr_accessor :book_date, :debit, :credit
  
  # book_date format: [01-31][01-12][dd], where d = any digit
  validates_format_of :book_date, :with => /^(0[1-9]|[12][0-9]|3[01])(0[1-9]|1[012])(\d{2})$/
  
  validates_presence_of :booking_date
  
  validates_presence_of :credit_id
  validates_presence_of :debit_id
  
  validates_format_of :amount, :with => /^\d{1,10}(\.\d{1,2})?$/
  
  # creates the booking date or leaves it blank, if the user input is crap
  def create_booking_date
    # TODO: make this configurable
    self.booking_date = Date.strptime(book_date, '%d%m%y')
  rescue
  end
  
  
  def debit=(num)
    self.debit_account = Account.find_by_number(num)
  end
  
  def credit=(num)
    self.credit_account = Account.find_by_number(num)
  end
end
