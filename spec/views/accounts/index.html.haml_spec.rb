require 'spec_helper'

describe "accounts/index.html.haml" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :number => 1,
        :account_type_id => 1,
        :title => "Title",
        :bookable => false
      ),
      stub_model(Account,
        :parent_id => 1,
        :number => 2,
        :account_type_id => 1,
        :title => "Title",
        :bookable => true
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 5
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.to_s, :count => 1
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    # assert_select "tr>td", :text => false.to_s, :count => 1
    assert_select "tr>td", :text => 0.to_s, :count => 1
  end
end