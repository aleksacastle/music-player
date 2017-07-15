FactoryGirl.define do
  factory :song do
    title Faker::StarWars.wookie_sentence
    artist Faker::StarWars.character
    album FactoryGirl.create(:album)
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec", "fixtures", "myfiles", "mysong.mp3")) }
  end
end
