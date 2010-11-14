require 'spec_helper'

describe "account_types/edit.html.haml" do
  before(:each) do
    @account_type = assign(:account_type, stub_model(AccountType,
      :new_record? => false,
      :title => "MyString",
      :debit => 1,
      :credit => 1
    ))
  end

  it "renders the edit account_type form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => account_type_path(@account_type), :method => "post" do
      assert_select "input#account_type_title", :name => "account_type[title]"
      assert_select "input#account_type_debit", :name => "account_type[debit]"
      assert_select "input#account_type_credit", :name => "account_type[credit]"
    end
  end
end
