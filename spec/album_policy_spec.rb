require "rails_helper"

describe AlbumPolicy do
  subject { AlbumPolicy.new(current_user, album) }

  let(:album) { Album.create }

  context "for artist" do
    let(:current_user) { FactoryGirl.create(:user) }

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:destroy) }
  end

  context "for user" do
    let(:current_user) { FactoryGirl.create(:user, role: 0) }

    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to permit_action(:show) }
  end
end
