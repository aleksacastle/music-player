class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :imageable, polymorphic: true

  validates_processing_of :picture
  validate :picture_size_validation

  private
    def picture_size_validation
      errors[:picture] << "should be less than 500KB" if picture.size > 0.5.megabytes
    end
end
