require 'spec_helper'

describe User do
  before(:each) do
    @user = Fabricate(:user)
  end
  
  it "should have associated people" do
    @user.people.should be_instance_of(Array)
  end
  
  it "should build associated people" do
    person_1 = Fabricate(:person)
    person_2 = Fabricate(:person)
    [person_1, person_2].each do |person|
      @user.people.should_not include(person)
      @user.people << person
      @user.people.should include(person)
    end
  end
  
  it "should build associated companies" do
    company_1 = Fabricate(:company)
    company_2 = Fabricate(:company)
    [company_1, company_2].each do |company|
      @user.companies.should_not include(company)
      @user.companies << company
      @user.companies.should include(company)
    end
  end
end
