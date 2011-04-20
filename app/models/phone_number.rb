class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :contact_id, :contact_type
  belongs_to :contact, :polymorphic => true
  
  validates_presence_of :number, :contact
end
