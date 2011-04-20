class Company < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  has_many :phone_numbers, :as => :contact
  has_many :email_addresses, :as => :contact
end
