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
#  nick_name  :string
#  role       :integer          default("user")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to define_enum_for(:role).with(%i[user artist admin]) }
  it { is_expected.to have_db_column(:email) }
  it { is_expected.to have_db_column(:first_name) }
  it { is_expected.to have_db_column(:last_name) }
  it { is_expected.to have_db_column(:nick_name) }
  it { is_expected.to have_db_column(:role) }
  it { is_expected.to have_many(:playlists) }
  it { is_expected.to have_many(:songs) }
  it { is_expected.to have_db_column(:avatar) }

end
