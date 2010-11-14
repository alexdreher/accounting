require "spec_helper"

describe AccountTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/account_types" }.should route_to(:controller => "account_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/account_types/new" }.should route_to(:controller => "account_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/account_types/1" }.should route_to(:controller => "account_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/account_types/1/edit" }.should route_to(:controller => "account_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/account_types" }.should route_to(:controller => "account_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/account_types/1" }.should route_to(:controller => "account_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/account_types/1" }.should route_to(:controller => "account_types", :action => "destroy", :id => "1")
    end

  end
end
