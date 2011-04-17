require File.dirname(__FILE__) + '/../spec_helper'

describe Person do
  it "should be valid" do
    Person.new.should be_valid
  end
end
