require 'spec_helper'

describe "transactions/edit.html.haml" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :new_record? => false,
      :debit_id => 1,
      :credit_id => 1,
      :amount => 1.5,
      :title => "MyString"
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => transaction_path(@transaction), :method => "post" do
      assert_select "input#transaction_debit_id", :name => "transaction[debit_id]"
      assert_select "input#transaction_credit_id", :name => "transaction[credit_id]"
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_title", :name => "transaction[title]"
    end
  end
end
