class CompaniesController < ApplicationController
  before_filter :find_resource, :only => [:show, :destroy, :edit, :update]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, :notice => "Successfully created company."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, :notice  => "Successfully updated company."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, :notice => "Successfully destroyed company."
  end
  
end
