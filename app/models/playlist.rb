# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  title      :string
#  file_cover :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Playlist < ApplicationRecord
  has_and_belongs_to_many :songs
  has_many :genres, through: :songs
  belongs_to :user
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture

  validates :title, :file_cover, presence: true
end
