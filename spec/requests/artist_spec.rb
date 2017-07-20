require 'rails_helper'

describe 'Artist' do

  it 'has been created with relevant role' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'admin@auto.ua'
    fill_in 'Password', with: 'admin@auto.ua'
    fill_in 'Password confirmation', with: 'admin@auto.ua'
    page.check('user_artist')
    click_on 'Sign Up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    click_on 'Log out'
    expect(User.first.role).to eq('artist')
    expect(current_path).to eq('/users/sign_in')
  end

  it 'is able to create new album' do
    artist = FactoryGirl.create(:user,role: 1)
    visit '/users/sign_in'
    fill_in 'Email', with: artist.email
    fill_in 'Password', with: artist.password
    click_button 'Log in'
    visit albums_path
    click_on 'Create album'
    fill_in 'Title', with: 'album-test'
    page.attach_file('album_picture_attributes_file', Rails.root + 'public/uploads/picture/file/1/mypic.jpg')
    click_button 'Create Album'
    expect(page).to have_content('Album was successfully created.')
  end

  it 'is able to add new song to album' do
    artist = FactoryGirl.create(:user,role: 1)
    album = FactoryGirl.create(:album, user_id: artist.id)
    visit '/users/sign_in'
    fill_in 'Email', with: artist.email
    fill_in 'Password', with: artist.password
    click_button 'Log in'
    visit albums_path
    click_link 'Show'
    click_link 'Add song'
    fill_in 'Artist', with: 'artist-test'
    fill_in 'Title', with: 'title-test'
    click_on 'Create Song'
    expect(page).to have_content('Song was successfully created.')
  end
end
