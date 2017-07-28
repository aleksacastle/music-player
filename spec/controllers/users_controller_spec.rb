require "rails_helper"

describe UsersController, type: :controller do

  login_user

  it 'GET show' do
    get :show, params: {id: subject.current_user.id}
    expect(response.status).to eq(200)
  end

  it 'POST create' do
    post :create, params: {playlist: {title: 'test_playlist'}}
    expect(response.status).to eq(302)
    expect(Playlist.first.title).to eq('test_playlist')
  end
  
  it 'PUT update' do
    put :update, params: {id: subject.current_user.id, user: {email: 'test@test.com'}}
    user = subject.current_user.reload
    expect(response.status).to eq(302)
    expect(user.email).to eq('test@test.com')
  end

  it 'DELETE user' do
    delete :destroy, params: {id: subject.current_user.id}
    expect(response.status).to eq(204)
  end

end
