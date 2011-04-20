class PhoneNumbersController < ApplicationController
  def new
    if params[:person_id]
      contact = Person.find params[:person_id]
    else
      contact = Company.find params[:company_id]
    end
    @phone_number = contact.phone_numbers.new
  end

  def create
    @phone_number = PhoneNumber.new(params[:phone_number])
    if @phone_number.save
      redirect_to @phone_number.contact, :notice => "Successfully created phone number."
    else
      render :action => 'new'
    end
  end

  def edit
    @phone_number = PhoneNumber.find(params[:id])
  end

  def update
    @phone_number = PhoneNumber.find(params[:id])
    if @phone_number.update_attributes(params[:phone_number])
      redirect_to @phone_number.contact, :notice  => "Successfully updated phone number."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @phone_number = PhoneNumber.find(params[:id])
    @phone_number.destroy
    redirect_to @phone_number.contact, :notice => "Successfully destroyed phone number."
  end
end
