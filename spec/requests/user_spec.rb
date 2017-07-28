require 'rails_helper'

describe 'User' do

  it 'has been created' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'auto1@auto.ua'
    fill_in 'Password', with: 'auto1@auto.ua'
    fill_in 'Password confirmation', with: 'auto1@auto.ua'
    click_on 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    click_on 'Log out'
    expect(current_path).to eq('/users/sign_in')
  end

  it 'is logged in' do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit playlists_path
    expect(page).to have_content('Add new playlist')
  end

  it 'is not logged in' do
    visit playlists_path
    expect(current_path).to eq('/users/sign_in')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end