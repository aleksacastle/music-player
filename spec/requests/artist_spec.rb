require 'rails_helper'
require 'pry'

describe 'Artist' do

  it 'has been created with relevant role' do
    binding.pry
    visit '/users/sign_up'
    fill_in 'Email', with: 'admin@auto.ua'
    fill_in 'Password', with: 'admin@auto.ua'
    fill_in 'Password confirmation', with: 'admin@auto.ua'
    page.check('user_artist')
    click_on 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    click_on 'Log out'
    expect(current_path).to eq('/users/sign_in')
  end

  it 'is able to create new album' do
    artist = FactoryGirl.create(:user,role: 1)
    visit '/users/sign_in'
    fill_in 'Email', with: artist.email
    fill_in 'Password', with: artist.password
    click_button 'Log in'
    visit albums_path
    click_on 'Add new playlist'
    fill_in 'Title', with: 'album-test'
    click_on 'Create'
    expect(page).to have_content('album-test')
  end

  it 'is not logged in'
    artist = FactoryGirl.create(:user,role: 1)
    album = FactoryGirl.create(:album)
    visit '/users/sign_in'
    fill_in 'Email', with: artist.email
    fill_in 'Password', with: artist.password
    click_button 'Log in'
    click_button 'Add new song'
    fill_in 'Title', with: 'song-test'
    click_on 'Create'
    expect(page).to have_content('song-test')
  end
end
