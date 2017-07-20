require "rails_helper"

describe PlaylistsController, type: :controller do

  let(:playlist) {FactoryGirl.create(:playlist)}

  login_user

  it 'GET show' do
    get :show
    expect(response.status).to eq(200)
  end

end