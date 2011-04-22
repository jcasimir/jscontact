class EmailAddressesController < ApplicationController
  before_filter :find_resource, :only => [:show, :destroy, :edit, :update]

  def new
    if params[:person_id]
      contact = Person.find params[:person_id]
    else
      contact = Company.find params[:company_id]
    end
    @email_address = contact.email_addresses.new    
  end

  def create
    @email_address = EmailAddress.new(params[:email_address])
    if @email_address.save
      redirect_to @email_address.contact, :notice => "Successfully created email address."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @email_address.update_attributes(params[:email_address])
      redirect_to @email_address.contact, :notice  => "Successfully updated email address."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @email_address.destroy
    redirect_to @email_address.contact, :notice => "Successfully destroyed email address."
  end
end
