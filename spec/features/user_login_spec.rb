require 'rails_helper'

feature 'User can login and logout:' do
  before :each do
    visit root_path
  end

  scenario 'not logged-in user sees sign-up button and sign-in button' do
    expect(page).to have_link('Sign In')
    expect(page).to_not have_link('Sign Out')
  end

  scenario 'not logged-in user can not see guild import form' do
    expect(page).to_not have_content('Guildname')
    expect(page).to_not have_content('Realm')
  end

  describe "Log In" do
    it "can sign in user with Battle Net account" do
      page.should have_content("Sign In")
      click_link "Sign In"
      page.should have_content("Log out")
    end
  end
end
