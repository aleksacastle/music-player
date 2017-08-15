require "rails_helper"

describe SongsController, type: :controller do

  login_user

  let(:album) { FactoryGirl.create(:album, user_id: User.first.id) }
  let(:song) { FactoryGirl.create(:song, album_id: album.id) }

  it "GET index" do
    get :index
    expect(response.status).to eq(200)
  end

  it "POST create" do
    file = Rack::Test::UploadedFile.new(File.join(Rails.root, "spec", "fixtures", "myfiles", "test.mp3"))
    post :create, params: { album_id: album.id, song: { artist: "test_artist", title: "test_song", file: file } }
    expect(response.status).to eq(302)
    expect(Playlist.first.title).to eq("test_song")
  end

  it "PUT update" do
    file = Rack::Test::UploadedFile.new(File.join(Rails.root, "spec", "fixtures", "myfiles", "test.mp3"))
    put :update, params: { album_id: album.id, song: { id: song.id, title: "updated_song", file: file } }
    expect(response.status).to eq(302)
    expect(response).to redirect_to(playlists_url)
    expect(Playlist.first.title).to eq("updated_song")
  end

  it "DELETE song" do
    delete :destroy, params: { id: song.id }
    expect(response).to redirect_to(song_url)
    expect(Song.all).to be_empty
  end

end
