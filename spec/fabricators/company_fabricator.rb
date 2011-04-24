Fabricator(:company) do
  name "Sample Company"
  user!
end

Fabricator(:company_with_details, :from => :company) do
  email_addresses!(:count => 2){|company, i| Fabricate(:email_address, :address => "sample_#{i}@sample.com", :contact => company)}
  phone_numbers!(:count => 2){|company, i| Fabricate(:phone_number, :number => "#{i.to_s*10}", :contact => company)}
end