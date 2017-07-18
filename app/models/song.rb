# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  title       :string
#  artist      :string
#  duration    :integer
#  album_id    :integer
#  playlist_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  file        :string
#

class Song < ApplicationRecord
  mount_uploader :file, SongUploader

  has_and_belongs_to_many :genres, optional: true
  has_and_belongs_to_many :playlist
  belongs_to :album, optional: true

  validates :title, :artist, presence: true
  # file to add file validation later with uploader
  # validates :file, file_size: { less_than: 10.megabytes },
  # file_content_type: { allow: ["audio/mpeg", "audio/mpeg3", "audio/midi", "audio/mp3"] }
end
