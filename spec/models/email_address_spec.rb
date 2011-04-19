require File.dirname(__FILE__) + '/../spec_helper'

describe EmailAddress do
  it "should be valid" do
    EmailAddress.new.should be_valid
  end
end
