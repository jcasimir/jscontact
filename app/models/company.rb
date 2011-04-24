class Company < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name 
  belongs_to :user 
  include Contact
  
  def to_s
    name
  end
end
