require 'rails_helper'
include RequestsHelper

describe 'User' do

  scenario 'has been created' do
    manual_sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
    click_on 'Log out'
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'is logged in' do
    user = FactoryGirl.create(:user)
    manual_sign_in(user)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'is not logged in' do
    visit playlists_path
    expect(current_path).to eq('/users/sign_in')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end