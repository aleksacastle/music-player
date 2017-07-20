require "rails_helper"

describe SongsController, type: :controller do

  let(:song) {FactoryGirl.create(:song)}

  login_user

  it 'GET show' do
    get :index
    expect(response.status).to eq(200)
  end

end