# require 'spec_helper'
# 
# describe PhoneNumbersHelper do
#   describe "print_numbers" do
#     describe "when there is more than one phone number" do
#       before(:all) do
#         person = Person.create(:first_name => "John", :last_name => "Doe")
#         number_a = person.phone_numbers.create(:number => "1234567")
#         number_b = person.phone_numbers.create(:number => "7654321")
#         @phone_numbers = [number_a, number_b]
#       end
# 
#       # it "should output an unordered list of phone numbers" do
#       #   print_numbers(@phone_numbers).should == "<ul><li>#{@number_a.number}</li><li>#{@number_b.number}</li></ul>"
#       # end
#       
#       it "should output an unordered list with the numbers and edit links" do
#         output = print_numbers(@phone_numbers)
#         output.should match(/<ul>.*<\/ul>/)
#         @phone_numbers.each do |phone_number|
#           output.should match(/<li>#{phone_number.number}.*<\/li>/)
#         end      
#       end
#       
#       it "should have edit links for each phone number" do
#         output = print_numbers(@phone_numbers)
#         @phone_numbers.each do |phone_number|
#           output.should match(/href="#{edit_phone_number_path(phone_number)}"/)
#         end
#       end
#     end
#   
#     # describe "when there is only one phone number" do
#     #   it "should output a list with just the one phone number" do
#     #     @number_a = PhoneNumber.new(:number => "1234567")
#     #     @phone_numbers = [@number_a]
#     #     print_numbers(@phone_numbers).should == "<ul><li>#{@number_a.number}</li></ul>"
#     #   end    
#     # end
#   end
# end