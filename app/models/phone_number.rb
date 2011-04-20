class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id
  belongs_to :contact, :polymorphic => true
  
  validates_presence_of :number, :contact
end
