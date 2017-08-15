require "rails_helper"

describe PlaylistsController, type: :controller do

  login_user

  let(:playlist) { FactoryGirl.create(:playlist, user_id: User.first.id) }

  it "GET show" do
    get :show, params: { playlist: { id: playlist.id } }
    expect(response.status).to eq(200)
  end

  it "POST create" do
    post :create, params: { playlist: { title: "test_playlist" } }
    expect(response.status).to eq(302)
    expect(Playlist.first.title).to eq("test_playlist")
  end

  it "PUT update" do
    put :update, params: { playlist: { id: playlist.id, title: "updated_playlist" } }
    expect(response.status).to eq(302)
    expect(response).to redirect_to(playlists_url)
    expect(Playlist.first.title).to eq("updated_playlist")
  end

  it "DELETE playlist" do
    delete :destroy, params: { id: playlist.id }
    expect(response).to redirect_to(playlists_url)
    expect(Playlist.all).to be_empty
  end

end
