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
