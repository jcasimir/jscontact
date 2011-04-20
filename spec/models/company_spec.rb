require File.dirname(__FILE__) + '/../spec_helper'

describe Company do
  before(:each) do
    @company = Company.new(:name => "Sample Corp")
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
  
end
