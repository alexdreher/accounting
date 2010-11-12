require 'spec_helper'

describe "accounts/edit.html.haml" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :new_record? => false,
      :parent_id => 1,
      :number => 1,
      :account_type_id => 1,
      :title => "MyString",
      :bookable => false
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => account_path(@account), :method => "post" do
      assert_select "input#account_parent_id", :name => "account[parent_id]"
      assert_select "input#account_number", :name => "account[number]"
      assert_select "input#account_account_type_id", :name => "account[account_type_id]"
      assert_select "input#account_title", :name => "account[title]"
      assert_select "input#account_bookable", :name => "account[bookable]"
    end
  end
end
