require 'spec_helper'

describe "transactions/index.html.haml" do
  fixtures :all
  
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :id => 1,
        :booking_date => "2010-04-01",
        :debit_id => 1,
        :credit_id => 2,
        :amount => 1.5,
        :title => "Title"
      ),
      stub_model(Transaction,
        :id => 2,
        :booking_date => "2010-04-01",
        :debit_id => 1,
        :credit_id => 2,
        :amount => 1.5,
        :title => "Title"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    
    assert_select "tr > td", :text => 1000.to_s, :count => 2
    assert_select "tr > td", :text => 1001.to_s, :count => 2
    assert_select "tr > td", :text => "$1.50", :count => 2
    assert_select "tr > td", :text => "Title".to_s, :count => 2
  end
end