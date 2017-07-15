# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :genre do
    title Faker::StarWars.specie
  end
end
