require 'spec_helper'
require 'capybara/rspec'

describe "the views for companies", :type => :request do
  describe "when logged in as a user" do
    before(:all) do
      @user = Fabricate(:user_with_companies_with_details)
      login_as(@user)
    end

    describe "when looking at the list of companies" do
      before(:each) do
        visit companies_path
      end

      it "should display companies associated with this user" do
        @user.companies.each do |company|
          page.should have_link("company_#{company.id}")
        end
      end

      it "should not display companies associated with another user" do
        @user_2 = Fabricate(:user_with_companies)
        visit(companies_path)
        @user_2.companies.each do |company|
          page.should_not have_link("company_#{company.id}")
        end                
      end

      it "should display email addresses" do
        @user.companies.each do |company|
          company.email_addresses.each do |email_address|
            page.should have_selector('li', :text => email_address.address)
          end
        end
      end

      it "should display phone numbers" do
        @user.companies.each do |company|
          company.phone_numbers.each do |phone_number|
            page.should have_selector('li', :text => phone_number.number)
          end
        end
      end
    end

    describe "when looking at a single company" do
      before(:each) do
        @company = @user.companies.first
        visit company_path(@company)
      end

      it "should have delete links for each email address" do
        @company.email_addresses.each do |email_address|
          page.should have_link("delete_email_address_#{email_address.id}")
        end
      end

      it "should have an add email address link" do
        page.should have_link("new_email_address")      
      end

      it "should go to the new email address form when the link is clicked" do
        click_link "new_email_address"
        current_path.should == new_email_address_path
      end

      it "should display each of the email addresses" do
        @company.email_addresses.each do |email_address|
          page.should have_selector('li', :text => email_address.address)
        end
      end

      it "should have edit links for each phone number" do        
        @company.phone_numbers.each do |phone_number|
          page.should have_link("edit", :href => edit_phone_number_path(phone_number))
        end
      end

      it "should have an add phone number link" do
        page.should have_link("new_phone_number")
      end

      it "should display each of the phone numbers" do
        @company.phone_numbers.each do |phone_number|
          page.should have_selector('li', :text => phone_number.number)
        end
      end

      it "should have delete links for each phone number" do
        @company.phone_numbers.each do |phone_number|
          page.should have_link("delete", :href => phone_number_path(phone_number))
        end      
      end

      it "should show the company after deleting a phone number" do
        target = @company.phone_numbers.first
        page.click_link("delete_phone_number_#{target.id}")
        current_path.should == company_path(@company)
        page.should_not have_link("delete", :href => phone_number_path(target))
      end

      it "should show the company including the new number after creating a phone number" do
        page.click_link("new_phone_number")
        sample_number = "3334445555"
        page.fill_in("phone_number_number", :with => sample_number)
        page.click_button("phone_number_submit")
        current_path.should == company_path(@company)
        page.should have_selector('li', :text => sample_number)
      end

      it "should show the company including the updated number after editing a phone number" do
        target = @company.phone_numbers.first
        original_number = target.number
        new_number = original_number.reverse
        page.click_link("edit_phone_number_#{target.id}")
        current_path.should == edit_phone_number_path(target)
        page.fill_in("phone_number_number", :with => new_number)
        page.click_button("phone_number_submit")
        current_path.should == company_path(@company)
        page.should have_selector('li', :text => new_number)
      end

      it "should show the company after deleting an email address" do
        target = @company.email_addresses.first
        page.click_link("delete_email_address_#{target.id}")
        current_path.should == company_path(@company)
        page.should_not have_link("delete_email_address_#{target.id}")
      end
    end  
  end
end