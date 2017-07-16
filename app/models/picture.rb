class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :imageable, polymorphic: true
end
