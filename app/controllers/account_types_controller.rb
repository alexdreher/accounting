class AccountTypesController < ApplicationController
  # GET /account_types
  # GET /account_types.xml
  def index
    @account_types = AccountType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_types }
    end
  end

  # GET /account_types/1
  # GET /account_types/1.xml
  def show
    @account_type = AccountType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account_type }
    end
  end

  # GET /account_types/new
  # GET /account_types/new.xml
  def new
    @account_type = AccountType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account_type }
    end
  end

  # GET /account_types/1/edit
  def edit
    @account_type = AccountType.find(params[:id])
  end

  # POST /account_types
  # POST /account_types.xml
  def create
    @account_type = AccountType.new(params[:account_type])

    respond_to do |format|
      if @account_type.save
        format.html { redirect_to(@account_type, :notice => 'Account type was successfully created.') }
        format.xml  { render :xml => @account_type, :status => :created, :location => @account_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /account_types/1
  # PUT /account_types/1.xml
  def update
    @account_type = AccountType.find(params[:id])

    respond_to do |format|
      if @account_type.update_attributes(params[:account_type])
        format.html { redirect_to(@account_type, :notice => 'Account type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /account_types/1
  # DELETE /account_types/1.xml
  def destroy
    @account_type = AccountType.find(params[:id])
    @account_type.destroy

    respond_to do |format|
      format.html { redirect_to(account_types_url) }
      format.xml  { head :ok }
    end
  end
end
