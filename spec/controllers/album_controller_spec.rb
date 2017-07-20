require "rails_helper"

describe AlbumsController, type: :controller do

  let(:album) {FactoryGirl.create(:album)}

  login_user

  it 'GET show' do
    get :index
    expect(response.status).to eq(200)
  end

end