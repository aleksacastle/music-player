require "rails_helper"
require "carrierwave/test/matchers"
describe SongUploader do
  include CarrierWave::Test::Matchers
  let(:song) { FactoryGirl.create(:song) }
  it "has the correct format" do
    expect(song.file.filename).to eq("mysong.mp3")
  end
end
