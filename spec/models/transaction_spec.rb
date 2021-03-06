require 'spec_helper'

module TransactionSpecHelper
  def valid_transaction_attributes
    {
      :book_date => "241013",
      :debit => 1000,
      :credit => 1001,
      :amount => 1.23,
      :title => "Title"
    }
  end
end

describe Transaction do
  include TransactionSpecHelper
  fixtures :all
  
  before(:each) do
    @transaction = Transaction.new
  end
  
  it "should be valid with a set of valid attributes" do
    @transaction.attributes = valid_transaction_attributes
    @transaction.should be_valid
  end
  
  it "should have a valid credit number" do
    @transaction.attributes = valid_transaction_attributes.except(:credit)
    @transaction.should_not be_valid
    @transaction.should have(1).error_on(:credit)
    @transaction.credit = 1000
    @transaction.should be_valid
    @transaction.credit_id.should == 1
  end
  
  it "should have a valid debit number" do
    @transaction.attributes = valid_transaction_attributes.except(:debit)
    @transaction.should_not be_valid
    @transaction.should have(1).error_on(:debit)
    @transaction.debit = 1001
    @transaction.should be_valid
    @transaction.debit_id.should == 2
  end
  
  it "should belong to a debit account" do
    @transaction.should respond_to(:debit_account)
  end
  
  it "should belong to a credit account" do
    @transaction.should respond_to(:credit_account)
  end
  
  it "should have an amount" do
    @transaction.attributes = valid_transaction_attributes.except(:amount)
    @transaction.should_not be_valid
    @transaction.should have(1).error_on(:amount)
    @transaction.amount = 1.23
    @transaction.should be_valid
  end
  
  it "should convert the input book date to a real date" do
    @transaction.attributes = valid_transaction_attributes.except(:book_date)
    
    # book_date has the format: ddmmyy
    # invalid day (>31)
    @transaction.book_date = "321013"
    @transaction.should_not be_valid
    @transaction.should have(1).error_on(:book_date)
    @transaction.should have(1).error_on(:booking_date)

    # invalid month (>12)
    @transaction.book_date = "241313"
    @transaction.should_not be_valid
    @transaction.should have(1).error_on(:book_date)
    @transaction.should have(1).error_on(:booking_date)

    @transaction.book_date = "241013"
    @transaction.should be_valid
  end
  
  it "should have a booking date" do
    @transaction.attributes = valid_transaction_attributes.except(:book_date)
    @transaction.book_date = "241013"
    @transaction.should be_valid
    @transaction.booking_date.to_s should.eql?("2013-10-24")
  end
  
end