# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  role                   :integer
#  avatar                 :string
#  first_name             :string
#  last_name              :string
#  nick_name              :string
#  provider               :string
#  uid                    :string
#

require "rails_helper"

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  it { is_expected.to define_enum_for(:role).with(%i[user artist admin]) }
  it { is_expected.to have_db_column(:email) }
  it { is_expected.to have_db_column(:first_name) }
  it { is_expected.to have_db_column(:last_name) }
  it { is_expected.to have_db_column(:nick_name) }
  it { is_expected.to have_db_column(:role) }
  it { is_expected.to have_many(:playlists) }
  it { is_expected.to have_many(:songs) }
  it { is_expected.to have_db_column(:avatar) }

  it "should be able to update info" do
    user.update(email: "test@test.test", nick_name: "Nick", first_name: "First", last_name: "Last")
    expect(user.email).to include("test@test.test")
    expect(user.nick_name).to include("Nick")
    expect(user.first_name).to include("First")
    expect(user.last_name).to include("Last")
  end
end
