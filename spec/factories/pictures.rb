FactoryGirl.define do
  factory :picture do
    name "mypic"
    # imageable_id 1
    # imageable_type "vav"
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec", "fixtures", "myfiles", "mypic.jpg")) }
  end
end
