# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  file_cover :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require "rails_helper"

RSpec.describe Album, type: :model do
  let(:album) { build(:album) }

  context "belongs to user" do
    it do
      should belong_to(:user)
    end
  end

  context "has many songs" do
    it do
      should have_many(:songs).dependent(:destroy)
    end
  end

  context "validate album" do
    it "tittle" do
      album.title = "My Album"
      expect(album.title).to eq("My Album")
    end

    it "file_cover" do
      album.file_cover = "/path_to/file.jpg"
      expect(album.file_cover).to eq("/path_to/file.jpg")
    end
  end

  context "validate album" do
    it "tittle" do
      title = album.title = "My Album"
      expect(title).to eq("My Album")
    end
  end
end
