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

  it "renders a list of accounts"
end
