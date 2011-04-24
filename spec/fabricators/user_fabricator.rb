Fabricator(:user) do
  name "Sample User"
  provider "twitter"
  uid "123"
end

Fabricator(:user_with_people, :from => :user) do
  people!(:count => 3){|user, i| Fabricate(:person, :first_name => "Sample", :last_name => "Person #{i}", :user => user) }
end

Fabricator(:user_with_people_with_details, :from => :user) do
  people!(:count => 3){|user, i| Fabricate(:person_with_details, :first_name => "Sample", :last_name => "Person #{i}", :user => user) }
end