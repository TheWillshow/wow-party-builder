require 'rails_helper'

feature 'User can login and logout:' do
  before :each do

    visit root_path
  end

  scenario 'not logged-in user sees sign-up button and sign-in button' do
    expect(page).to have_link('Sign In')
    expect(page).to_not have_link('Sign Out')
  end

end
