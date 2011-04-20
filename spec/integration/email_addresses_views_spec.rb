require 'spec_helper'
require 'capybara/rspec'

describe "the views for email addresses", :type => :request do
  before(:all) do
    @person = Person.create(:first_name => "John", :last_name => "Doe")    
  end


  describe "when looking at the new email address form" do
    before(:all) do
      visit new_email_address_path(:person_id => @person.id)
    end
    
    it "should redirect to the person's page after successful submission" do
      sample_address = "tester@email.com"
      page.fill_in("email_address_address", :with => sample_address)
      page.click_button("email_address_submit")
      current_path.should == person_path(@person)
      page.should have_selector('li', :text => sample_address)
    end
  end
  
  describe "when looking at the edit email address form" do
    before(:all) do
      @person.email_addresses.create(:address => "doe@john.com")
      visit edit_email_address_path(@person.email_addresses.first)
    end
    
    it "should redirect to the person's page and show the edited data" do
      new_address = "john@doe.com"
      page.fill_in("email_address_address", :with => new_address)
      page.click_button("email_address_submit")
      current_path.should == person_path(@person)
      page.should have_selector('li', :text => new_address)
    end
  end
end