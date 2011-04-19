class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  
  validates_presence_of :first_name, :last_name
  
  has_many :phone_numbers
end
