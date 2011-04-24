class Company < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name  
  include Contact
  
  def to_s
    name
  end
end
