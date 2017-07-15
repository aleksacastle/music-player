# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  title      :string
#  file_cover :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require "rails_helper"

RSpec.describe Playlist, type: :model do
  context "has_and_belongs_to_many" do
    it { should have_and_belong_to_many(:songs) }
  end
end
