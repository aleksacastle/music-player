# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  name           :string
#  imageable_id   :integer
#  imageable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  file           :string
#

FactoryGirl.define do
  factory :picture do
    name "mypic"
    # imageable_id 1
    # imageable_type "vav"
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec", "fixtures", "myfiles", "mypic.jpg")) }
  end
end
