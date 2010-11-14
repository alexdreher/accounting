require 'spec_helper'

describe "account_types/show.html.haml" do
  before(:each) do
    @account_type = assign(:account_type, stub_model(AccountType,
      :title => "Title",
      :debit => 1,
      :credit => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
