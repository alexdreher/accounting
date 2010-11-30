require 'spec_helper'

module TransactionSpecHelper
  def valid_transaction_attributes
    {
      :book_date => "241013",
      :debit_id => 1,
      :credit_id => 1,
      :amount => 1.23,
      :title => "Title"
    }
  end
end

describe Transaction do
  include TransactionSpecHelper
  
  before(:each) do
    @accounts = []
    2.times do |n|
      @accounts << Factory(:account, :number => 1501+n)
    end
    @transaction = Transaction.new
  end
  
  it "should be valid with a set of valid attributes" do
    @transaction.attributes = valid_transaction_attributes
    @transaction.should be_valid
  end
  
  it "should have a valid credit number" do
    @transaction.attributes = valid_transaction_attributes.except(:credit_id)
    @transaction.should_not be_valid
    @transaction.should have(1).error_on(:credit_id)
    @transaction.credit = 1501
    @transaction.credit_id.should equal 1
    @transaction.should be_valid
  end
  
  it "should have a valid debit number" do
    @transaction.attributes = valid_transaction_attributes.except(:debit_id)
    @transaction.should_not be_valid
    @transaction.should have(1).error_on(:debit_id)
    @transaction.debit = 1502
    @transaction.debit_id.should equal 2
    @transaction.should be_valid
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
