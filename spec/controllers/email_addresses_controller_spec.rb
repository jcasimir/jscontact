# require File.dirname(__FILE__) + '/../spec_helper'
# 
# describe EmailAddressesController do
#   fixtures :all
#   render_views
# 
#   it "index action should render index template" do
#     get :index
#     response.should render_template(:index)
#   end
# 
#   it "show action should render show template" do
#     get :show, :id => EmailAddress.first
#     response.should render_template(:show)
#   end
# 
#   it "new action should render new template" do
#     get :new
#     response.should render_template(:new)
#   end
# 
#   it "create action should render new template when model is invalid" do
#     EmailAddress.any_instance.stubs(:valid?).returns(false)
#     post :create
#     response.should render_template(:new)
#   end
# 
#   it "create action should redirect when model is valid" do
#     EmailAddress.any_instance.stubs(:valid?).returns(true)
#     post :create
#     response.should redirect_to(email_address_url(assigns[:email_address]))
#   end
# 
#   it "edit action should render edit template" do
#     get :edit, :id => EmailAddress.first
#     response.should render_template(:edit)
#   end
# 
#   it "update action should render edit template when model is invalid" do
#     EmailAddress.any_instance.stubs(:valid?).returns(false)
#     put :update, :id => EmailAddress.first
#     response.should render_template(:edit)
#   end
# 
#   it "update action should redirect when model is valid" do
#     EmailAddress.any_instance.stubs(:valid?).returns(true)
#     put :update, :id => EmailAddress.first
#     response.should redirect_to(email_address_url(assigns[:email_address]))
#   end
# 
#   it "destroy action should destroy model and redirect to index action" do
#     email_address = EmailAddress.first
#     delete :destroy, :id => email_address
#     response.should redirect_to(email_addresses_url)
#     EmailAddress.exists?(email_address.id).should be_false
#   end
# end
