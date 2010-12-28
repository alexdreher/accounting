class Transaction < ActiveRecord::Base
  belongs_to :credit_account, :class_name => "Account", :foreign_key => "credit_id"
  belongs_to :debit_account, :class_name => "Account", :foreign_key => "debit_id"
  
  before_validation :create_booking_date, :insert_accounts
  
  attr_accessor :book_date, :credit, :debit
  
  # book_date format: [01-31][01-12][dd], where d = any digit
  validates_format_of :book_date, :with => /^(0[1-9]|[12][0-9]|3[01])(0[1-9]|1[012])(\d{2})$/
  
  validates_presence_of :booking_date
  
  validates_format_of :amount, :with => /^\d{1,10}(\.\d{1,2})?$/
  
  
  def insert_accounts    
    self.debit_account = Account.find_by_number(debit)
    self.credit_account = Account.find_by_number(credit)
    
    # validation
    unless self.debit_account
      errors.add(:debit, "does not point to a valid account record")
    end
    
    unless self.credit_account
      errors.add(:credit, "does not point to a valid account record")
    end
  end
  
  # creates the booking date or leaves it blank, if the user input is crap
  def create_booking_date
    # TODO: make this configurable
    self.booking_date = Date.strptime(book_date, '%d%m%y')
  rescue
  end
  
  def self.get(account)
    if account
      where("debit_id = ? OR credit_id = ?", account, account).all
    else
      all
    end
  end

end
