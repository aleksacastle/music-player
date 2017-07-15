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

FactoryGirl.define do
  factory :album do
    title Faker::Music.chord
    file_cover Faker::Avatar.image
  end
end
