class Transaction < ActiveRecord::Base
  before_validation do
    # TODO: make this configurable
    self.booking_date = Date.strptime(book_date, '%d%m%y')
  end  
  
  cattr_accessor :book_date
  
  validates_presence_of :booking_date
  
  # book_date format: [01-31][01-12][dd], where d = any digit
  validates_format_of :book_date, :with => /^(0[1-9]|[12][0-9]|3[01])(0[1-9]|1[012])(\d{2})$/
end
