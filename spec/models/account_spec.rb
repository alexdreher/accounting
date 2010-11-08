require 'spec_helper'

describe Account do
  it "should have a number" do
    a = Account.new()
    a.save.should eql(false)
    a.should have(1).error_on(:number)
  end
  
  it "should have a title" do
    a = Account.new()
    a.save.should eql(false)
    a.should have(1).error_on(:title)
  end
  
  it "should have a unique number" do
    pending
    
    Account.should have(1).record  
  end  
end
