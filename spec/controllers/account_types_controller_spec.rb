require 'spec_helper'

describe AccountTypesController do

  def mock_account_type(stubs={})
    (@mock_account_type ||= mock_model(AccountType).as_null_object).tap do |account_type|
      account_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all account_types as @account_types" do
      AccountType.stub(:all) { [mock_account_type] }
      get :index
      assigns(:account_types).should eq([mock_account_type])
    end
  end

  describe "GET show" do
    it "assigns the requested account_type as @account_type" do
      AccountType.stub(:find).with("37") { mock_account_type }
      get :show, :id => "37"
      assigns(:account_type).should be(mock_account_type)
    end
  end

  describe "GET new" do
    it "assigns a new account_type as @account_type" do
      AccountType.stub(:new) { mock_account_type }
      get :new
      assigns(:account_type).should be(mock_account_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested account_type as @account_type" do
      AccountType.stub(:find).with("37") { mock_account_type }
      get :edit, :id => "37"
      assigns(:account_type).should be(mock_account_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created account_type as @account_type" do
        AccountType.stub(:new).with({'these' => 'params'}) { mock_account_type(:save => true) }
        post :create, :account_type => {'these' => 'params'}
        assigns(:account_type).should be(mock_account_type)
      end

      it "redirects to the created account_type" do
        AccountType.stub(:new) { mock_account_type(:save => true) }
        post :create, :account_type => {}
        response.should redirect_to(account_type_url(mock_account_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved account_type as @account_type" do
        AccountType.stub(:new).with({'these' => 'params'}) { mock_account_type(:save => false) }
        post :create, :account_type => {'these' => 'params'}
        assigns(:account_type).should be(mock_account_type)
      end

      it "re-renders the 'new' template" do
        AccountType.stub(:new) { mock_account_type(:save => false) }
        post :create, :account_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested account_type" do
        AccountType.should_receive(:find).with("37") { mock_account_type }
        mock_account_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_type => {'these' => 'params'}
      end

      it "assigns the requested account_type as @account_type" do
        AccountType.stub(:find) { mock_account_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:account_type).should be(mock_account_type)
      end

      it "redirects to the account_type" do
        AccountType.stub(:find) { mock_account_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(account_type_url(mock_account_type))
      end
    end

    describe "with invalid params" do
      it "assigns the account_type as @account_type" do
        AccountType.stub(:find) { mock_account_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:account_type).should be(mock_account_type)
      end

      it "re-renders the 'edit' template" do
        AccountType.stub(:find) { mock_account_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested account_type" do
      AccountType.should_receive(:find).with("37") { mock_account_type }
      mock_account_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the account_types list" do
      AccountType.stub(:find) { mock_account_type }
      delete :destroy, :id => "1"
      response.should redirect_to(account_types_url)
    end
  end

end
