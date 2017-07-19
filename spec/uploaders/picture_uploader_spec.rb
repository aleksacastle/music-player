require "rails_helper"
require "carrierwave/test/matchers"
describe PictureUploader do
  include CarrierWave::Test::Matchers
  let(:picture) { FactoryGirl.create(:picture) }
  it "has the correct format" do
    expect(picture.file.filename).to eq("mypic.jpg")
  end
end
