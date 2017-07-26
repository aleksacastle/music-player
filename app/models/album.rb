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

class Album < ApplicationRecord
  has_many :songs, dependent: :destroy

  belongs_to :user
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture

  validates :title, presence: true # move to the form object using ActiveRecord::Model
end
