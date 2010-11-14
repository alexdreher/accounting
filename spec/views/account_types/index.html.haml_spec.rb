require 'spec_helper'

describe "account_types/index.html.haml" do
  before(:each) do
    assign(:account_types, [
      stub_model(AccountType,
        :title => "Title",
        :debit => 1,
        :credit => 1
      ),
      stub_model(AccountType,
        :title => "Title",
        :debit => 1,
        :credit => 1
      )
    ])
  end

  it "renders a list of account_types" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
