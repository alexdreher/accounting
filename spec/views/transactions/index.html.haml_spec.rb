require 'spec_helper'

describe "transactions/index.html.haml" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :debit_id => 1502,
        :credit_id => 3102,
        :amount => 1.5,
        :title => "Title"
      ),
      stub_model(Transaction,
        :debit_id => 1502,
        :credit_id => 3102,
        :amount => 1.5,
        :title => "Title"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1502.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 3102.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
