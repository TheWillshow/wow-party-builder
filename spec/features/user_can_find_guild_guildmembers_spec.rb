require 'rails_helper'

feature 'User can find guild and guildmembers' do
  before :each do
    visit root_path
    click_link "Sign In"
  end

  scenario 'logged in user can see guild import form' do

    expect(page).to have_content('Guildname')
    expect(page).to have_content('Realm')
  end

  scenario 'logged in user can input guild and server to find guild' do

    fill_in 'guild_guild_name', with: 'Last Pull'
    select 'Illidan', from: 'guild[realm]'
    click_on 'Submit'

    expect(page).to have_content('Guild has been imported')
  end
end
