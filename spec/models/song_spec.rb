# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  title       :string
#  artist      :string
#  duration    :integer
#  album_id    :integer
#  playlist_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  file        :string
#

require "rails_helper"

RSpec.describe Song, type: :model do

  context "belongs_to" do
    it { should belong_to(:album) }
  end

  context "has_and_belongs_to_many" do
    it { should have_and_belong_to_many(:genres) }
    it { should have_and_belong_to_many(:playlist) }
  end

  # context 'validation' do
  #   it { should validate_presence_of(:title) }
  #   it { should validate_presence_of(:artist) }
  # end
end
