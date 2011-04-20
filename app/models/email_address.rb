class EmailAddress < ActiveRecord::Base
  attr_accessible :address, :contact_id, :contact_type
  
  belongs_to :contact, :polymorphic => true
  
  validates_presence_of :address, :contact
end
