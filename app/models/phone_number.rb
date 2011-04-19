class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id
  belongs_to :person
  
  validates_presence_of :number, :person
end
