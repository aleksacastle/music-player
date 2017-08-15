require "rails_helper"
include RequestsHelper

describe "Artist" do
  let(:artist) { FactoryGirl.create(:user, role: 1) }

  scenario "has been created with relevant role" do
    manual_sign_up
    expect(page).to have_content("Welcome! You have signed up successfully.")
    click_on "Log out"
    expect(User.first.role).to eq("artist")
    expect(current_path).to eq("/users/sign_in")
  end

  scenario "is able to create new album" do
    manual_sign_in(artist)
    create_album
    expect(page).to have_content("Album was successfully created.")
  end

  scenario "is able to add new song to album" do
    manual_sign_in(artist)
    create_album
    album = Album.first
    create_song
    expect(page).to have_content("Song was successfully created.")
  end
end
