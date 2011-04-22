require 'spec_helper'
require 'capybara/rspec'

describe "the views for phone numberes", :type => :request do
  before(:all) do
    @person = Person.create(:first_name => "John", :last_name => "Doe")    
  end

  describe "when looking at the new phone number form" do
    before(:each) do
      visit new_phone_number_path(:person_id => @person.id)
    end
    
    it "should redirect to the person's page after successful submission" do
      sample_number = "2023334444"
      page.fill_in("phone_number_number", :with => sample_number)
      page.click_button("phone_number_submit")
      current_path.should == person_path(@person)
      page.should have_selector('li', :text => sample_number)
    end
    
    it "should show the contact's name in the title" do
      page.should have_selector("h1", :text => "#{@person.last_name}, #{@person.first_name}")
    end
  end
  
  describe "when looking at the edit phone number form" do
    before(:all) do
      @person.phone_numbers.create(:number => "4445556767")
      visit edit_phone_number_path(@person.phone_numbers.first)
    end
    
    it "should show the contact's name in the title" do
      page.should have_selector("h1", :text => "#{@person.last_name}, #{@person.first_name}")
    end
        
    it "should redirect to the person's page and show the edited data" do
      new_number = "7778888787"
      page.fill_in("phone_number_number", :with => new_number)
      page.click_button("phone_number_submit")
      current_path.should == person_path(@person)
      page.should have_selector('li', :text => new_number)
    end
  end
end