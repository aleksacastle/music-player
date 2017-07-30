module RequestsHelper

  def manual_sign_in(user)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def manual_sign_up
    visit '/users/sign_up'
    fill_in 'Email', with: 'admin@auto.ua'
    fill_in 'Password', with: 'admin@auto.ua'
    fill_in 'Password confirmation', with: 'admin@auto.ua'
    page.check('user_artist')
    click_on 'Sign Up'
  end

  def create_album
    visit albums_path
    click_on 'Create album'
    fill_in 'Title', with: 'album-test'
    page.attach_file('album_picture_attributes_file', Rails.root + 'public/uploads/picture/file/1/mypic.jpg')
    click_button 'Create Album'
  end

  def create_song
    visit '/playlists'
    click_link 'Show'
    click_link 'Add song'
    fill_in 'Artist', with: 'artist-test'
    fill_in 'Title', with: 'title-test'
    click_on 'Create Song'
  end

end
