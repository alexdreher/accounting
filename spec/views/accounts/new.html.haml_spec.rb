require 'spec_helper'

describe "accounts/new.html.haml" do
  before(:each) do
    assign(:account, stub_model(Account,
      :parent_id => 1,
      :number => 1,
      :account_type_id => 1,
      :title => "MyString",
      :bookable => false
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => accounts_path, :method => "post" do
      assert_select "input#account_parent_id", :name => "account[parent_id]"
      assert_select "input#account_number", :name => "account[number]"
      assert_select "input#account_account_type_id", :name => "account[account_type_id]"
      assert_select "input#account_title", :name => "account[title]"
      assert_select "input#account_bookable", :name => "account[bookable]"
    end
  end
end
