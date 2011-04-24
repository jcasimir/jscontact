require File.dirname(__FILE__) + '/../spec_helper'

describe Company do
  before(:each) do
    @company = Fabricate(:company)
  end
  
  it "should be valid" do
    @company.should be_valid
  end
  
  it "should not be valid without a name" do
    @company.name = nil
    @company.should_not be_valid
  end
  
  it "should have an array of phone numbers" do
    @company.phone_numbers.class.should == Array    
  end
  
  it "should respond with its phone numbers after they're created" do
    phone_number = @company.phone_numbers.build(:number => "2223334444")
    @company.phone_numbers.should include(phone_number)
  end
  
  it "should have an array of email addresses" do
    @company.email_addresses.should be_an_instance_of(Array)
  end
  
  it "should respond with its email addresses after they're created" do
    email_address = @company.email_addresses.build(:address => "john@doe.com")
    @company.email_addresses.should include(email_address)
    @company.should be_valid
  end
end
