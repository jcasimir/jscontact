Fabricator(:user) do
  name "Sample User"
  provider "twitter"
  uid {Fabricate.sequence(:uid)}
end

Fabricator(:user_with_people, :from => :user) do
  people!(:count => 3){|user, i| Fabricate(:person, :first_name => "Sample", :last_name => "Person #{i}", :user => user) }
end

Fabricator(:user_with_people_with_details, :from => :user) do
  people!(:count => 3){|user, i| Fabricate(:person_with_details, :first_name => "Sample", :last_name => "Person #{i}", :user => user) }
end

Fabricator(:user_with_companies, :from => :user) do
  companies!(:count => 3){|user, i| Fabricate(:company, :name => "Company #{i}", :user => user) }
end

Fabricator(:user_with_companies_with_details, :from => :user) do
  companies!(:count => 3){|user, i| Fabricate(:company_with_details, :name => "Company #{i}", :user => user) }
end