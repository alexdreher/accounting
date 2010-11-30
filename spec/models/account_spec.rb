require 'spec_helper'

module AccountSpecHelper
  def valid_account_attributes
    {
      :number => 1503,
      :title => "Title",
      :account_type_id => 1
    }
  end
end

describe Account do
  include AccountSpecHelper
  
  before(:each) do
    @account = Account.new()
  end
  
  it "should have a number" do
    @account.should_not be_valid
    @account.should have(1).error_on(:number)    
  end
  
  it "should have a title" do
    @account.should_not be_valid
    @account.should have(1).error_on(:title)
  end
  
  it "should be valid" do
    @account.attributes = valid_account_attributes
    @account.should be_valid
  end
  
  it "should have a unique number" do
    @account.attributes = valid_account_attributes
    @account.save
    
    newaccount = Account.new(valid_account_attributes)
    newaccount.should have(1).error_on(:number)
  end
  
  it "should have many transactions" do
    @account.should respond_to(:transactions)
  end
  
  it "should have an account type" do
    @account.should respond_to(:account_type)
  end
end
