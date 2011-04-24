Fabricator(:person) do
  first_name "John"
  last_name "Doe"
  user!
end

Fabricator(:person_with_details, :from => :person) do
  email_addresses!(:count => 2){|person, i| Fabricate(:email_address, :address => "sample_#{i}@sample.com", :contact => person)}
  phone_numbers!(:count => 2){|person, i| Fabricate(:phone_number, :number => "#{i.to_s*10}", :contact => person)}
end