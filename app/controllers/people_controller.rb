class PeopleController < ApplicationController
  before_filter :find_resource, :only => [:show, :destroy, :edit, :update]

  def index
    @people = current_user.people
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    #@person = Person.new(params[:person])
    @person = current_user.people.new(params[:person])
    if @person.save
      redirect_to @person, :notice => "Successfully created person."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @person.update_attributes(params[:person])
      redirect_to @person, :notice  => "Successfully updated person."
    else
      render :action => 'edit'
    end
  end

  def destroy

    @person.destroy
    redirect_to people_url, :notice => "Successfully destroyed person."
  end
end
