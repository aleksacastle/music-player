# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryGirl.define do
  factory :album do
    title Faker::Music.chord
    file_cover Faker::Avatar.image
    picture Rails.root + "public/uploads/picture/file/1/mypic.jpg"
  end
end
