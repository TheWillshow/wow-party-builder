require 'rails_helper'

feature 'User can find guild and guildmembers' do
  before :each do
    FactoryGirl.create(
      :user,
      username: 'toothless',
      email: 'toothlessthedragon@email.com',
      password: 'password'
    )
    visit root_path
  end

  scenario 'not logged-in user can not see guild import form' do
    expect(page).to_not have_content('Guildname')
    expect(page).to_not have_content('Realm')
  end

  scenario 'logged in user can see guild import form' do
    click_on 'Sign In'
    fill_in 'Email', with: 'toothlessthedragon@email.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    expect(page).to have_content('Guildname')
    expect(page).to have_content('Realm')
  end
end
