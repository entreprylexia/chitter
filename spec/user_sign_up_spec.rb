require 'spec_helper'

feature "User signs up" do
  
  scenario "when being logged out" do    
    lambda { sign_up }.should change(User, :count).by(1)    
    expect(page).to have_content("Welcome, ecomba@makersacademy.com")
    expect(User.first.email).to eq("ecomba@makersacademy.com")        
  end

  def sign_up(name = "Enrique Comba Riepenhausen", email = "ecomba@makersacademy.com", 
              password = "s3cr3t")
    visit '/users/new'
    fill_in :name, :with => name
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end

end