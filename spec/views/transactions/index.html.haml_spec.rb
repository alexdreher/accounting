require 'spec_helper'

describe "transactions/index.html.haml" do
  before(:each) do
    @accounts = []    
    2.times do |n|
      @accounts << Factory(:account, :number => 1501+n)
    end
    
    @transactions = []
    2.times do
      @transactions << Factory(:transaction)
    end
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1501.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1502.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
