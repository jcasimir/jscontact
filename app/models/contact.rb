module Contact
  extend ActiveSupport::Concern
  
  included do
    has_many :phone_numbers, :as => :contact  
    has_many :email_addresses, :as => :contact
  end
end