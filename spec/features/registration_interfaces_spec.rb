require 'rails_helper'

#_______________________________________________________________________________
#_______________________________________________________________________________

RSpec.feature "RegistrationInterfaces", type: :feature do
  describe "GET #index" do
    it "can go to a web site" do
      visit "/"
      expect(page).to have_content("Welcome, Please enter your information into the form")
  end

#_______________________________________________________________________________
#_______________________________________________________________________________

    it "where I am presented with a registration form containing the following fields where user ID and password are required:" do
      visit "/"
      expect(page).to have_field("full_name")
      expect(page).to have_field("address")
      expect(page).to have_field("city")
      expect(page).to have_field("state")
      expect(page).to have_field("zip_code")
      expect(page).to have_field("email")
      expect(page).to have_field("user_name")
      expect(page).to have_field("password")
      expect(page).to have_field("phone1")
      expect(page).to have_field("phone2")
      expect(page).to have_field("phone3")
      expect(page).to have_field("country")
    end

#_______________________________________________________________________________
#_______________________________________________________________________________

    it "can go to the registration from and register, which will take me to a confirmation page." do
      user_info
      click_button 'Submit'
      expect(page).to have_current_path('/welcome/login')
    end

#_______________________________________________________________________________
#_______________________________________________________________________________

    it "can login into the web site by providing user ID and password. If log in is successful, I am taken to a page", js: true do
      user_info
      visit '/welcome/login'
      fill_in('user_name', with: 'YosefR')
      fill_in('password', with: 'Joey12')
      expect(page).to have_field("user_name", with: 'YosefR')
      expect(page).to have_field("password", with: 'Joey12')
      click_button 'Submit'
      expect(page).to have_content("Login success:")
    end

#_______________________________________________________________________________
#_______________________________________________________________________________

    it ""






  end
#_______________________________________________________________________________
end


#_______________________________________________________________________________
#_______________________________________________________________________________

def user_info
  visit "/"
  fill_in('full_name', with: 'Yosef Rosenberg')
  fill_in('address', with: '101 Front Street')
  fill_in('city', with: 'San Diego')
  fill_in('state', with: 'CA')
  fill_in('zip_code', with: '92122')
  fill_in('email', with: 'yorose12@yahoo.com')
  fill_in('user_name', with: 'YosefR')
  fill_in('password', with: 'Joey12')
  fill_in('phone1', with: '8587366603')
  fill_in('phone2', with: '8585468309')
  fill_in('phone3', with: '8589008133')
  fill_in('country', with: 'United States')
  expect(page).to have_field('full_name', with: 'Yosef Rosenberg')
  expect(page).to have_field('address', with: '101 Front Street')
  expect(page).to have_field('city', with: 'San Diego')
  expect(page).to have_field('state', with: 'CA')
  expect(page).to have_field('zip_code', with: '92122')
  expect(page).to have_field('email', with: 'yorose12@yahoo.com')
  expect(page).to have_field('user_name', with: 'YosefR')
  expect(page).to have_field('password', with: 'Joey12')
  expect(page).to have_field('phone1', with: '8587366603')
  expect(page).to have_field('phone2', with: '8585468309')
  expect(page).to have_field('phone3', with: '8589008133')
  expect(page).to have_field('country', with: 'United States')
end

#_______________________________________________________________________________
#_______________________________________________________________________________
