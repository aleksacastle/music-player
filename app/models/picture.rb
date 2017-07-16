class Picture < ApplicationRecord
  mount_uploader :file, PictureUploader
  belongs_to :imageable, polymorphic: true, optional: true

  validates_processing_of :file
  validate :file_size_validation

  private
    def file_size_validation
      errors[:file] << "should be less than 500KB" if file.size > 0.5.megabytes
    end
end
